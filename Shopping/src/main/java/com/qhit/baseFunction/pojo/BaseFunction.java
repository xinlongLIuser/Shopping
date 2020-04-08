package com.qhit.baseFunction.pojo;


import com.qhit.baseRole.pojo.BaseRole;
import com.qhit.baseRoleFunction.pojo.BaseRoleFunction;

/**
* Created by GeneratorCode on 2018/11/28
*/

public class BaseFunction {

    private Integer fid;    //功能ID
    private String name;    //功能名称
    private Integer pid;    //模块ID
    private String url;    //url地址
    private  String target;
    private BaseRole baseRole;
    private BaseRoleFunction baseRoleFunction;

    public BaseRole getBaseRole() {
        return baseRole;
    }

    public void setBaseRole(BaseRole baseRole) {
        this.baseRole = baseRole;
    }

    public BaseRoleFunction getBaseRoleFunction() {
        return baseRoleFunction;
    }

    public void setBaseRoleFunction(BaseRoleFunction baseRoleFunction) {
        this.baseRoleFunction = baseRoleFunction;
    }

    public Integer getFid() {
        return fid;
    }
 
    public void setFid(Integer fid) { 
        this.fid = fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }
 
    public void setUrl(String url) { 
        this.url = url;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}