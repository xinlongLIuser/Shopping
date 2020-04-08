package com.qhit.baseUserRole.dao;


import com.qhit.baseUserRole.pojo.BaseUserRole;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseUserRoleMapper {
    int deleteByPrimaryKey(Integer urid);

    int insert(BaseUserRole record);

    int insertSelective(BaseUserRole record);

    BaseUserRole selectByPrimaryKey(Integer urid);

    int updateByPrimaryKeySelective(BaseUserRole record);

    int updateByPrimaryKey(BaseUserRole record);

    int deleteUid(Integer uid);

    int insertBatch(List list);

}