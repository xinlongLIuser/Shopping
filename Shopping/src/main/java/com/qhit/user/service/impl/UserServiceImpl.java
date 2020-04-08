package com.qhit.user.service.impl;

import com.qhit.user.dao.UserMapper;
import com.qhit.user.pojo.User;
import com.qhit.user.service.UserService;
import com.qhit.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public boolean deleteByPrimaryKey(Integer uid) {
        User user=selectByPrimaryKey(uid);
        boolean flag = false;
        if(user !=null) {
            int result = userMapper.deleteByPrimaryKey(uid);
            if (result > 0) {
                 flag=true;
            }else{
                flag=false;
            }

        }
        return flag;
    }

    @Override
    public boolean insert(User record) {
        int result= userMapper.insert(record);
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int insertSelective(User record) {
        return userMapper.insertSelective(record);

    }

    @Override
    public User selectByPrimaryKey(Integer uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public boolean updateByPrimaryKey(User record) {
        int result = userMapper.updateByPrimaryKey(record);
        if (result > 0) {
            return true;
        }
        return false;
    }
    public List selectByList() {
        List list = userMapper.selectByList();
        return list;
    }

    /*
    登录
     */

    @Override
    public User login(User user) {

        List<User> list=userMapper.login(user);
        if( list!=null &&list.size()>0){
            return list.get(0);
        }
        return user;
    }
}
