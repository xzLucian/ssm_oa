package com.yidu.service.Impl;

import com.yidu.bean.Communicateinfo;
import com.yidu.dao.CommunicateMapper;
import com.yidu.service.CommunicateinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CommunicateinfoServiceImpl implements CommunicateinfoService {
    @Autowired
    private CommunicateMapper communicateMapper;

    @Override
    public List<Communicateinfo> selectAll() {
        return communicateMapper.selectAll();
    }

    @Override
    public List<Communicateinfo> queryAllComm(Map<String, Object> maps) {
        return communicateMapper.queryAllComm(maps);
    }

    @Override
    public boolean insertMessage(Communicateinfo communicateinfo) {
        int i = communicateMapper.insertMessage(communicateinfo);
        return i>0?true:false;
    }

    @Override
    public boolean updateMessage(Communicateinfo communicateinfo) {
        int i = communicateMapper.updateMessage(communicateinfo);
        return i>0?true:false;
    }


    @Override
    public int deleteMessage() {
        return 0;
    }

    @Override
    public int queryAllRows() {
        return communicateMapper.queryAllRows();
    }

    @Override
    public String selectRoomNameByRoomId(int roomid) {
        return communicateMapper.selectRoomNameByRoomId(roomid);
    }

    @Override
    public String selectUserNameByUserId(int userid) {
        return communicateMapper.selectUserNameByUserId(userid);
    }

    @Override
    public boolean updateCommunicateState(int comid, int state) {
        int i = communicateMapper.updateCommunicateState(comid, state);
        return i>0?true:false;
    }

    @Override
    public int selectRoomIsApply(int comid) {
        return communicateMapper.selectRoomIsApply(comid);
    }

    @Override
    public boolean updateIsRoomApplyState(int comid, int isApply) {
        int i = communicateMapper.updateIsRoomApplyState(comid, isApply);
        return i>0?true:false;
    }

    @Override
    public List<Communicateinfo> queryMineComm(Map<String, Object> maps) {
        return communicateMapper.queryMineComm(maps);
    }

    @Override
    public int queryMineRows(int userid) {
        return communicateMapper.queryMineRows(userid);
    }
}
