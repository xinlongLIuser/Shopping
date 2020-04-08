package com.qhit.orderitem.service.impl;

import com.qhit.orderitem.service.IOrderitemService;

import java.util.List;

import com.qhit.orderitem.dao.IOrderitemDao;
import com.qhit.orderitem.pojo.Orderitem;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by GeneratorCode on 2019/04/14
 */

@Service
public class OrderitemServiceImpl implements IOrderitemService {

    @Resource
    IOrderitemDao dao;

    @Override
    public int insert(Orderitem orderitem) {

        return dao.insert(orderitem);

    }


    @Override
    public boolean update(Orderitem orderitem) {
        return dao.update(orderitem);
    }


    @Override
    public boolean updateSelective(Orderitem orderitem) {
        return dao.updateSelective(orderitem);
    }


    @Override
    public boolean delete(Integer id) {
        Orderitem orderitem = findById(id);
        return dao.delete(orderitem);
    }


    @Override
    public List findAll() {
        return dao.findAll();
    }


    @Override
    public Orderitem findById(Integer id) {
        List<Orderitem> list = dao.findById(id);
        return list.get(0);
    }


    @Override
    public List<Orderitem> search(Orderitem orderitem) {
        return dao.search(orderitem);
    }

    @Override
    public List<Orderitem> findOrderItemByOid(Integer oids) {
        return dao.findOrderItemByOid(oids);
    }
}