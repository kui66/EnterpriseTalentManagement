package com.example.enterprisetalentmanagement.mapper;

import com.example.enterprisetalentmanagement.entity.department;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface departmentMapper {
    List<department> selName();


}
