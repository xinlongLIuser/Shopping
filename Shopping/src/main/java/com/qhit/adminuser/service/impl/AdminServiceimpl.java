package com.qhit.adminuser.service.impl;

import com.qhit.adminuser.dao.AdminuserMapper;
import com.qhit.adminuser.pojo.AdminUser;
import com.qhit.adminuser.service.AdminuserService;
import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.baseUserRole.dao.BaseUserRoleMapper;
import com.qhit.baseUserRole.pojo.BaseUserRole;
import com.qhit.utils.MD5;
import com.qhit.utils.page.BaseMybatisDao;
import com.qhit.utils.page.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service("adminuserService")
public class AdminServiceimpl  implements AdminuserService {

    @Autowired
    private  AdminuserMapper adminuserMapper;
    @Autowired
    BaseUserRoleMapper baseUserRoleMapper;

    @Override
    public boolean deleteByPrimaryKey(Integer uid) {
        AdminUser user=selectByPrimaryKey(uid);
        boolean flag = false;
        if(user !=null) {
            int result = adminuserMapper.deleteByPrimaryKey(uid);
            if (result > 0) {
                flag=true;
            }else{
                flag=false;
            }

        }
        return flag;
    }

    @Override
    public boolean insert(AdminUser record) {
        int result= adminuserMapper.insert(record);
        if (adminuserMapper.insert(record) > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean insertSelective(AdminUser record) {
        int result= adminuserMapper.insertSelective(record);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public AdminUser selectByPrimaryKey(Integer uid) {
        return adminuserMapper.selectByPrimaryKey(uid);
    }

    @Override
    public boolean updateByPrimaryKeySelective(AdminUser record) {

        int result = adminuserMapper.updateByPrimaryKeySelective(record);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updateByPrimaryKey(AdminUser record) {
        int result = adminuserMapper.updateByPrimaryKey(record);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public AdminUser login(AdminUser user) {
        MD5 md5 = new MD5();
        String password = md5.getMD5ofStr(user.getPassword());//已经加过盐的密码
        user.setPassword(password);
        List<AdminUser> list = adminuserMapper.login(user);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    public List selectByList() {
        List list = adminuserMapper.selectByList();
        return list;
    }

    public boolean oldPassword(AdminUser user) {
        MD5 md5 = new MD5();
        String password = md5.getMD5ofStr(user.getPassword());
        List<AdminUser> list = adminuserMapper.oldPassword(user);
        if (list != null && list.size() > 0) {
            return true;
        }
        return false;

    }

    @Override
    public List<BaseRole> distributeLeft(AdminUser baseUser) {
        return adminuserMapper.distributeLeft(baseUser);

    }

    @Override
    public List<BaseRole> distributeRight(AdminUser baseUser) {
        return adminuserMapper.distributeRight(baseUser);
    }

   public   void distributeUpdate(Integer uid, String[] rids){
       baseUserRoleMapper.deleteUid(uid);
       List<BaseUserRole> list = new ArrayList();
          if(rids!=null) {
              for (String rid : rids) {
                  BaseUserRole baseUserRole = new BaseUserRole();
                  baseUserRole.setUid(uid);
                  baseUserRole.setRid(Integer.parseInt(rid));
                  list.add(baseUserRole);
//                  baseUserRoleMapper.insert(rid);
              }
            baseUserRoleMapper.insertBatch(list);
          }

    }
    /*
    输入框查询
     */
   public List<AdminUser> search(AdminUser adminUser){
        return adminuserMapper.search(adminUser);
    }


}
