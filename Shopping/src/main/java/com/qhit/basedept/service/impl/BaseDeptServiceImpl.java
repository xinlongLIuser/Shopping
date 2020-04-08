package com.qhit.basedept.service.impl;

import java.util.List;

import com.qhit.basedept.dao.BasedeptMapper;
import com.qhit.basedept.pojo.Basedept;
import com.qhit.basedept.service.IBaseDeptService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/04/10
*/

@Service 
public class BaseDeptServiceImpl  implements IBaseDeptService {

    @Resource
    BasedeptMapper dao;

    @Override 
    public int insert(Basedept baseDept) {
        return dao.insert(baseDept);
    } 


    @Override 
    public int update(Basedept baseDept) {
        return dao.updateByPrimaryKey(baseDept);
    } 


    @Override 
    public int updateSelective(Basedept baseDept) {
        return dao.updateByPrimaryKeySelective(baseDept);
    } 


    @Override 
    public int delete(Integer id) {
       Basedept baseDept = findById(id);
       if(baseDept!=null) {
           return dao.deleteByPrimaryKey(id);
       }
       return 0;
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 
    @Override
    public Basedept findById(Integer id) {
        List<Basedept> list = dao.findById(id);
        return  list.get(0); 
    } 


    @Override 
    public List<Basedept> search(Basedept baseDept) {
        return dao.search(baseDept); 
    } 


}