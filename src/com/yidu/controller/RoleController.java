package com.yidu.controller;

import com.yidu.bean.Roleinfo;
import com.yidu.dao.RoleinfoMapper;
import com.yidu.service.Impl.MenuinfoServiceImpl;
import com.yidu.service.RoleinfoService;
import com.yidu.util.Layui;
import com.yidu.util.Result;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {
    @Autowired
    RoleinfoMapper roleinfoMapper;
    @Autowired
    MenuinfoServiceImpl menuinfoService;
    @Autowired
    RoleinfoService roleinfoService;

    @ResponseBody
    @RequestMapping("role_selectRoleAlls")
    public Map<String,Object> selectRoleAll(Integer page, Integer limit){
        HashMap<String,Object> maps=new HashMap<>();
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<Roleinfo> roleinfos = roleinfoMapper.selectRole(maps);
        Integer count = roleinfoMapper.selectRoleRows();
        Layui data = Layui.data(count, roleinfos);
        return data;
    }

    @ResponseBody
    @RequestMapping("role_selectRole")
    public Map<String,Object> selectRoleAll(){
        HashMap<String,Object> maps=new HashMap<>();
        List<Roleinfo> roleinfos = roleinfoMapper.selectRole(maps);
        maps.put("data",roleinfos);
        return maps;
    }
    @ResponseBody
    @RequestMapping("role_insertRole")
    public Result insertRole(@RequestBody Roleinfo roleinfo){
        System.out.println(roleinfo);
        boolean b = roleinfoService.insertRole(roleinfo);
        if (b){
            return new Result(200,"插入角色成功");
        }else{
            return new Result(100,"插入角色失败");
        }
    }
    @ResponseBody
    @RequestMapping("role_selectRoleIdByUserId")
    public int selectRoleIdByUserId(Integer userid){
        Integer i = roleinfoService.selectRoleIdByUserId(userid);
        if(i==null){
           return 0;
        }
        return i;
    }
    @ResponseBody
    @RequestMapping("role_updateUserRole")
    public String updateUserRole(Integer userid,Integer roleid){
        return roleinfoService.updateUserRole(userid,roleid)>0?"修改成功！":"修改失败！";
    }

    @ResponseBody
    @RequestMapping( "role_update")
    public String updateRole(Integer roleid, String rolename ,String json){
        int b = roleinfoService.updateRole(rolename, roleid);
        System.out.println(b);
        System.out.println("json = " + json);
        //调用根据角色id删除菜单的方法
        int i = menuinfoService.deleteMenuByRoleid(roleid);
        //创建集合
        ArrayList<String> list=new ArrayList<>();
        //将json数组转换为对象 记得导json-lib包
        JSONArray jsonArray = JSONArray.fromObject(json);
        System.out.println("jsonArray = " + jsonArray);
        System.out.println("jsonArray.size() = " + jsonArray.size());
        //循环数组
        for (int j = 0; j < jsonArray.size(); j++) {
            //获取父级JSONObject
            JSONObject object=(JSONObject) jsonArray.get(j);
            //添加父级id到集合
            list.add(object.getString("id"));
            //获取子级children jsonArray
            JSONArray jsonArrays=JSONArray.fromObject(object.getString("children"));
            //循环子级jsonArray
            for (int k = 0; k < jsonArrays.size(); k++) {
                //获取子级对象
                JSONObject ob=(JSONObject) jsonArrays.get(k);
                //将子级id添加到集合
                list.add(ob.getString("id"));
            }
            HashMap<String,Object> maps=new HashMap<>();
            maps.put("roleid",roleid);
            maps.put("menuidList",list);
            //调用批量新增角色菜单的方法
            int update = menuinfoService.batchInsertMenu(maps);
        }
        return "修改成功!";
    }

    /**
     * 删除角色
     * @param roleid
     * @return
     */
    @ResponseBody
    @RequestMapping("role_deleteRole")
    public Result deleteRole(int roleid){
        System.out.println(roleid);
        boolean b = roleinfoService.deleteRole(roleid);
        if (b){
            return new Result(200,"删除角色成功");
        }else{
            return new Result(100,"删除角色失败");
        }
    }
}
