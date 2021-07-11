package com.yidu.bean;

import org.springframework.stereotype.Component;

@Component
public class Roominfo {
    private int roomid;
    private String roomname;
    private int peoplenum;
    private String roomaddress;
    private int state;
    private int isapply;

    public Roominfo() {}

    public Roominfo(int roomid, String roomname, int peoplenum, String roomaddress, int state, int isapply) {
        this.roomid = roomid;
        this.roomname = roomname;
        this.peoplenum = peoplenum;
        this.roomaddress = roomaddress;
        this.state = state;
        this.isapply = isapply;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public int getPeoplenum() {
        return peoplenum;
    }

    public void setPeoplenum(int peoplenum) {
        this.peoplenum = peoplenum;
    }

    public String getRoomaddress() {
        return roomaddress;
    }

    public void setRoomaddress(String roomaddress) {
        this.roomaddress = roomaddress;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getIsapply() {
        return isapply;
    }

    public void setIsapply(int isapply) {
        this.isapply = isapply;
    }

    @Override
    public String toString() {
        return "Roominfo{" +
                "roomid=" + roomid +
                ", roomname='" + roomname + '\'' +
                ", peoplenum=" + peoplenum +
                ", roomaddress='" + roomaddress + '\'' +
                ", state=" + state +
                ", isapply=" + isapply +
                '}';
    }
}
