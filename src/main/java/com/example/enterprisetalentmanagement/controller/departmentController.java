package com.example.enterprisetalentmanagement.controller;

import com.example.enterprisetalentmanagement.entity.department;
import com.example.enterprisetalentmanagement.service.departmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class departmentController {
    @Autowired
    private departmentService departmentService;


    @RequestMapping("/add")
    public String add(Model model){
        List<department> list = departmentService.selName();
        model.addAttribute("list",list);
        return "add";
    }


}
