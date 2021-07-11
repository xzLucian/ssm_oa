package com.yidu.service;

import com.yidu.bean.Communicateinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommunicateinfoService {
    /**
     * 查询所有的会议信息
     * @return
     */
    List<Communicateinfo> selectAll();
    List<Communicateinfo> queryAllComm(Map<String,Object> maps);
    /**
     * 插入会议记录信息
     * @return
     */
    boolean insertMessage(Communicateinfo communicateinfo);

    /**
     * 更新会议记录信息
     * @return
     */
    boolean updateMessage(Communicateinfo communicateinfo);

    /**
     * 删除会议记录信息
     * @return
     */
    int deleteMessage();
    /**
     * 查询用户总行数
     * @return
     */
    int queryAllRows();

    String selectRoomNameByRoomId(int roomid);

    String selectUserNameByUserId(int userid);

    /**
     * 更新会议申请状态
     * @param comid
     * @param state
     * @return
     */
    boolean updateCommunicateState(int comid,int state);

    /**
     * 根据comid查询会议室申请状态
     * @param comid
     * @return
     */
    int selectRoomIsApply(int comid);
    /**
     * 审批完会议室之后同步修改room表isApply的状态
     * @param comid
     * @param isApply
     * @return
     */
    boolean updateIsRoomApplyState(int comid,int isApply);
    List<Communicateinfo> queryMineComm(Map<String,Object> maps);
    int queryMineRows(int userid);

}
