package com.yidu.service.Impl;

import com.yidu.bean.Holidayinfo;
import com.yidu.dao.HolidayMapper;
import com.yidu.service.HolidayinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HolidayinfoServiceImpl implements HolidayinfoService {

    @Autowired
    private HolidayMapper holidayMapper;

    @Override
    public List<Holidayinfo> selectHolidayAll() {
        return holidayMapper.selectHolidayAll();
    }

    @Override
    public List<Holidayinfo> queryAllHoliday(Map<String, Object> maps) {
        return holidayMapper.queryAllHoliday(maps);
    }

    @Override
    public List<Holidayinfo> queryAllHolidayInDept(Map<String, Object> maps) {
        return holidayMapper.queryAllHolidayInDept(maps);
    }

    @Override
    public int queryAllRows() {
        return holidayMapper.queryAllRows();
    }

    @Override
    public int queryAllRowsInDept(int departmentid) {
        return holidayMapper.queryAllRowsInDept(departmentid);
    }

    @Override
    public List<Holidayinfo> queryHolidayHistory(Map<String, Object> maps) {
        return holidayMapper.queryHolidayHistory(maps);
    }

    @Override
    public int queryHistoryRows(int userid) {
        return holidayMapper.queryHistoryRows(userid);
    }

    @Override
    public boolean insertApply(Holidayinfo holidayinfo) {
        int i = holidayMapper.insertApply(holidayinfo);
        return i > 0 ? true : false;
    }

    @Override
    public boolean updateApply(int id, int state) {
        int i = holidayMapper.updateApply(id, state);
        return i > 0 ? true : false;
    }

    @Override
    public boolean updateTable(Holidayinfo holidayinfo) {
        int i = holidayMapper.updateTable(holidayinfo);
        return i > 0 ? true : false;
    }

    @Override
    public List<Holidayinfo> querySecond(Map<String, Object> maps) {
        return holidayMapper.querySecond(maps);
    }

    @Override
    public int querySecondRows() {
        return holidayMapper.querySecondRows();
    }

    @Override
    public boolean updateIsApply(int id, int isApply) {
        int i = holidayMapper.updateIsApply(id,isApply);
        return i > 0 ? true : false;
    }
}
