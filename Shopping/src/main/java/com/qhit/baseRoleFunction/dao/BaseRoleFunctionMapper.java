package com.qhit.baseRoleFunction.dao;

import com.qhit.baseRoleFunction.pojo.BaseRoleFunction;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BaseRoleFunctionMapper {
    int deleteByPrimaryKey(Integer rmid);

    int insert(BaseRoleFunction record);

    int insertSelective(BaseRoleFunction record);

    BaseRoleFunction selectByPrimaryKey(Integer rmid);

    int updateByPrimaryKeySelective(BaseRoleFunction record);

    int updateByPrimaryKey(BaseRoleFunction record);
    int deleteByrid(Integer rid);
    /**
     * 根据角色id获取该角色拥有的所有菜单权限
     * @param roleId 角色权限
     * @return
     */
    public List<Integer> findModuleIdsByRoleId(Integer roleId);

  int  addRolFunctionRelation(List list);

}