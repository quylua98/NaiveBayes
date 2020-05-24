package com.uneti.doan.serivce;

import com.uneti.doan.common.model.Model;
import com.uneti.doan.repo.ModelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ModelService {

    private final ModelRepository modelRepository;

    public ModelService(ModelRepository modelRepository) {
        this.modelRepository = modelRepository;
    }


    public List<Model> findAll() {
        return modelRepository.findAll();
    }

    public static String splitWord(String s) {
        StringBuilder result = new StringBuilder();
        for (String str : s.split(" ")) {
            result.append(str.charAt(0));
        }
        return result.toString().toUpperCase();
    }

    public Set<String> getListNganh() {
        List<Model> modelList = modelRepository.findAll();
        return modelList.stream().map(Model::getResult).collect(Collectors.toSet());
    }

    public Map<String, String> getMapNganhWithFirstLetter() {
        Set<String> listNganh = this.getListNganh();
        return listNganh.stream().collect(Collectors.toMap(ModelService::splitWord, s -> s));
    }

    public Map<String, Integer> analyzeNganh() {
        List<String> resultList = modelRepository.findAll().stream().map(Model::getResult).collect(Collectors.toList());
        Set<String> distinct = new HashSet<>(resultList);
        Map<String, Integer> result = new HashMap<>();
        for (String s : distinct) {
            result.put(splitWord(s), Collections.frequency(resultList,s));
        }
        return result;
    }

}
