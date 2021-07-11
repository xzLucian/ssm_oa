package com.yidu.bean;

import org.springframework.stereotype.Component;

@Component
public class Holidayinfo {
    private int id;
    private int userid;
    private String username;
    private int departmentid;
    private String type;
    private String reason;
    private String starttime;
    private String endtime;
    private String totaltime;
    private int state;
    private int isApply;

    public Holidayinfo() {}

    public Holidayinfo(int id, int userid, String username, int departmentid, String type, String reason, String starttime, String endtime, String totaltime, int state, int isApply) {
        this.id = id;
        this.userid = userid;
        this.username = username;
        this.departmentid = departmentid;
        this.type = type;
        this.reason = reason;
        this.starttime = starttime;
        this.endtime = endtime;
        this.totaltime = totaltime;
        this.state = state;
        this.isApply = isApply;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getTotaltime() {
        return totaltime;
    }

    public void setTotaltime(String totaltime) {
        this.totaltime = totaltime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getIsApply() {
        return isApply;
    }

    public void setIsApply(int isApply) {
        this.isApply = isApply;
    }

    @Override
    public String toString() {
        return "Holidayinfo{" +
                "id=" + id +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", departmentid=" + departmentid +
                ", type='" + type + '\'' +
                ", reason='" + reason + '\'' +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", totaltime='" + totaltime + '\'' +
                ", state=" + state +
                ", isApply=" + isApply +
                '}';
    }
}
