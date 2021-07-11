package com.yidu.service;

import com.yidu.bean.Holidayinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface HolidayinfoService {
    /**
     * 查询所有的申请表
     * @return
     */
    List<Holidayinfo> selectHolidayAll();
    /**
     * 查询所有的申请表
     * @param maps
     * @return
     */
    List<Holidayinfo> queryAllHoliday(Map<String, Object> maps);
    /**
     * 查询该部门的申请表
     * @param maps
     * @return
     */
    List<Holidayinfo> queryAllHolidayInDept(Map<String, Object> maps);

    /**
     * 查询所有的申请表总行数
     * @return
     */
    int queryAllRows();
    /**
     * 查询所有的申请表总行数
     * @return
     */
    int queryAllRowsInDept(int departmentid);

    /**
     * 根据用户ID查询申请表
     * @return
     */
    List<Holidayinfo> queryHolidayHistory(Map<String, Object> maps);
    /**
     * 查询所有的申请表总行数
     * @return
     */
    int queryHistoryRows(int userid);

    /**
     * 插入请假单
     * @param holidayinfo
     * @return
     */
    boolean insertApply(Holidayinfo holidayinfo);

    /**
     * 请假单审批
     * @param id
     * @param state
     * @return
     */
    boolean updateApply(int id, int state);

    /**
     * 用户修改第一次提交的表单信息
     * @param holidayinfo
     * @return
     */
    boolean updateTable(Holidayinfo holidayinfo);

    /**
     * 二级审核
     * @return
     */
    List<Holidayinfo> querySecond(Map<String, Object> maps);
    /**
     * 查询二级审核
     * @return
     */
    int querySecondRows();
    /**
     * 二级审核修改状态
     * @param id
     * @param isApply
     * @return
     */
    boolean updateIsApply(@Param("id") int id, @Param("isApply") int isApply);
}
