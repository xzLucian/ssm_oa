package com.yidu.controller;

import com.yidu.bean.Holidayinfo;
import com.yidu.bean.UserInfo;
import com.yidu.service.HolidayinfoService;
import com.yidu.service.Impl.UserInfoServiceImpl;
import com.yidu.util.Layui;
import com.yidu.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class HolidayController {

    @Autowired
    private HolidayinfoService holidayinfoService;
    @Autowired
    private UserInfoServiceImpl userInfoService;

    @ResponseBody
    @RequestMapping("user_applyLeave")
    public HashMap<String,Object> queryAllHolidayInfo(@RequestParam(name = "keyword",required = false,defaultValue = "") String name, Integer page, Integer limit, HttpServletRequest request,HttpSession session){
        UserInfo userInfo=(UserInfo) session.getAttribute("user");
        String RoleName=userInfoService.selectRoleNameByRoleId(userInfo.getRoleid());
        HashMap<String,Object> maps=new HashMap<>();
        maps.put("name",name);
        maps.put("userid",userInfo.getUserid());
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<Holidayinfo> holidayinfos=null;
        int count=0;
        System.out.println(RoleName);
        if (RoleName.contains("经理")){

            maps.put("departmentid",userInfo.getDepartmentid());
            holidayinfos =holidayinfoService.queryAllHolidayInDept(maps);
            count= holidayinfoService.queryAllRowsInDept(userInfo.getDepartmentid());


        }else if(RoleName.contains("董事长")){
            holidayinfos = holidayinfoService.querySecond(maps);
            count = holidayinfoService.querySecondRows();
        }else{
            holidayinfos=holidayinfoService.queryAllHoliday(maps);
            count=holidayinfoService.queryAllRows();
        }
        //List<Holidayinfo> holidayinfos = holidayinfoService.queryAllHoliday(maps);
        session.setAttribute("holiday",holidayinfos);
        Layui data = Layui.data(count, holidayinfos);
        return data;
    }

    @ResponseBody
    @RequestMapping("user_updateLeave")
    public Result updateApplyTable(int id,int state,HttpSession session){
        UserInfo userInfo=(UserInfo) session.getAttribute("user");
        String RoleName=userInfoService.selectRoleNameByRoleId(userInfo.getRoleid());
        if (RoleName.contains("经理")){
            boolean b = holidayinfoService.updateApply(id,state);
            if (b){
                return new Result(200,"审批成功");
            }else{
                return new Result(100,"审批失败");
            }
        }else if(RoleName.contains("董事长")){
            boolean b = holidayinfoService.updateIsApply(id,state);
            if (b){
                return new Result(200,"审批成功");
            }else{
                return new Result(100,"审批失败");
            }
        }
        return new Result();
    }

    @ResponseBody
    @RequestMapping("user_insertLeave")
    public Result insertApplyTable(@RequestBody Holidayinfo holidayinfo,HttpSession session){
        UserInfo userInfo=(UserInfo) session.getAttribute("user");
        holidayinfo.setDepartmentid(userInfo.getDepartmentid());
        boolean b = holidayinfoService.insertApply(holidayinfo);
        if (b){
            return new Result(200,"插入成功");
        }else{
            return new Result(100,"插入失败");
        }
    }

    @ResponseBody
    @RequestMapping("user_updateTable")
    public Result updateTable(@RequestBody Holidayinfo holidayinfo){
        boolean b = holidayinfoService.updateTable(holidayinfo);
        if (b){
            return new Result(200,"修改成功");
        }else{
            return new Result(100,"修改失败");
        }
    }
    @ResponseBody
    @RequestMapping("user_LeaveHistory")
    public HashMap<String,Object> queryHolidayHistory(@RequestParam(name = "keyword",required = false,defaultValue = "") String name, Integer page, Integer limit, HttpServletRequest request,HttpSession session){
        UserInfo userInfo=(UserInfo) session.getAttribute("user");
        HashMap<String,Object> maps=new HashMap<>();
        maps.put("type",name);
        maps.put("userid",userInfo.getUserid());
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<Holidayinfo> holidayinfos=null;
        int count=0;
        holidayinfos=holidayinfoService.queryHolidayHistory(maps);
        count=holidayinfoService.queryHistoryRows(userInfo.getUserid());
        //List<Holidayinfo> holidayinfos = holidayinfoService.queryAllHoliday(maps);
        session.setAttribute("holiday",holidayinfos);
        Layui data = Layui.data(count, holidayinfos);
        return data;
    }
}
