package com.qhit.categorysecond.service.impl;

import com.qhit.categorysecond.service.ICategorysecondService;
import java.util.List;
import com.qhit.categorysecond.dao.ICategorysecondDao;
import com.qhit.categorysecond.pojo.Categorysecond;
import org.springframework.stereotype.Service;
import javax.annotation.Resource; 

/**
* Created by GeneratorCode on 2019/04/11
*/

@Service 
public class CategorysecondServiceImpl  implements ICategorysecondService {

    @Resource 
    ICategorysecondDao dao;

    @Override 
    public boolean insert(Categorysecond categorysecond) {
        return dao.insert(categorysecond);
    } 


    @Override 
    public boolean update(Categorysecond categorysecond) {
        return dao.update(categorysecond);
    } 


    @Override 
    public boolean updateSelective(Categorysecond categorysecond) {
        return dao.updateSelective(categorysecond);
    } 


    @Override 
    public boolean delete(Integer id) {
        Categorysecond categorysecond = findById(id); 
        return dao.delete(categorysecond); 
    } 


    @Override 
    public List findAll() { 
        return dao.findAll(); 
    } 


    @Override 
    public Categorysecond findById(Integer id) {
        List<Categorysecond> list = dao.findById(id); 
        return  list.get(0); 
    } 


    @Override 
    public List<Categorysecond> search(Categorysecond categorysecond) { 
        return dao.search(categorysecond); 
    } 


}