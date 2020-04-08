package com.qhit.adminuser.service;

import com.qhit.adminuser.pojo.AdminUser;
import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.utils.page.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
public interface AdminuserService  {
    boolean deleteByPrimaryKey(Integer uid);

    boolean insert(AdminUser record);

    boolean insertSelective(AdminUser record);

    AdminUser selectByPrimaryKey(Integer uid);

    boolean updateByPrimaryKeySelective(AdminUser record);

    boolean updateByPrimaryKey(AdminUser record);

    AdminUser login(AdminUser user);


    /*
    列表
     */
    List selectByList();
    /*
    查找密码
     */
    boolean oldPassword(AdminUser user);

//    Pagination<AdminUser> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize);

//    List<AdminUser>selecctByIdList(Integer uid);
List<BaseRole> distributeLeft(AdminUser baseUser);

    List<BaseRole> distributeRight(AdminUser baseUser);

//    跟新权限

    void distributeUpdate(Integer userId, String[] rids);

    List<AdminUser> search(AdminUser adminUser);


}
