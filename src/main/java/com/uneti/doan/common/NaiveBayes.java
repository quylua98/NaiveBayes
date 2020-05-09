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
        //Test
//        TestModel a = new TestModel("thap", "cao", "mua");
//        TestModel b = new TestModel("thap", "thap", "mua");
//        TestModel c = new TestModel("bt", "bt", "nang");
//        TestModel d = new TestModel("cao", "cao", "nang");
//        TestModel e = new TestModel("cao", "thap", "nang");
//        List<TestModel> modelList = new LinkedList<>(Arrays.asList(a, b, c, d, e));
        List<Model> modelList = modelRepository.findAll();

        Map<String, Set<String>> valueModel = new HashMap<>();

        Field[] modelField = Model.class.getDeclaredFields();

        for (Field field : modelField) {
            field.setAccessible(true);
            Set<String> temp = new HashSet<>();
            for (Model m : modelList) {
                try {
                    temp.add(field.get(m).toString());
                } catch (IllegalAccessException ignored) {
                }
            }
            valueModel.put(field.getName(), temp);
        }

        Field resultField = Model.class.getDeclaredField("result");
        resultField.setAccessible(true);
        Set<String> valueResult = valueModel.get(resultField.getName());

        valueResult.forEach(v -> {
            long count = modelList.stream().filter(m -> m.getResult().equals(v)).count();
            int size = modelList.size();
            double valueP;
            if (zero) {
                valueP = ((float)(count + 1)) / (size + valueResult.size());
            } else {
                valueP = ((float) count) / size;
            }
            P p = new P("C", "", v.toLowerCase(), valueP);
            cList.add(p);
        });

        for (Field field : modelField) {
            field.setAccessible(true);
            if (field.getName().equals("result") || field.getName().equals("id")){
                continue;
            }
            for (String result : valueResult) {
                long countResult = modelList.stream().filter(m -> m.getResult().equals(result)).count();
                long countValue;
                Set<String> valueThisField = valueModel.get(field.getName());
                for (String value : valueThisField) {
                    countValue = modelList.stream().filter(m -> {
                        try {
                            return m.getResult().equals(result) && field.get(m).toString().equals(value);
                        } catch (IllegalAccessException illegalAccessException) {
                            return false;
                        }
                    }).count();
                    double valueP;
                    if (zero) {
                        valueP = ((float)(countValue + 1)) / (countResult + valueThisField.size());
                    } else {
                        valueP = ((float) countValue) / countResult;
                    }
                    if (valueP == 0) {
                        zero = true;
                        pList.clear();
                        cList.clear();
                        initP();
                        return;
                    }
                    P p = new P(field.getName(), value.toLowerCase(), result.toLowerCase(), valueP);
                    pList.add(p);
                }
            }
        }

    }

    public P predict(Model model) {
        if (cList.isEmpty() || pList.isEmpty() || model == null) {
            return null;
        } else {
            Map<P, Double> predictPercent = new HashMap<>();
            Field[] modelField = Model.class.getDeclaredFields();

            for (P c : cList) {
                double pPercent = 1;
                for (Field field : modelField) {
                    field.setAccessible(true);
                    if (field.getName().equals("result") || field.getName().equals("id")){
                        continue;
                    }
                    double pFieldPercent = pList.stream()
                            .filter(p -> {
                                try {
                                    return p.getX().equals(field.get(model).toString().toLowerCase()) &&
                                            p.getC().equals(c.getC()) &&
                                            p.getField().equals(field.getName());
                                } catch (IllegalAccessException e) {
                                    return false;
                                }
                            })
                            .mapToDouble(P::getValue)
                            .reduce((a, b) -> {
                                throw new IllegalStateException("Multiple elements: " + a + ", " + b);
                            }).getAsDouble();

                    pPercent *= pFieldPercent;

                }
                predictPercent.put(c, c.getValue()*pPercent);
            }

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
