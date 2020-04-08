package com.qhit.orderitem.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qhit.orderitem.pojo.Orderitem;
import java.util.List;

/**
* Created by GeneratorCode on 2019/04/14
*/

@Repository  
public interface IOrderitemDao {

    int insert(Orderitem orderitem);

    boolean  update(Orderitem orderitem);

    boolean  updateSelective(Orderitem orderitem);

    boolean delete(Orderitem orderitem);

    List findAll();

    List findById(Integer id);

    List<Orderitem> search(Orderitem orderitem);

    List findByCount(Integer count);

    List findBySubtotal(Integer subtotal);

    List findByPid(Integer pid);

    List findByOid(Integer oid);
    /**
     * 根据订单id查询订单项集合
     * @param oids
     * @return
     */
    List<Orderitem> findOrderItemByOid(@Param("oids")Integer oids);

}