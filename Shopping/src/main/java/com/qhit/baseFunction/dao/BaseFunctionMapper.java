package com.qhit.baseFunction.dao;

import com.qhit.baseFunction.pojo.BaseFunction;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BaseFunctionMapper {
    int deleteByPrimaryKey(Integer fid);

    int insert(BaseFunction record);

    int insertSelective(BaseFunction record);

    BaseFunction selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(BaseFunction record);

    int updateByPrimaryKey(BaseFunction record);

    List findAll();

//    List<BaseFunction> findByMid(Integer mid);

//    List<BaseFunction> findByroleMid(Map map);

    //查找模块
    List findmodule();

//查询
    List<BaseFunction> search(BaseFunction baseFunction);
    //查找权限
    List<BaseFunction> findFunctionByuid(Integer uid);
}