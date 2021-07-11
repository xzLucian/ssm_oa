package com.yidu.bean;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
public class Departmentinfo implements Serializable {
    private int departmentid;
    private String departmentname;
    private String departmentphone;
    private int departmentnumber;

    public Departmentinfo() {
    }

    public Departmentinfo(int departmentid, String departmentname, String departmentphone, int departmentnumber) {
        this.departmentid = departmentid;
        this.departmentname = departmentname;
        this.departmentphone = departmentphone;
        this.departmentnumber = departmentnumber;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getDepartmentphone() {
        return departmentphone;
    }

    public void setDepartmentphone(String departmentphone) {
        this.departmentphone = departmentphone;
    }

    public int getDepartmentnumber() {
        return departmentnumber;
    }

    public void setDepartmentnumber(int departmentnumber) {
        this.departmentnumber = departmentnumber;
    }

    @Override
    public String toString() {
        return "Department{" +
                "departmentid=" + departmentid +
                ", departmentname='" + departmentname + '\'' +
                ", departmentphone='" + departmentphone + '\'' +
                ", departmentnumber=" + departmentnumber +
                '}';
    }
}
