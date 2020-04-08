package com.qhit.baseRole.pojo;


import com.qhit.baseFunction.pojo.BaseFunction;
import com.qhit.baseRoleFunction.pojo.BaseRoleFunction;
import com.qhit.baseUserRole.pojo.BaseUserRole;

import java.util.List;

/**
* Created by GeneratorCode on 2018/11/29
*/

public class BaseRole {

    private Integer rid;    //角色ID
    private String rname;    //角色名称
    private BaseFunction baseFunction;
    private BaseRoleFunction baseRoleFunction;
    private BaseUserRole baseUserRole;

    public BaseUserRole getBaseUserRole() {
        return baseUserRole;
    }

    public void setBaseUserRole(BaseUserRole baseUserRole) {
        this.baseUserRole = baseUserRole;
    }

    public BaseFunction getBaseFunction() {
        return baseFunction;
    }

    public void setBaseFunction(BaseFunction baseFunction) {
        this.baseFunction = baseFunction;
    }

    public BaseRoleFunction getBaseRoleFunction() {
        return baseRoleFunction;
    }

    public void setBaseRoleFunction(BaseRoleFunction baseRoleFunction) {
        this.baseRoleFunction = baseRoleFunction;
    }

    public Integer getRid() {
        return rid;
    }
 
    public void setRid(Integer rid) { 
        this.rid = rid;
    }
 
    public String getRname() { 
        return rname;
    }
 
    public void setRname(String rname) { 
        this.rname = rname;
    }
 

 }