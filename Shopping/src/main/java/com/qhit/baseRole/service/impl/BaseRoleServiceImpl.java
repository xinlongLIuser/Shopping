package com.qhit.baseRole.service.impl;

import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseRole.dao.BaseRoleMapper;
import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.baseRole.service.IBaseRoleService;
import com.qhit.baseRoleFunction.dao.BaseRoleFunctionMapper;
import com.qhit.baseRoleFunction.pojo.BaseRoleFunction;
import com.qhit.utils.StringUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by GeneratorCode on 2018/11/29
 */
@Service("baseRoleService")


public class BaseRoleServiceImpl implements IBaseRoleService {
    private Logger logger = Logger.getLogger(BaseRoleServiceImpl.class);

    @Resource
    BaseRoleMapper baseRoleMapper;

    @Resource
    BaseRoleFunctionMapper baseRoleFunctionMapper;

    public List findAll() {

        return baseRoleMapper.findAll();
    }

    @Override
    public List<BaseFunction> distributeLeft(BaseRole baseRole) {

        return baseRoleMapper.distributeLeft(baseRole);
    }

    @Override
    public List<BaseFunction> distributeRight(BaseRole baseRole) {
        return baseRoleMapper.distributeRight(baseRole);
    }

    @Override
    public void distributeUpdate(Integer rid, String[] array) {
        baseRoleFunctionMapper.deleteByrid(rid);
        if (array != null) {
            for (String fid : array) {
                BaseRoleFunction baseRoleFunction = new BaseRoleFunction();
                baseRoleFunction.setFid(Integer.parseInt(fid));
                baseRoleFunction.setRid(rid);
                baseRoleFunctionMapper.insertSelective(baseRoleFunction);

            }
        } else {
            return;
        }

    }

    public void addRolFunctionRelation(int roleId, String fids) {

        baseRoleFunctionMapper.deleteByrid(roleId);
        List<BaseRoleFunction> list = new ArrayList();
        List<Integer> ids = StringUtil.getListFromStr(fids);
        if (ids != null) {
            for (Integer fid : ids) {
                BaseRoleFunction baseRoleFunction = new BaseRoleFunction();
                baseRoleFunction.setRid(roleId);
                baseRoleFunction.setFid(fid);
                list.add(baseRoleFunction);
            }
            baseRoleFunctionMapper.addRolFunctionRelation(list);
        }


    }


}