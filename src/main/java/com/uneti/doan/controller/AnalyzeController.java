package com.uneti.doan.controller;

import com.uneti.doan.common.model.Model;
import com.uneti.doan.repo.ActivityRepository;
import com.uneti.doan.serivce.ModelService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/analyze")
@PreAuthorize("isAuthenticated()")
public class AnalyzeController {

    private final ModelService modelService;

    public AnalyzeController(ModelService modelService) {
        this.modelService = modelService;
    }

    @ResponseBody
    @GetMapping("/data/tuoi")
    public ResponseEntity<?> statisticTuoi() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getTuoi).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getTuoi().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/hocLuc")
    public ResponseEntity<?> statisticHocLuc() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getHocLuc).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getHocLuc().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/sucKhoe")
    public ResponseEntity<?> statisticSucKhoe() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getSucKhoe).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getSucKhoe().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/ngoaiHinh")
    public ResponseEntity<?> statisticNgoaiHinh() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getNgoaiHinh).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getNgoaiHinh().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/kinhTe")
    public ResponseEntity<?> statisticKinhTe() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getKinhTe).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getKinhTe().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/gioiTinh")
    public ResponseEntity<?> statisticGioiTinh() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getGioiTinh).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getGioiTinh().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/huongNganh")
    public ResponseEntity<?> statisticHuongNganh() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getHuongNganh).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getHuongNganh().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/tinhCach")
    public ResponseEntity<?> statisticTinhCach() {
        Map<String, Long> result = new HashMap<>();
        List<Model> modelList = modelService.findAll();
        Set<String> set = modelList.stream().map(Model::getTinhCach).collect(Collectors.toSet());
        for (String s : set) {
            long count = modelList.stream().filter(m -> m.getTinhCach().equals(s)).count();
            result.put(s, count);
        }
        return ResponseEntity.ok(result);
    }

    @ResponseBody
    @GetMapping("/data/result")
    public ResponseEntity<?> statisticListNganh() {
        return ResponseEntity.ok(modelService.analyzeNganh());
    }

}
