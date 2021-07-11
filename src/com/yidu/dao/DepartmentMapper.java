package com.yidu.dao;

import com.yidu.bean.Departmentinfo;

import java.util.List;
import java.util.Map;

public interface DepartmentMapper {
    /**
     * 查询所有的部门
     * @return
     */
    List<Departmentinfo> selectDepartmentAll();
    /**
     * 查询所有的部门
     * @param maps
     * @return
     */
    List<Departmentinfo> queryAllDep(Map<String,Object> maps);

    /**
     * 查询所有的部门总行数
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
     *
     * @param departmentinfo
     * @return
     */
    boolean updateDept(Departmentinfo departmentinfo);
}
