package com.yidu.bean;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
public class UserInfo implements Serializable {
    private Integer userid;
    private String username;
    private String userpass;
    private String sex;
    private String birthday;
    private Integer departmentid;
    private String telephone;
    private String address;
    private String email;
    private String entertime;
    private Integer salary;
    private Integer roleid;
    private Integer state;
    private String imageurl;
    private String departmentname;
    private String rolename;

    public UserInfo() {
    }

    public UserInfo(Integer userid, String username, String userpass, String sex, String birthday, Integer departmentid, String telephone, String address, String email, String entertime, Integer salary, Integer roleid, Integer state, String imageurl, String departmentname, String rolename) {
        this.userid = userid;
        this.username = username;
        this.userpass = userpass;
        this.sex = sex;
        this.birthday = birthday;
        this.departmentid = departmentid;
        this.telephone = telephone;
        this.address = address;
        this.email = email;
        this.entertime = entertime;
        this.salary = salary;
        this.roleid = roleid;
        this.state = state;
        this.imageurl = imageurl;
        this.departmentname = departmentname;
        this.rolename = rolename;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEntertime() {
        return entertime;
    }

    public void setEntertime(String entertime) {
        this.entertime = entertime;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", userpass='" + userpass + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday='" + birthday + '\'' +
                ", departmentid=" + departmentid +
                ", telephone='" + telephone + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", entertime='" + entertime + '\'' +
                ", salary=" + salary +
                ", roleid=" + roleid +
                ", state=" + state +
                ", imageurl='" + imageurl + '\'' +
                ", departmentname='" + departmentname + '\'' +
                ", rolename='" + rolename + '\'' +
                '}';
    }
}
