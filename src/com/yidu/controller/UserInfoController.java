package com.yidu.controller;
import com.yidu.bean.*;
import com.yidu.service.DepartmentinfoService;
import com.yidu.service.Impl.UserInfoServiceImpl;
import com.yidu.util.Layui;
import com.yidu.util.MD5Code;
import com.yidu.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserInfoController {

    @Autowired
    private UserInfoServiceImpl userInfoService;
    @Autowired
    private DepartmentinfoService departmentinfoService;

    /**
     * 用户退出
     * @param session
     * @return
     */
    @RequestMapping("user_logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }

    /**
     * 用户登录
     * @param userInfo
     * @param request
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("user_login")
    public Result login(UserInfo userInfo, HttpServletRequest request, HttpSession session){

        //调用MD5工具类实现密码加密
        userInfo.setUserpass(new MD5Code().getMD5ofStr(userInfo.getUserpass()));

        //用户登录 调用Service层的登录方法
        UserInfo userInfos = userInfoService.userLogin(userInfo);

        //此处判断用户是否被禁用
        if(null!=userInfos){
            //获取当前登录用的状态
            int state = userInfos.getState();
            //查询所有角色信息
            List<Roleinfo> roleinfos = userInfoService.selectRoleAll();
            session.setAttribute("role",roleinfos);
            //查询所有的部门
            List<Departmentinfo> departmentinfos = departmentinfoService.selectAll();
            session.setAttribute("department",departmentinfos);
            //将Service层登录返回的值设置在request作用域中
            request.getSession().setAttribute("user",userInfos);
            //判断当前用户的状态
            if (state==1){
                return new Result(200,"用户登录成功");
            } else{
                return new Result(404,"您已被禁用，请联系管理员！");
            }
        }else{
            return new Result(100,"登录失败");
        }
    }

    /**
     * 查询所有用户信息 用于加载Layui数据表格 包含模糊搜索查询
     * @param name
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping("user_queryAll")
    public HashMap<String,Object> queryAllUserInfo(@RequestParam(name = "keyword",required = false,defaultValue = "") String name,Integer page, Integer limit){
        HashMap<String,Object> maps=new HashMap<>();
        maps.put("name",name);
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        List<UserInfo> userInfos = userInfoService.queryAllUser(maps);
        for (UserInfo userInfo:userInfos) {
            int departmentid = userInfo.getDepartmentid();
            int roleid = userInfo.getRoleid();
            String departmentname = userInfoService.selectDepNameByDepId(departmentid);
            String rolename = userInfoService.selectRoleNameByRoleId(roleid);
            userInfo.setDepartmentname(departmentname);
            userInfo.setRolename(rolename);
        }
        int count = userInfoService.queryAllRows();
        Layui data = Layui.data(count, userInfos);
        return data;
    }

    /**
     * 用户数据插入
     * @param userInfo
     * @return
     */
    @ResponseBody
    @RequestMapping("user_insert")
    public Result insertUserinfo(@RequestBody UserInfo userInfo){
        userInfo.setUserpass(new MD5Code().getMD5ofStr(userInfo.getUserpass()));
        boolean b = userInfoService.insertUser(userInfo);
        if (b){
            return new Result(200,"插入成功！");
        }else{
            return new Result(100,"插入失败！");
        }
    }

    /**
     * 更新用户信息
     * @param userInfo
     * @return
     */
    @ResponseBody
    @RequestMapping("update_user")
    public Result updateUser(@RequestBody UserInfo userInfo){
        userInfo.setUserpass(new MD5Code().getMD5ofStr(userInfo.getUserpass()));
        boolean b = userInfoService.userUpdate(userInfo);
        if (b){
            return new Result(200,"修改成功！");
        }else{
            return new Result(100,"修改失败！");
        }
    }

    /**
     * 更新用户状态
     * @param userid
     * @param state
     * @return
     */
    @ResponseBody
    @RequestMapping("user_updateState")
    public Result updateUserState(Integer userid,Integer state){
        boolean b = userInfoService.updateUserState(userid, state);
        if (b){
            return new Result(200,"修改成功！");
        }else{
            return new Result(100,"修改失败！");
        }
    }

    /**
     * 删除用户
     * @param userid
     * @return
     */
    @ResponseBody
    @RequestMapping("delete_user")
    public Result deleteUser(int userid){
        boolean b = userInfoService.deleteUser(userid);
        if (b){
            return new Result(200,"删除成功！");
        }else{
            return new Result(100,"删除失败！");
        }
    }

    /**
     * 修改用户头像
     * @param headpic
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "user_uploadImg",method = RequestMethod.POST)
    @ResponseBody
    public Result uploadImage(@RequestParam(value = "file") MultipartFile headpic,HttpSession session) throws IOException {
        if (headpic !=null && !headpic.isEmpty()){
            final String FILENAME = headpic.getOriginalFilename();
            headpic.transferTo(new File("/Users/xuzan/IdeaProjects/ssm_project/web/layui/upload/"+FILENAME));
            HashMap<String,String> map = new HashMap<>();
            map.put("src","layui/upload/"+FILENAME);
            UserInfo user = (UserInfo) session.getAttribute("user");
            user.setImageurl("layui/upload/"+FILENAME);
            final Result result = new Result();
            result.setCode(0);
            result.setData(map);
            return result;
        }
        return new Result(1,"文件为空");
    }

    @RequestMapping("user_updateImg")
    @ResponseBody
    public Result updateImg(String imageurl,Integer userid){
        boolean b = userInfoService.updateImage(userid, imageurl);
        if(b){
            System.out.println("修改成功！");
        }else{
            System.out.println("修改失败！");
        }
        return new Result(0);
    }

    @RequestMapping("upload_file")
    @ResponseBody
    public Result uploadfile(HttpServletRequest request){
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartRequest.getFile("file");
        if (file.isEmpty()) {
            return new Result(150,"文件不存在");
        }
        String msg = userInfoService.ajaxUploadExcel(file);
        if (msg.equals("导入成功！")) {
            return new Result(200,msg);
        } else {
            return new Result(100,msg);
        }
    }
    @RequestMapping("user_updatePass")
    @ResponseBody
    public Result updatePass(Integer userid,String newPass){
        boolean b = userInfoService.updatePassword(userid,new MD5Code().getMD5ofStr(newPass));
        if (b) {
            return new Result(200,"修改密码成功");
        } else {
            return new Result(100,"修改密码失败");
        }
    }


}
