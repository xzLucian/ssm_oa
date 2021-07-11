package com.yidu.service;

import com.yidu.bean.Menuinfo;
import com.yidu.bean.Menus;

import java.util.HashMap;
import java.util.List;

public interface MenuinfoService {
    public List<Menuinfo> selectMenuAll(HashMap<String,Object> maps);

    /**
     * 查询总行数
     * @return
     */
    public int selectTotalRows();

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

    /**
     * 添加菜单
     * @param menuinfo
     * @return
     */
    boolean insertMenu(Menuinfo menuinfo);

    /**
     * 修改菜单
     * @param menuinfo
     * @return
     */
    boolean doUpdateMenu(Menuinfo menuinfo);

    /**
     * 修改菜单状态
     * @param state
     * @param menuid
     * @return
     */
    boolean updateMenuState(int state,String menuid);

    /**
     * 删除菜单
     * @param menuid
     * @return
     */
    boolean deleteMenu(String menuid);
}
