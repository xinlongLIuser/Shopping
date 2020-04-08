package com.qhit.adminuser.pojo;

import com.qhit.basedept.pojo.Basedept;

public class AdminUser {
    private Integer uid;

    private String username;

    private String password;

    private Integer sex;

    private Integer deptid;

    private Basedept basedept;


    private static final long serialVersionUID = 1L;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public Basedept getBasedept() {
        return basedept;
    }

    public void setBasedept(Basedept basedept) {
        this.basedept = basedept;
    }
}
