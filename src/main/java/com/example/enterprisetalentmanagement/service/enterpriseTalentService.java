package com.example.enterprisetalentmanagement.service;

import com.example.enterprisetalentmanagement.entity.enterpriseTalent;
import com.example.enterprisetalentmanagement.mapper.enterpriseTalentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class enterpriseTalentService {
    @Autowired
    private enterpriseTalentMapper enterpriseTalentMapper;

    public List<enterpriseTalent> selAll(Integer departmentId,Integer id){
        return enterpriseTalentMapper.selAll(departmentId,id);
    }

    public int insert(String name,Integer workingLife,String workExperience,String personalProfile,
                      Integer departmentId,String graduateSchool){
        return enterpriseTalentMapper.insert(name,workingLife,workExperience,personalProfile,
                departmentId,graduateSchool);
    }

    public int del(Integer id){
        return enterpriseTalentMapper.del(id);
    }

    public int update(Integer id,String name,Integer workingLife,String workExperience,String personalProfile,
                      Integer departmentId,String graduateSchool){
        return enterpriseTalentMapper.update(id,name,workingLife,workExperience,personalProfile,
                departmentId,graduateSchool);
    }
}
