package com.qhit.orderitem.service;

import java.util.List;
import com.qhit.orderitem.pojo.Orderitem;
import org.apache.ibatis.annotations.Param;

/**
* Created by GeneratorCode on 2019/04/14
*/

public interface IOrderitemService {

    int insert(Orderitem orderitem);

    boolean  update(Orderitem orderitem);

    boolean  updateSelective(Orderitem orderitem);

    boolean delete(Integer id);

    List findAll();

    Orderitem findById(Integer id);

    List<Orderitem> search(Orderitem orderitem);

//根据订单id查询订单项集合
    List<Orderitem> findOrderItemByOid(Integer oids);

}