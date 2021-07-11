package com.yidu.controller;

import com.yidu.bean.Roleinfo;
import com.yidu.bean.Roominfo;
import com.yidu.bean.UserInfo;
import com.yidu.service.RoominfoService;
import com.yidu.util.Layui;
import com.yidu.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoomController {

    @Autowired
    private RoominfoService roominfoService;

    @ResponseBody
    @RequestMapping("room_queryAll")
    public HashMap<String, Object> queryAllRoomInfo(@RequestParam(name = "keyword", required = false, defaultValue = "") String name, Integer page, Integer limit) {
        HashMap<String, Object> maps = new HashMap<>();
        maps.put("name", name);
        if (page != null && limit != null) {
            maps.put("page", (page - 1) * limit);
            maps.put("limit", limit);
        }
        List<Roominfo> roominfos = roominfoService.queryAllRoom(maps);
        int count = roominfoService.queryAllRows();
        Layui data = Layui.data(count, roominfos);
        return data;
    }

    @ResponseBody
    @RequestMapping("room_selectRoom")
    public Result selectRoomAll(){
        List<Roominfo> roominfos = roominfoService.selectAll();
        if (roominfos!=null){
            return new Result(200,roominfos);
        }else{
            return new Result(100,"error");
        }
    }

    @ResponseBody
    @RequestMapping("room_selectRoomIdByUserId")
    public int selectRoomIdByUserId(Integer userid){
        Integer i = roominfoService.selectRoomIdByUserId(userid);
        if(i==null){
            return 0;
        }
        return i;
    }

    @ResponseBody
    @RequestMapping("room_insert")
    public Result insertRoom(@RequestBody Roominfo roominfo){
        boolean b = roominfoService.insertRoom(roominfo);
        if (b){
            return new Result(200,"插入成功！");
        }else{
            return new Result(100,"插入失败！");
        }
    }

    @ResponseBody
    @RequestMapping("room_update")
    public Result updateRoom(@RequestBody Roominfo roominfo){
        boolean b = roominfoService.updateRoom(roominfo);
        if (b){
            return new Result(200,"修改成功！");
        }else{
            return new Result(100,"修改失败！");
        }
    }

    @ResponseBody
    @RequestMapping("room_updateRoomState")
    public Result updateRoomState(Integer roomid, Integer state, HttpSession session){
        boolean b = roominfoService.updateRoomState(roomid,state);
        //查询所有会议室（目的是提前加载roomApply.jsp的下拉菜单）
        List<Roominfo> roominfos = roominfoService.selectRoomByState();
        //将所有的会议室信息存储到session中
        session.setAttribute("room",roominfos);
        if (b){
            return new Result(200,"修改状态成功！");
        }else{
            return new Result(100,"修改状态失败！");
        }
    }

    @ResponseBody
    @RequestMapping("room_updateApplyState")
    public Result updateApplyState(Integer roomid, Integer isapply){
        boolean b = roominfoService.updateApplyState(roomid,isapply);
        if (b){
            return new Result(200,"修改状态成功！");
        }else{
            return new Result(100,"修改状态失败！");
        }
    }

    @ResponseBody
    @RequestMapping("room_delete")
    public Result deleteRoom(int roomid){
        boolean b = roominfoService.deleteRoom(roomid);
        if (b){
            return new Result(200,"删除成功！");
        }else{
            return new Result(100,"删除失败！");
        }
    }
}
