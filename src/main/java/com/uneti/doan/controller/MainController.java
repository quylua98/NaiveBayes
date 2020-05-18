package com.uneti.doan.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.uneti.doan.common.NaiveBayes;
import com.uneti.doan.common.model.Model;
import com.uneti.doan.common.model.P;
import com.uneti.doan.dto.ContributeDto;
import com.uneti.doan.entity.ActivityEntity;
import com.uneti.doan.repo.ActivityRepository;
import com.uneti.doan.repo.ModelRepository;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    private final ApplicationContext context;
    private final ObjectMapper objectMapper;
    private final ActivityRepository activityRepository;
    private final ModelRepository modelRepository;

    public MainController(ApplicationContext context, ObjectMapper objectMapper, ActivityRepository activityRepository, ModelRepository modelRepository) {
        this.context = context;
        this.objectMapper = objectMapper;
        this.activityRepository = activityRepository;
        this.modelRepository = modelRepository;
    }

    public NaiveBayes getNaiveBayes() {
        return (NaiveBayes) context.getBean("naiveBayes");
    }

    @GetMapping("/")
    public String landingPage() {
        return "landing-page";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/login")
    public String login(org.springframework.ui.Model model, @RequestParam(defaultValue = "false", required = false) boolean error) {
        if(error){
            model.addAttribute("err", "Sai tên đăng nhập hoặc mật khẩu");
        }
        return "login";
    }

    @PostMapping(value = "/process")
    public String handlePredict(org.springframework.ui.Model m, @ModelAttribute Model model) {
        try {
            NaiveBayes naiveBayes = getNaiveBayes();
            naiveBayes.initP();
            P p = naiveBayes.predict(model);
            m.addAttribute("result", p.getC());
            model.setResult(p.getC());
            //Save model
            m.addAttribute("model", objectMapper.writeValueAsString(model));
            //Save activity
            ActivityEntity activityEntity = activityRepository.save(new ActivityEntity());
            m.addAttribute("activityId", activityEntity.getId());
            return "result";
        } catch (NoSuchFieldException | JsonProcessingException e) {
            return "index";
        }
    }

    @PostMapping("/contribute")
    public String contribute(@ModelAttribute ContributeDto contributeDto) throws JsonProcessingException {
        ActivityEntity activityEntity = activityRepository.getOne(contributeDto.getActivityId());
        activityEntity.setContribute(true);
        activityRepository.save(activityEntity);
        Model model = objectMapper.readValue(contributeDto.getData(),Model.class);
        modelRepository.save(model);
        return "thank";
    }

}
