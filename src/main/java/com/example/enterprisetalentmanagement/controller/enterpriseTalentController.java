package com.example.enterprisetalentmanagement.controller;

import com.example.enterprisetalentmanagement.entity.department;
import com.example.enterprisetalentmanagement.entity.enterpriseTalent;
import com.example.enterprisetalentmanagement.service.departmentService;
import com.example.enterprisetalentmanagement.service.enterpriseTalentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class enterpriseTalentController {

    @Autowired
    private enterpriseTalentService enterpriseTalentService;

    @Autowired
    private departmentService departmentService;

    @RequestMapping("/index")
    public String index(Model model,Integer departmentId,Integer id){
        List<enterpriseTalent> list =  enterpriseTalentService.selAll(departmentId,id);
        List<department> eList = departmentService.selName();
        model.addAttribute("list",list);
        model.addAttribute("eList",eList);
        return "index";
    }

    @RequestMapping("/insert")
    @ResponseBody
    public Integer insert(String name,Integer workingLife,String workExperience,String personalProfile,
                         Integer departmentId,String graduateSchool){
        return enterpriseTalentService.insert(name,workingLife,workExperience,personalProfile,
                departmentId,graduateSchool);
    }

    @RequestMapping("/update")
    public String update(Model model,Integer departmentId,Integer id){
        List<enterpriseTalent> list =  enterpriseTalentService.selAll(departmentId,id);
        model.addAttribute("list",list);
        return "update";
    }

    @RequestMapping("del")
    @ResponseBody
    public int del(Integer id){
        return enterpriseTalentService.del(id);
    }

    @RequestMapping("/renew")
    @ResponseBody
    public int renew(Integer id,String name,Integer workingLife,String workExperience,String personalProfile,
                     Integer departmentId,String graduateSchool){
        return enterpriseTalentService.update(id,name,workingLife,workExperience,personalProfile,
                departmentId,graduateSchool);
    }


}
