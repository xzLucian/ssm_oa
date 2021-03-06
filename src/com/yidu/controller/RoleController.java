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
            return new Result(200,"??????????????????");
        }else{
            return new Result(100,"??????????????????");
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
        return roleinfoService.updateUserRole(userid,roleid)>0?"???????????????":"???????????????";
    }

    @ResponseBody
    @RequestMapping( "role_update")
    public String updateRole(Integer roleid, String rolename ,String json){
        int b = roleinfoService.updateRole(rolename, roleid);
        System.out.println(b);
        System.out.println("json = " + json);
        //??????????????????id?????????????????????
        int i = menuinfoService.deleteMenuByRoleid(roleid);
        //????????????
        ArrayList<String> list=new ArrayList<>();
        //???json????????????????????? ?????????json-lib???
        JSONArray jsonArray = JSONArray.fromObject(json);
        System.out.println("jsonArray = " + jsonArray);
        System.out.println("jsonArray.size() = " + jsonArray.size());
        //????????????
        for (int j = 0; j < jsonArray.size(); j++) {
            //????????????JSONObject
            JSONObject object=(JSONObject) jsonArray.get(j);
            //????????????id?????????
            list.add(object.getString("id"));
            //????????????children jsonArray
            JSONArray jsonArrays=JSONArray.fromObject(object.getString("children"));
            //????????????jsonArray
            for (int k = 0; k < jsonArrays.size(); k++) {
                //??????????????????
                JSONObject ob=(JSONObject) jsonArrays.get(k);
                //?????????id???????????????
                list.add(ob.getString("id"));
            }
            HashMap<String,Object> maps=new HashMap<>();
            maps.put("roleid",roleid);
            maps.put("menuidList",list);
            //???????????????????????????????????????
            int update = menuinfoService.batchInsertMenu(maps);
        }
        return "????????????!";
    }

    /**
     * ????????????
     * @param roleid
     * @return
     */
    @ResponseBody
    @RequestMapping("role_deleteRole")
    public Result deleteRole(int roleid){
        System.out.println(roleid);
        boolean b = roleinfoService.deleteRole(roleid);
        if (b){
            return new Result(200,"??????????????????");
        }else{
            return new Result(100,"??????????????????");
        }
    }
}
