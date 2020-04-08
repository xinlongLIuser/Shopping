package com.qhit.baseFunction.service.impl;

import com.qhit.baseFunction.dao.BaseFunctionMapper;
import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseFunction.service.IBaseFunctionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by GeneratorCode on 2018/11/28
 */
@Service("iBaseFunctionService")
public   class BaseFunctionServiceImpl implements IBaseFunctionService {
    @Resource
    BaseFunctionMapper baseFunctionMapper;

    @Override
    public List findAll() {
        List<Object> listZTree = new ArrayList<>();
        List<BaseFunction> list = baseFunctionMapper.findAll();
        String str = "";
        for (int i = 0; i < list.size(); i++) {
            BaseFunction baseFunction = list.get(i);
            str = "{id:'" + baseFunction.getFid() + "', pId:'" + baseFunction.getPid() + "', name:'" + baseFunction.getName() + "' }";//封装ztree需要格式的字符串
            listZTree.add(str);
        }
        return list;
    }

    @Override
    public boolean insert(BaseFunction baseFunction) {

        boolean flag = false;
        if (baseFunctionMapper.insertSelective(baseFunction) > 0) {
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean update(BaseFunction baseFunction) {
        boolean flag = false;
        if (baseFunctionMapper.updateByPrimaryKeySelective(baseFunction) > 0) {
            flag = true;
        }
        return flag;

    }

    @Override
    public boolean delete(Integer id) {
        boolean flag = false;
        BaseFunction baseFunction = baseFunctionMapper.selectByPrimaryKey(id);
        if (baseFunction != null) {
            if (baseFunctionMapper.deleteByPrimaryKey(id) > 0) {
                flag = true;
            } else {
                flag = false;
            }
        }
        return flag;

    }

    @Override
    public BaseFunction findById(Integer id) {
        BaseFunction baseFunction = baseFunctionMapper.selectByPrimaryKey(id);
        return baseFunction;

    }

    @Override
    public List<BaseFunction> findByMid(Integer mid) {
//        List list = baseFunctionMapper.findByMid(mid);
        return null;
    }

    public List<BaseFunction> findByroleMid(Integer mid, Integer uid) {
        Map map = new HashMap();
        map.put("userId", uid);
        map.put("mid", mid);
//        List list=baseFunctionMapper.findByroleMid(map);
        return null;
    }

    public List findmodule() {
        return baseFunctionMapper.findmodule();
    }

    public List<BaseFunction> search(BaseFunction baseFunction) {
        return baseFunctionMapper.search(baseFunction);
    }

    public    List<BaseFunction> findFunctionByuid(Integer uid){
        return  baseFunctionMapper.findFunctionByuid(uid);
    }


}