package com.uneti.doan.common;

import com.uneti.doan.common.model.Model;
import com.uneti.doan.common.model.TestModel;
import com.uneti.doan.common.model.P;
import com.uneti.doan.repo.ModelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.*;

@Component
@Scope(value = "prototype")
public class NaiveBayes {

    private final ModelRepository modelRepository;

    private final List<P> pList = new LinkedList<>();
    private final List<P> cList = new LinkedList<>();
    private boolean zero = false;

    public NaiveBayes(ModelRepository modelRepository) {
        this.modelRepository = modelRepository;
    }

    public void initP() throws NoSuchFieldException {
        /*
        Map là dạng dữ liệu key-value:
        a: 1
        - a là key
        - 1 là value

        Set là mảng dữ liệu có giá trị không trùng nhau
        - a,b,c,d là Set
        - a,a,a,c không phải là Set mà là List

        */
        List<Model> modelList = modelRepository.findAll();

        Map<String, Set<String>> valueModel = new HashMap<>();

        /*
            Lấy ra các trường của Model
            nhietDo, doAm, result
        */
        Field[] modelField = Model.class.getDeclaredFields();

        for (Field field : modelField) {
            field.setAccessible(true);
            Set<String> temp = new HashSet<>();
            for (Model m : modelList) {
                try {
                    /*
                        temp: Set
                        field.get(m).toString() : lấy ra giá trị của field
                        xong rồi add thêm nó vào Set
                     */
                    temp.add(field.get(m).toString());
                } catch (IllegalAccessException ignored) {
                }
            }
            /*
                valueModel: Map<String, Set<String>>
                field.getName(): Set<String>
                nhietDo: cao, thap ,bt
                doAm:  cao, thap ,bt
                result: nang, mua
             */
            valueModel.put(field.getName(), temp);
        }

        Field resultField = Model.class.getDeclaredField("result");
        resultField.setAccessible(true);
        /*
            valueModel: Map<String, Set<String>>
            resultField.getName(): "result"
            valueModel.get("result") :
            => Set<String> valueResult: nang, mua
         */
        Set<String> valueResult = valueModel.get(resultField.getName());

        /*
            forEach: lặp valueResult


         */
        valueResult.forEach(v -> {

            // đếm số "nắng" , "mưa"
            long count = modelList.stream().filter(m -> m.getResult().equals(v)).count();
            // modelList: tổng nắng mưa
            int size = modelList.size();
            double valueP;
            if (zero) {
                //tính ước lượng
                valueP = ((float) (count + 1)) / (size + valueResult.size());
            } else {
                // tính bình thường
                valueP = ((float) count) / size;
            }
            // valueP : giá trị C1 / Nắng , C2 / Mưa
            P p = new P("C", "", v, valueP);
            cList.add(p);
        });

        // Lặp nhiệt độ, độ ẩm
        for (Field field : modelField) {
            field.setAccessible(true);
            if (field.getName().equals("result") || field.getName().equals("id")) {
                continue;
            }
            // lặp result
            for (String result : valueResult) {
                //đếm giá trị
                long countResult = modelList.stream().filter(m -> m.getResult().equals(result)).count();
                long countValue;
                Set<String> valueThisField = valueModel.get(field.getName());

                // lặp giá trị: thấp cao bt
                for (String value : valueThisField) {
                    //đếm số lần thấp cao bt
                    countValue = modelList.stream().filter(m -> {
                        try {
                            return m.getResult().equals(result) && field.get(m).toString().equals(value);
                        } catch (IllegalAccessException illegalAccessException) {
                            return false;
                        }
                    }).count();
                    double valueP;
                    if (zero) {
                        // tính kiểu ước lượng
                        valueP = ((float) (countValue + 1)) / (countResult + valueThisField.size());
                    } else {
                        // tính bình thường
                        valueP = ((float) countValue) / countResult;
                    }
                    if (valueP == 0) {
                        // set cả chương trình tính ước lượng ( zero = true)
                        zero = true;
                        // xoá đi hết
                        pList.clear();
                        cList.clear();
                        //tính lại
                        initP();
                        return;
                    }
                    /*
                        field.getName(): nhiet do, do am
                        value: thap cao bt ( cho no ve dạng chữ thường ko viết hoa VD: THẤp -> thấp)
                        valueP : VD: P(thấp/nắng) 1/3
                     */
                    P p = new P(field.getName(), value, result, valueP);
                    // thêm vào mảng p
                    pList.add(p);
                }
            }
        }

    }

    /**
     * Model:
     * - nhietDo: thap
     * - doAm: bt
     */
    public P predict(Model model) {
        if (cList.isEmpty() || pList.isEmpty() || model == null) {
            return null;
        } else {
            /*
                Map<P, Double> predictPercent
                Double: là kiểu 1.0212321321
                P: tỉ lệ
             */
            Map<P, Double> predictPercent = new HashMap<>();
            Field[] modelField = Model.class.getDeclaredFields();

            // Tính tường thằng 1
            for (P c : cList) {
                double pPercent = 1;
                for (Field field : modelField) {
                    field.setAccessible(true);
                    if (field.getName().equals("result") || field.getName().equals("id")) {
                        continue;
                    }
                    // lấy ra P từ giá trị + field + C
                    double pFieldPercent = pList.stream()
                            .filter(p -> {
                                try {
                                            // lọc giá trị (thấp cao bt)
                                    return p.getX().equals(field.get(model).toString()) &&
                                            // lọc C ( nắng mưa)
                                            p.getC().equals(c.getC()) &&
                                            // lọc field (nhietDo, do AM)
                                            p.getField().equals(field.getName());
                                } catch (IllegalAccessException e) {
                                    return false;
                                }
                            })
                            .mapToDouble(P::getValue)
                            .reduce((a, b) -> {
                                throw new IllegalStateException("Multiple elements: " + a + ", " + b);
                            }).getAsDouble();

                    // Các P điều kiện nhân với nhau
                    pPercent *= pFieldPercent;
                }
                // c.getValue() * pPercent quyết định (3/7 * tổng tích các P điều kiện ở trên)
                predictPercent.put(c, c.getValue() * pPercent);
            }
            // Collections.max: lấy ra thằng lớn nhất
            return Collections.max(predictPercent.entrySet(), Comparator.comparingDouble(Map.Entry::getValue)).getKey();
        }
    }

    public List<P> getpList() {
        return pList;
    }

    public List<P> getcList() {
        return cList;
    }
}
