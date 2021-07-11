package com.yidu.service;

import com.yidu.bean.Menuinfo;
import com.yidu.bean.Roleinfo;
import com.yidu.bean.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @author Xuzan
 * @version 1.0
 * @description:
 * @data 2020/12/31 14:39
 */
public interface UserInfoService {

    /**
     * 用户登录
     * @param userInfo
     * @return
     */
    public UserInfo userLogin(UserInfo userInfo);

    /**
     * 插入用户
     * @param userInfo
     * @return
     */
    public boolean insertUser(UserInfo userInfo);

    /**
     * 批量插入数据
     * @param file
     * @return
     */
    String ajaxUploadExcel(MultipartFile file);
    /**
     * 用户修改个人信息
     * @param userInfo
     * @return
     */
    boolean userUpdate(UserInfo userInfo);
    /**
     * 修改用户密码
     * @param userid
     * @param nPass
     * @return
     */
    boolean updatePassword(Integer userid,String nPass);
    /**
     * 删除用户信息
     * @param userid
     * @return
     */
    boolean deleteUser(int userid);
    /**
     * 根据用户id查询出角色id
     * @param userid
     * @return
     */
    public Integer selectRole(Integer userid);

    /**
     * 查询出全部的角色信息
     * @return
     */
    public List<Roleinfo> selectRoleAll();

    /**
     * 根据角色id查询菜单信息
     * @param roleid
     * @return
     */
    public List<Menuinfo> selectMenuByRole(Integer roleid);

    /**
     * 根据角色id删除角色对应的菜单
     * @param roleid
     * @return
     */
    public int deleteMenuByRoleid(@Param("roleid")Integer roleid);

    /**
     * 新增rolemenu表
     * @return
     */
    public int insertMenu(Map<String,Object> idMap);

    /**
     * 查询所有的用户
     * @param maps
     * @return
     */
    public List<UserInfo> queryAllUser(Map<String,Object> maps);

    /**
     * 查询用户总行数
     * @return
     */
    public int queryAllRows();

    public String selectDepNameByDepId(int departmentid);

    public String selectRoleNameByRoleId(int roleid);
    /**
     * 修改用户状态
     * @param userid
     * @param state
     * @return
     */
    public boolean updateUserState(int userid,int state);

    /**
     * 修改用户头像
     * @param id
     * @param url
     * @return
     */
    boolean updateImage(int id,String url);

}
