package com.example.enterprisetalentmanagement.mapper;

import com.example.enterprisetalentmanagement.entity.enterpriseTalent;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface enterpriseTalentMapper {
    List<enterpriseTalent> selAll(@Param("departmentId") Integer departmentId,
                                  @Param("id") Integer id);

    int insert(@Param("name") String name,
               @Param("workingLife") Integer workingLife,
               @Param("workExperience") String workExperience,
               @Param("personalProfile") String personalProfile,
               @Param("departmentId") Integer departmentId,
               @Param("graduateSchool") String graduateSchool);

    int del (@Param("id") Integer id);

    int update(@Param("id") Integer id,
               @Param("name") String name,
               @Param("workingLife") Integer workingLife,
               @Param("workExperience") String workExperience,
               @Param("personalProfile") String personalProfile,
               @Param("departmentId") Integer departmentId,
               @Param("graduateSchool") String graduateSchool);
}
