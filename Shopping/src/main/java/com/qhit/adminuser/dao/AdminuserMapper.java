package com.qhit.adminuser.dao;

import com.qhit.adminuser.pojo.AdminUser;
import com.qhit.baseRole.pojo.BaseRole;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.Mapping;

import java.util.List;

@Repository
public interface AdminuserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(AdminUser record);

    int insertSelective(AdminUser record);

    AdminUser selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(AdminUser record);

    int updateByPrimaryKey(AdminUser record);

    List login(AdminUser user);
    List oldPassword(AdminUser user);
    List selectByList();

    List<BaseRole> distributeLeft(AdminUser baseUser);

    List<BaseRole> distributeRight(AdminUser baseUser);

List<AdminUser> search(AdminUser adminUser);

}