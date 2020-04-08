package com.qhit.baseRole.service;

import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseRole.pojo.BaseRole;

import java.util.List;

/**
 * Created by GeneratorCode on 2018/11/29
 */

public interface IBaseRoleService {
    List findAll();

    List<BaseFunction> distributeLeft(BaseRole baseRole);

    List<BaseFunction> distributeRight(BaseRole baseRole);

    void distributeUpdate(Integer rid, String[] array);

    //新权限增加
    void addRolFunctionRelation(int roleId, String ids);

}