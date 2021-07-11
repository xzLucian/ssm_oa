package com.yidu.service;

import com.yidu.bean.Roleinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author XiongAiWen
 * @version 1.0
 * @description:
 * @data 2021/3/24 14:31
 */
public interface RoleinfoService {
    /**
     * 用户角色表  根据用户id查询角色id
     * @param userid
     * @return
     */
    Integer selectRoleIdByUserId(Integer userid);

    /**
     * 修改角色名称
     * @param rolename
     * @param roleid
     * @return
     */
    int updateRole(@Param("rolename") String rolename,@Param("roleid") Integer roleid);
    /**
     * 操作用户角色表 根据用户id修改角色id
     * @param userid
     * @param roleid
     * @return
     */
    Integer updateUserRole(@Param("userid") Integer userid,@Param("roleid") Integer roleid);

    /**
     * 插入角色
     * @param roleinfo
     * @return
     */
    boolean insertRole(Roleinfo roleinfo);

    /**
     * 删除角色
     * @param roleid
     * @return
     */
    boolean deleteRole(int roleid);
}
