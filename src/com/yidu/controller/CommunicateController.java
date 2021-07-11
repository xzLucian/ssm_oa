package com.yidu.controller;

import com.yidu.bean.Communicateinfo;
import com.yidu.bean.Roominfo;
import com.yidu.bean.UserInfo;
import com.yidu.service.CommunicateinfoService;
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

@Controller
public class CommunicateController {

    @Autowired
    private CommunicateinfoService communicateinfoService;
    @Autowired
    private RoominfoService roominfoService;
    @ResponseBody
    @RequestMapping("communicate_selectAll")
    public HashMap<String,Object> queryAllCommunicateInfo(@RequestParam(name = "keyword",required = false,defaultValue = "") String name, Integer page, Integer limit, HttpSession session){
        HashMap<String,Object> maps=new HashMap<>();
        maps.put("name",name);
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<Communicateinfo> communicateinfos = communicateinfoService.queryAllComm(maps);
        for (Communicateinfo communicateinfo:communicateinfos) {
            int roomid = communicateinfo.getRoomid();
            int userid = communicateinfo.getUserid();
            String roomname = communicateinfoService.selectRoomNameByRoomId(roomid);
            String username = communicateinfoService.selectUserNameByUserId(userid);
            communicateinfo.setRoomname(roomname);
            communicateinfo.setUsername(username);
        }
        int count = communicateinfoService.queryAllRows();
        Layui data = Layui.data(count, communicateinfos);
        return data;
    }
    @ResponseBody
    @RequestMapping("communicate_selectMine")
    public HashMap<String,Object> queryAllMineCommunicateInfo(@RequestParam(name = "keyword",required = false,defaultValue = "") String name, Integer page, Integer limit, HttpSession session){
        HashMap<String,Object> maps=new HashMap<>();
        UserInfo userInfo=(UserInfo)session.getAttribute("user");
        maps.put("name",name);
        maps.put("userid",userInfo.getUserid());
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<Communicateinfo> communicateinfos = communicateinfoService.queryMineComm(maps);
        for (Communicateinfo communicateinfo:communicateinfos) {
            int roomid = communicateinfo.getRoomid();
            int userid = communicateinfo.getUserid();
            String roomname = communicateinfoService.selectRoomNameByRoomId(roomid);
            String username = communicateinfoService.selectUserNameByUserId(userid);
            communicateinfo.setRoomname(roomname);
            communicateinfo.setUsername(username);
        }
        //查询所有会议室（目的是提前加载roomApply.jsp的下拉菜单）
        List<Roominfo> roominfos = roominfoService.selectRoomByState();
        //将所有的会议室信息存储到session中
        session.setAttribute("room",roominfos);
        int count = communicateinfoService.queryMineRows(userInfo.getUserid());
        Layui data = Layui.data(count, communicateinfos);
        return data;
    }

    @ResponseBody
    @RequestMapping("communicate_insert")
    public Result insertCommunicate(@RequestBody Communicateinfo communicateinfo){
        boolean b = communicateinfoService.insertMessage(communicateinfo);
        if (b){
            return new Result(200,"插入成功！");
        }else{
            return new Result(100,"插入失败！");
        }
    }

    @ResponseBody
    @RequestMapping("communicate_update")
    public Result updateCommunicate(@RequestBody Communicateinfo communicateinfo){
        boolean b = communicateinfoService.updateMessage(communicateinfo);
        if (b){
            return new Result(200,"更新成功！");
        }else{
            return new Result(100,"更新失败！");
        }
    }

    @ResponseBody
    @RequestMapping("communicate_updateState")
    public Result updateCommunicateState(Integer comid,Integer state){
        boolean b = communicateinfoService.updateCommunicateState(comid, state);
        int isApply = communicateinfoService.selectRoomIsApply(comid);
        if (isApply==0){
            boolean b1 = communicateinfoService.updateIsRoomApplyState(comid, isApply+1);
        }else{
            boolean b1 = communicateinfoService.updateIsRoomApplyState(comid, isApply-1);
        }
        if (b){
            return new Result(200,"修改状态成功！");
        }else{
            return new Result(100,"修改状态失败！");
        }
    }
}
