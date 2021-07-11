package com.yidu.controller;

import com.yidu.bean.Departmentinfo;
import com.yidu.bean.UserInfo;
import com.yidu.service.DepartmentinfoService;
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
public class DepartmentController {

    @Autowired
    private DepartmentinfoService departmentinfoService;
    @ResponseBody
    @RequestMapping("department_selectAll")
    public HashMap<String,Object> queryAllDeptInfo(@RequestParam(name = "keyword",required = false,defaultValue = "") String name, Integer page, Integer limit, HttpSession session){
        HashMap<String,Object> maps=new HashMap<>();
        maps.put("name",name);
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<Departmentinfo> departmentinfoList = departmentinfoService.queryAllDep(maps);
        session.setAttribute("department",departmentinfoList);
        int count = departmentinfoService.queryAllRows();
        Layui data = Layui.data(count, departmentinfoList);
        return data;
    }
    @ResponseBody
    @RequestMapping("department_insert")
    public Result insert(@RequestBody Departmentinfo departmentinfo){
        boolean b = departmentinfoService.insertDept(departmentinfo);
        if(b){
            return new Result(200,"添加成功");
        }else{
            return new Result(100,"添加失败");
        }
    }

    @ResponseBody
    @RequestMapping("department_update")
    public Result update(@RequestBody Departmentinfo departmentinfo){
        boolean b = departmentinfoService.updateDept(departmentinfo);
        if(b){
            return new Result(200,"修改成功");
        }else{
            return new Result(100,"修改失败");
        }
    }
    @ResponseBody
    @RequestMapping("department_delete")
    public Result delete(int departmentid){
        boolean b = departmentinfoService.deleteDept(departmentid);
        if(b){
            return new Result(200,"删除成功");
        }else{
            return new Result(100,"删除失败");
        }
    }
}
