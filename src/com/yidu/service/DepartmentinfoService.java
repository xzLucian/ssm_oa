package com.yidu.service;

import com.yidu.bean.Departmentinfo;
import com.yidu.bean.UserInfo;

import java.util.List;
import java.util.Map;

public interface DepartmentinfoService {

    /**
     * 查询所有部门
     * @return
     */
    List<Departmentinfo> selectAll();

    /**
     * 查询所有部门
     * @param maps
     * @return
     */
    List<Departmentinfo> queryAllDep(Map<String,Object> maps);
    /**
     * 查询部门总行数
     * @return
     */
    int queryAllRows();

    /**
     * 插入部门
     * @param departmentinfo
     * @return
     */
    boolean insertDept(Departmentinfo departmentinfo);

    /**
     * 删除部门
     * @param departmentid
     * @return
     */
    boolean deleteDept(int departmentid);

    /**
     * 更新部门信息
     * @param departmentinfo
     * @return
     */
    boolean updateDept(Departmentinfo departmentinfo);
}
