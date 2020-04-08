package com.qhit.orders.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qhit.orders.pojo.Orders;
import java.util.List;

/**
* Created by GeneratorCode on 2019/04/14
*/

@Repository  
public interface IOrdersDao {

    int insert(Orders orders);

    boolean  update(Orders orders);

    boolean  updateSelective(Orders orders);

    boolean delete(Orders orders);

    List findAll();

    /**
     * 查询订单
     * @param oids
     * @return
     */
    Orders findOrderByoid(@Param("oids")Integer oids);

    List findById(Object id);

    List<Orders> search(Orders orders);

    List<Orders> findOrderByUserId(@Param("userId")Integer userId);

}