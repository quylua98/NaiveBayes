package com.uneti.doan.controller;

import com.uneti.doan.common.NaiveBayes;
import com.uneti.doan.common.model.Model;
import com.uneti.doan.common.model.P;
import com.uneti.doan.common.model.TestModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {

    private final ApplicationContext context;

    public MainController(ApplicationContext context) {
        this.context = context;
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }

    public NaiveBayes getNaiveBayes() {
        return (NaiveBayes) context.getBean("naiveBayes");
    }

    @PostMapping(value = "/process")
    public String handlePredict(org.springframework.ui.Model m, @ModelAttribute Model model) {
        try {
            NaiveBayes naiveBayes = getNaiveBayes();
            naiveBayes.initP();
            P p = naiveBayes.predict(model);
            m.addAttribute("result", p.getC());
            return "result";
        } catch (NoSuchFieldException e) {
            return "index";
        }
    }

}
