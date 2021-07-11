package com.yidu.dao;

import com.yidu.bean.Menuinfo;
import com.yidu.bean.Menus;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface MenuMapper {
    /**
     * 查询菜单信息
     * @return
     */
    public List<Menuinfo> selectMenu(HashMap<String,Object> maps);

    /**
     * 查询总行数
     * @return
     */
    public int selectTotalRows();

    /**
     * 新增菜单信息
     * @param menuinfo
     * @return
     */
    public int insertMenu(Menuinfo menuinfo);

    /**
     * 根据菜单id查询出菜单信息方便修改
     * @param menuid
     * @return
     */
    public Menuinfo selectMenuByMenuId(String menuid);
    /**
     * 修改菜单信息
     * @param menuinfo
     * @return
     */
    public int doUpdateMenu(Menuinfo  menuinfo);

    /**
     * 删除菜单信息
     * @param menuid
     * @return
     */
    public int deleteMenu(String menuid);


    /**
     * 修改菜单状态@Param("moduleState")Integer state,@Param("moduleId")Integer modeId
     * @param state
     * @param menuid
     * @return
     */
    int updateState(@Param("state")Integer state,@Param("menuid") String menuid);
    /**
     * 查询出所有是父级的菜单
     * @return
     */
    List<Menus> selectFatherMenu();

    /**
     * 根据菜单id查询子集的方法
     * @param menuid
     * @return
     */
    List<Menus> selectMenusByMenuId(String menuid);

    /**
     * 根据角色id获取菜单id集合
     * @param roleid
     * @return
     */
    List<String> selectMenuIdListByRoleId(int roleid);
    /**
     * 根据角色id删除角色对应的菜单
     * @param roleid 角色id
     * @return
     */
    int deleteMenuByRoleid(Integer roleid);

    /**
     * 批量新增菜单信息
     * @param idMaps
     * @return
     */
    int batchInsertMenu(HashMap<String,Object> idMaps);

}
