package com.yidu.service;

import com.yidu.bean.Roominfo;
import java.util.List;
import java.util.Map;

public interface RoominfoService {
    /**
     * 查询所有会议室信息
     * @return
     */
    List<Roominfo> selectAll();
    List<Roominfo> queryAllRoom(Map<String,Object> maps);
    List<Roominfo> selectRoomByState();

    /**
     * 删除会议室信息
     * @return
     */
    boolean deleteRoom(int roomid);

    /**
     * 更新会议室信息
     * @return
     */
    boolean updateRoom(Roominfo roominfo);

    /**
     * 插入会议室信息
     * @return
     */
    boolean insertRoom(Roominfo roominfo);
    /**
     * 查询用户总行数
     * @return
     */
    int queryAllRows();

    /**
     * 根据用户id查询会议室ID 用于修改
     * @param userid
     * @return
     */
    Integer selectRoomIdByUserId(Integer userid);

    /**
     * 更新会议室状态
     * @param roomid
     * @param state
     * @return
     */
    boolean updateRoomState(int roomid,int state);

    /**
     * 修改会议室是否被占用的状态
     * @param roomid
     * @param isapply
     * @return
     */
    boolean updateApplyState(int roomid,int isapply);

}
