package com.yidu.dao;

import com.yidu.bean.Menuinfo;
import com.yidu.bean.Roleinfo;
import com.yidu.bean.UserInfo;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

public interface UserInfoMapper {
    /**
     * 插入用户
     * @param userInfo
     * @return
     */
    int insertUser(UserInfo userInfo);

    /**
     * 通过userid获取用户对象
     * @param userid
     * @return
     */
    UserInfo getUser(int userid);
    /**
     * 批量添加用户数据（Excel表格导入）
     * @param userInfo
     * @return
     */
    int batchAddUser(UserInfo userInfo);

    /**
     * 用户登录
     * @param userInfo
     * @return
     */
    UserInfo userLogin(UserInfo userInfo);

    /**
     * 更新用户信息
     * @param userInfo
     * @return
     */
    int userUpdate(UserInfo userInfo);

    /**
     * 修改用户密码
     * @param userid
     * @param userpass
     * @return
     */
    int updatePassword(@Param("userid") Integer userid,@Param("userpass") String userpass);

    /**
     * 删除用户信息
     * @param userid
     * @return
     */
    int deleteUser(int userid);

    //根据id修改用户头像
    int insertImage(@Param("userid")Integer userid,@Param("imageurl")String imageurl);

    /**
     * 根据用户id查询出角色id
     * @param userid
     * @return
     */
    Integer selectRole(Integer userid);

    /**
     * 查询所有的角色
     * @return
     */
    List<Roleinfo> selectRoleAll();
    /**
     * 根据用户id修改角色
     * @param userids
     * @return
     */
    int updateRole(@Param("roleids") Integer roleids,@Param("userids")  Integer userids);

    /**
     * 根据角色id查询菜单信息
     * @param roleid
     * @return
     */
    List<Menuinfo> selectMenuByRole(@Param("roleid") int roleid);

    /**
     * 根据角色id删除角色对应的菜单
     * @param roleid
     * @return
     */
    int deleteMenuByRoleid(@Param("roleid")Integer roleid);

    /**
     * 新增rolemenu表
     * @return
     */
    int insertMenu(Map<String,Object> idMap);

    /**
     * 查询所有的用户
     * @param maps
     * @return
     */
    List<UserInfo> queryAllUser(Map<String,Object> maps);

    /**
     * 查询用户总行数
     * @return
     */
    int queryAllRows();

    /**
     * 根据部门id查询部门名
     * @param departmentid
     * @return
     */
    String selectDepNameByDepId(int departmentid);

    /**
     * 根据角色id查询角色名
     * @param roleid
     * @return
     */
    String selectRoleNameByRoleId(int roleid);

    /**
     * 修改用户状态
     * @param userid
     * @param state
     * @return
     */
    int updateUserState(@Param("userid") int userid,@Param("state") int state);

}
