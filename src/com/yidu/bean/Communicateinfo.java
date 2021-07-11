package com.yidu.bean;

import org.springframework.stereotype.Component;

@Component
public class Communicateinfo {
    private int comid;
    private int roomid;
    private int userid;
    private String title;
    private String starttime;
    private String endtime;
    private int state;
    private String roomname;
    private String username;

    public Communicateinfo() {}

    public Communicateinfo(int comid, int roomid, int userid, String title, String starttime, String endtime, int state, String roomname, String username) {
        this.comid = comid;
        this.roomid = roomid;
        this.userid = userid;
        this.title = title;
        this.starttime = starttime;
        this.endtime = endtime;
        this.state = state;
        this.roomname = roomname;
        this.username = username;
    }

    public int getComid() {
        return comid;
    }

    public void setComid(int comid) {
        this.comid = comid;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Communicateinfo{" +
                "comid=" + comid +
                ", roomid=" + roomid +
                ", userid=" + userid +
                ", title='" + title + '\'' +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", state=" + state +
                ", roomname='" + roomname + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
