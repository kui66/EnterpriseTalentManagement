package com.example.enterprisetalentmanagement.service;

import com.example.enterprisetalentmanagement.entity.department;
import com.example.enterprisetalentmanagement.mapper.departmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class departmentService {
    @Autowired
    private departmentMapper departmentMapper;

    public List<department> selName(){
        return departmentMapper.selName();
    }



}
