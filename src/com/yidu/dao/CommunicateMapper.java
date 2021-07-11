package com.yidu.dao;

import com.yidu.bean.Communicateinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommunicateMapper {

    /**
     * 查询所有的会议信息
     * @return
     */
    List<Communicateinfo> selectAll();
    List<Communicateinfo> queryAllComm(Map<String,Object> maps);

    List<Communicateinfo> queryMineComm(Map<String,Object> maps);
    int queryMineRows(int userid);

    /**
     * 插入会议记录信息
     * @return
     */
    int insertMessage(Communicateinfo communicateinfo);

    /**
     * 更新会议记录信息
     * @return
     */
    int updateMessage(Communicateinfo communicateinfo);

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
    int updateCommunicateState(@Param("comid")int comid, @Param("state")int state);

    /**
     * 根据comid查询会议室申请状态
     * @param comid
     * @return
     */
    int selectRoomIsApply(@Param("comid")int comid);
    /**
     * 审批完会议室之后同步修改room表isApply的状态
     * @param comid
     * @param isapply
     * @return
     */
    int updateIsRoomApplyState(@Param("comid")int comid, @Param("isapply")int isapply);

}
