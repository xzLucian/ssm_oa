package com.yidu.service.Impl;

import com.yidu.bean.Roominfo;
import com.yidu.dao.RoomMapper;
import com.yidu.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RoominfoServiceimpl implements RoominfoService {
    @Autowired
    private RoomMapper roomMapper;

    @Override
    public List<Roominfo> selectAll() {
        return roomMapper.selectAll();
    }

    @Override
    public List<Roominfo> queryAllRoom(Map<String, Object> maps) {
        return roomMapper.queryAllRoom(maps);
    }

    @Override
    public List<Roominfo> selectRoomByState() {
        return roomMapper.selectRoomByState();
    }

    @Override
    public boolean deleteRoom(int roomid) {
        return roomMapper.deleteRoom(roomid);
    }


    @Override
    public boolean updateRoom(Roominfo roominfo) {
        return roomMapper.updateRoom(roominfo);
    }

    @Override
    public boolean insertRoom(Roominfo roominfo) {
        return roomMapper.insertRoom(roominfo);
    }

    @Override
    public int queryAllRows() {
        return roomMapper.queryAllRows();
    }

    @Override
    public Integer selectRoomIdByUserId(Integer userid) {
        return roomMapper.selectRoomIdByUserId(userid);
    }

    @Override
    public boolean updateRoomState(int roomid, int state) {
        int i = roomMapper.updateRoomState(roomid, state);
        return i>0?true:false;
    }

    @Override
    public boolean updateApplyState(int roomid, int isapply) {
        int i = roomMapper.updateApplyState(roomid, isapply);
        return i>0?true:false;
    }


}
