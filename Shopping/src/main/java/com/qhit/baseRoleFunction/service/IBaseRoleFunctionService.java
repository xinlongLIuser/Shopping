package com.qhit.baseRoleFunction.service;

import com.qhit.baseRoleFunction.pojo.BaseRoleFunction;

import java.util.List;

/**
* Created by GeneratorCode on 2018/11/29
*/

public interface IBaseRoleFunctionService {

    boolean deleteByPrimaryKey(Integer rmid);

    boolean insert(BaseRoleFunction record);

    boolean insertSelective(BaseRoleFunction record);

    BaseRoleFunction selectByPrimaryKey(Integer rmid);

    boolean updateByPrimaryKeySelective(BaseRoleFunction record);

    boolean updateByPrimaryKey(BaseRoleFunction record);
    public List<Integer> findModuleIdsByRoleId(Integer roleId);


}