package com.yidu.dao;

import com.yidu.bean.Roleinfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * @author XiongAiWen
 * @version 1.0
 * @description:
 * @data 2021/1/11 9:34
 */
public interface RoleinfoMapper {
    /**
     * 查询所有的角色信息
     * @param maps
     * @return
     */
    List<Roleinfo> selectRole(HashMap<String,Object> maps);
    /**
     * 查询总行数
     * @return
     */
    Integer selectRoleRows();

    /**
     * 用户角色表  根据用户id查询角色id
     * @param userid
     * @return
     */
    Integer selectRoleIdByUserId(Integer userid);

    /**
     * 操作用户角色表 根据用户id修改角色id
     * @param userid
     * @param roleid
     * @return
     */
    Integer updateUserRole(@Param("userid")Integer userid,@Param("roleid")Integer roleid);

    /**
     * 修改角色名称
     * @param rolename
     * @param roleid
     * @return
     */
   int updateRole(@Param("rolename") String rolename,@Param("roleid") Integer roleid);

    /**
     * 新增用户角色表
     * @param userid
     * @param roleid
     * @return
     */
    Integer insertUserRole(@Param("userid") Integer userid,@Param("roleid") Integer roleid);

    /**
     * 添加角色
     * @param roleinfo
     * @return
     */
    Integer insertRole(Roleinfo roleinfo);

    /**
     * 删除角色
     * @param roleid
     * @return
     */
    Integer deleteRole(int roleid);


}
