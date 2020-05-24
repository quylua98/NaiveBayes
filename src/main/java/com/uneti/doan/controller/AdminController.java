package com.uneti.doan.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.uneti.doan.common.model.Model;
import com.uneti.doan.dto.ModelDto;
import com.uneti.doan.entity.ContactEntity;
import com.uneti.doan.repo.ActivityRepository;
import com.uneti.doan.repo.ContactRepository;
import com.uneti.doan.repo.ModelRepository;
import com.uneti.doan.serivce.ModelService;
import org.ocpsoft.prettytime.PrettyTime;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
@PreAuthorize("isAuthenticated()")
public class AdminController {

    private final ModelRepository modelRepository;
    private final ModelService modelService;
    private final ActivityRepository activityRepository;
    private final ContactRepository contactRepository;
    private final ObjectMapper objectMapper;

    public AdminController(ModelRepository modelRepository, ModelService modelService, ActivityRepository activityRepository, ContactRepository contactRepository, ObjectMapper objectMapper) {
        this.modelRepository = modelRepository;
        this.modelService = modelService;
        this.activityRepository = activityRepository;
        this.contactRepository = contactRepository;
        this.objectMapper = objectMapper;
    }

    @GetMapping("/")
    public String dashboard(org.springframework.ui.Model model) {
        model.addAttribute("listNganh", modelService.getMapNganhWithFirstLetter());
        //data
        model.addAttribute("counter", modelRepository.count());
        //survey
        PrettyTime p = new PrettyTime();
        model.addAttribute("activityAgo",p.format(activityRepository.getMaxDate()));
        model.addAttribute("counterActivity", activityRepository.count());
        //contact
        model.addAttribute("counterContact", contactRepository.count());
        //contribute
        model.addAttribute("counterContribute", activityRepository.countByContributeTrue(true));
        return "dashboard";
    }

    @GetMapping("/data-table")
    public String dataTable(org.springframework.ui.Model model) {
        List<Model> modelList = modelRepository.findAll();
        Map<String, List<Model>> map = modelList.stream().collect(Collectors.groupingBy(Model::getResult));
        model.addAttribute("modelMap", map);
        return "data-table";
    }

    @GetMapping("/contact-table")
    public String contactTable(org.springframework.ui.Model model) {
        List<ContactEntity> contactEntities = contactRepository.findAll();
        model.addAttribute("contacts", contactEntities);
        return "contact-table";
    }

    @GetMapping("/data-add-form")
    public String addDataForm(org.springframework.ui.Model model, @RequestParam(required = false, defaultValue = "") String q) {
        Set<String> listNganh = modelService.getListNganh();
        model.addAttribute("listNganh", listNganh);
        model.addAttribute("q", q);
        return "data-add-form";
    }

    @GetMapping("/data-edit-form")
    public String editDataForm(org.springframework.ui.Model model, @RequestParam long id) {
        Model m = modelRepository.getOne(id);
        model.addAttribute("model", m);
        return "data-edit-form";
    }

    @ResponseBody
    @DeleteMapping("/data/{id}")
    public ResponseEntity<?> editDataForm(@PathVariable long id) {
        try {
            Model m = modelRepository.getOne(id);
            modelRepository.delete(m);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }

    @ResponseBody
    @PostMapping("/data/")
    public ResponseEntity<?> saveData(@ModelAttribute ModelDto modelDto) {
        try {
            Model m = objectMapper.convertValue(modelDto, Model.class);
            modelRepository.save(m);
            return ResponseEntity.ok().build();
        } catch (Exception ignored) {
        }
        return ResponseEntity.badRequest().build();
    }
}
