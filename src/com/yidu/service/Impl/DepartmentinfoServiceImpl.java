package com.yidu.service.Impl;

import com.yidu.bean.Departmentinfo;
import com.yidu.dao.DepartmentMapper;
import com.yidu.service.DepartmentinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DepartmentinfoServiceImpl implements DepartmentinfoService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Departmentinfo> selectAll() {
        return departmentMapper.selectDepartmentAll();
    }

    @Override
    public List<Departmentinfo> queryAllDep(Map<String, Object> maps) {
        return departmentMapper.queryAllDep(maps);
    }

    @Override
    public int queryAllRows() {
        return departmentMapper.queryAllRows();
    }

    @Override
    public boolean insertDept(Departmentinfo departmentinfo) {
        return departmentMapper.insertDept(departmentinfo);
    }

    @Override
    public boolean deleteDept(int departmentid) {
        return departmentMapper.deleteDept(departmentid);
    }

    @Override
    public boolean updateDept(Departmentinfo departmentinfo) {
        return departmentMapper.updateDept(departmentinfo);
    }
}
