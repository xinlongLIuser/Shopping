package com.qhit.orders.service;

import java.util.List;
import com.qhit.orders.pojo.Orders;
import org.apache.ibatis.annotations.Param;

/**
* Created by GeneratorCode on 2019/04/14
*/

public interface IOrdersService {

    int insert(Orders orders);

    boolean  update(Orders orders);

    boolean  updateSelective(Orders orders);

    boolean delete(Integer id);

    List findAll();

    Orders findById(Integer id);

    List<Orders> search(Orders orders);

    /**
     * 查询订单
     * @param oids
     * @return
     */
    Orders findOrderByoid(@Param("oids")Integer oids);

    /**
            * 根据userI查询订单集合
	 * @param userId
	 * @return
             */
    List<Orders> findOrderByUserId(@Param("userId")Integer userId);

}