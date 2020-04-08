package com.qhit.basedept.dao;

import com.qhit.basedept.pojo.Basedept;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BasedeptMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Basedept record);

    int insertSelective(Basedept record);

    Basedept selectByPrimaryKey(Integer deptId);

    int updateByPrimaryKeySelective(Basedept record);

    int updateByPrimaryKey(Basedept record);
    List findAll();

    List findById(Object id);

    List<Basedept> search(Basedept baseDept);

    List findByDeptName(Object deptName);


}