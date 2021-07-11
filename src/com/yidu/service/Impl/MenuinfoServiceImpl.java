package com.yidu.service.Impl;
import com.yidu.bean.Menuinfo;
import com.yidu.bean.Menus;
import com.yidu.dao.MenuMapper;
import com.yidu.service.MenuinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MenuinfoServiceImpl implements MenuinfoService {
    @Autowired
    MenuMapper menuMapper;
    @Override
    public List<Menuinfo> selectMenuAll(HashMap<String,Object> maps) {
        return menuMapper.selectMenu(maps);
    }

    @Override
    public int selectTotalRows() {
        return menuMapper.selectTotalRows();
    }

    @Override
    public List<Menus> selectFatherMenu() {
        return menuMapper.selectFatherMenu();
    }


    @Override
    public List<Menus> selectMenusByMenuId(String menuid) {
        return menuMapper.selectMenusByMenuId(menuid);
    }

    @Override
    public List<String> selectMenuIdListByRoleId(int roleid) {
        return menuMapper.selectMenuIdListByRoleId(roleid);
    }

    @Override
    public int deleteMenuByRoleid(Integer roleid) {
        return menuMapper.deleteMenuByRoleid(roleid);
    }

    @Override
    public int batchInsertMenu(HashMap<String, Object> idMaps) {
        return menuMapper.batchInsertMenu(idMaps);
    }

    @Override
    public boolean insertMenu(Menuinfo menuinfo) {
        int i = menuMapper.insertMenu(menuinfo);
        return i>0?true:false;
    }

    @Override
    public boolean doUpdateMenu(Menuinfo menuinfo) {
        int i = menuMapper.doUpdateMenu(menuinfo);
        return i>0?true:false;
    }

    @Override
    public boolean updateMenuState(int state, String menuid) {
        int i = menuMapper.updateState(state,menuid);
        return i>0?true:false;
    }

    @Override
    public boolean deleteMenu(String menuid) {
        int i = menuMapper.deleteMenu(menuid);
        return i>0?true:false;
    }


}
