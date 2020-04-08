package com.qhit.baseRoleFunction.service.impl;

import com.qhit.baseRoleFunction.dao.BaseRoleFunctionMapper;
import com.qhit.baseRoleFunction.pojo.BaseRoleFunction;
import com.qhit.baseRoleFunction.service.IBaseRoleFunctionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by GeneratorCode on 2018/11/29
 */
@Service("baseRoleFunctionService")
public class BaseRoleFunctionServiceImpl implements IBaseRoleFunctionService {
    @Resource
    BaseRoleFunctionMapper baseRoleFunctionMapper;


    public boolean deleteByPrimaryKey(Integer rmid) {
        boolean flag = false;
        if (baseRoleFunctionMapper.deleteByPrimaryKey(rmid) > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean insert(BaseRoleFunction record) {
        boolean flag = false;
        if (baseRoleFunctionMapper.insert(record) > 0) {
            flag = true;
        }
        return flag;

    }

    public boolean insertSelective(BaseRoleFunction record) {
        boolean flag = false;
        if (baseRoleFunctionMapper.insertSelective(record) > 0) {
            flag = true;
        }
        return flag;
    }

    public BaseRoleFunction selectByPrimaryKey(Integer rmid) {
        return baseRoleFunctionMapper.selectByPrimaryKey(rmid);
    }

    public boolean updateByPrimaryKeySelective(BaseRoleFunction record) {
        boolean flag = false;
        if (baseRoleFunctionMapper.updateByPrimaryKeySelective(record) > 0) {
            flag = true;
        }
        return flag;

    }

    public boolean updateByPrimaryKey(BaseRoleFunction record) {
        boolean flag = false;
        if (baseRoleFunctionMapper.updateByPrimaryKey(record) > 0) {
            flag = true;
        }
        return flag;
    }


    @Override
    public List<Integer> findModuleIdsByRoleId(Integer roleId) {
        return baseRoleFunctionMapper.findModuleIdsByRoleId(roleId);
    }
}