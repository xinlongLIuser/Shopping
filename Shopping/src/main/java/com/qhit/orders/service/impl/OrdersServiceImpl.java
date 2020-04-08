package com.qhit.orders.service.impl;

import com.qhit.orders.service.IOrdersService;

import java.util.List;

import com.qhit.orders.dao.IOrdersDao;
import com.qhit.orders.pojo.Orders;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by GeneratorCode on 2019/04/14
 */

@Service
public class OrdersServiceImpl implements IOrdersService {

    @Resource
    IOrdersDao dao;

    @Override
    public int insert(Orders orders) {
        return dao.insert(orders);
    }


    @Override
    public boolean update(Orders orders) {
        return dao.update(orders);
    }


    @Override
    public boolean updateSelective(Orders orders) {
        return dao.updateSelective(orders);
    }


    @Override
    public boolean delete(Integer id) {
        Orders orders = findById(id);
        return dao.delete(orders);
    }


    @Override
    public List findAll() {
        return dao.findAll();
    }


    @Override
    public Orders findById(Integer id) {
        List<Orders> list = dao.findById(id);
        return list.get(0);
    }


    @Override
    public List<Orders> search(Orders orders) {
        return dao.search(orders);
    }

    public Orders findOrderByoid(Integer oids) {
        return dao.findOrderByoid(oids);
    }

    @Override
    public List<Orders> findOrderByUserId(Integer userId) {
        return dao.findOrderByUserId(userId);
    }
}