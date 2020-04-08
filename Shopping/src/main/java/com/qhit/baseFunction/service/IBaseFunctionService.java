package com.qhit.baseFunction.service;

import com.qhit.baseFunction.pojo.BaseFunction;

import java.util.List;

/**
 * Created by GeneratorCode on 2018/11/28
 */

public interface IBaseFunctionService {
    boolean insert(BaseFunction baseFunction);

    boolean update(BaseFunction baseFunction);

    boolean delete(Integer id);

    List findAll();

    BaseFunction findById(Integer id);

    List<BaseFunction> findByMid(Integer mid);
    List<BaseFunction> findByroleMid(Integer mid, Integer uid);
    //查找模块
    List findmodule();
    List<BaseFunction> search(BaseFunction baseFunction);

//根据权限查找相应模块
    List<BaseFunction> findFunctionByuid(Integer uid);
}