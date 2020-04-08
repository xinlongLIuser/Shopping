package com.qhit.baseRole.dao;

import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseRole.pojo.BaseRole;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseRoleMapper {
    int deleteByPrimaryKey(Integer rid);

    int insert(BaseRole record);

    int insertSelective(BaseRole record);


    BaseRole selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(BaseRole record);

    int updateByPrimaryKey(BaseRole record);

    List findAll();
    List<BaseFunction> distributeLeft(BaseRole baseRole);
    List<BaseFunction> distributeRight(BaseRole baseRole);
}