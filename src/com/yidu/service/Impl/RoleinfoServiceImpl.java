package com.yidu.service.Impl;

import com.yidu.bean.Roleinfo;
import com.yidu.dao.RoleinfoMapper;
import com.yidu.service.RoleinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleinfoServiceImpl implements RoleinfoService {

    @Autowired
    RoleinfoMapper roleinfoMapper;

    @Override
    public Integer selectRoleIdByUserId(Integer userid) {
        return roleinfoMapper.selectRoleIdByUserId(userid);
    }

    @Override
    public int updateRole(String rolename, Integer roleid) {
        return roleinfoMapper.updateRole(rolename,roleid);
    }

    @Override
    public Integer updateUserRole(Integer userid, Integer roleid) {
        Integer result=0;
        //判断用户有没有角色信息 没有则新增
        if(this.selectRoleIdByUserId(userid)==null){
            result = roleinfoMapper.insertUserRole(userid,roleid);
        }else{
            result = roleinfoMapper.updateUserRole(userid,roleid);
        }
        return result;
    }

    @Override
    public boolean insertRole(Roleinfo roleinfo) {
        Integer i = roleinfoMapper.insertRole(roleinfo);
        return i>0?true:false;
    }

    @Override
    public boolean deleteRole(int roleid) {
        Integer i = roleinfoMapper.deleteRole(roleid);
        return i>0?true:false;
    }
}
