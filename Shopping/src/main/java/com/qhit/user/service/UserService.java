package com.qhit.user.service;

import com.qhit.user.pojo.User;

import java.util.List;

public interface UserService {
    boolean deleteByPrimaryKey(Integer uid);

    boolean insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    boolean updateByPrimaryKey(User record);

    List selectByList();

    User login(User user);


}
