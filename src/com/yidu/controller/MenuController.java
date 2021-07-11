package com.yidu.controller;

import com.yidu.bean.Menuinfo;
import com.yidu.bean.Menus;
import com.yidu.bean.UserInfo;
import com.yidu.service.Impl.MenuinfoServiceImpl;
import com.yidu.service.Impl.UserInfoServiceImpl;
import com.yidu.util.Layui;
import com.yidu.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
@Controller
public class MenuController {
    @Autowired
    MenuinfoServiceImpl menuinfoService;
    @Autowired
    UserInfoServiceImpl userInfoService;

    @RequestMapping("admins")
    public String fromAdmin(){
        return "admin.jsp";
    }

    /**
     * 根据ID加载对应的菜单
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_selectMenu")//用于登录后显示菜单
    public List<Menuinfo> selectMenu(HttpServletRequest request){
        //根据用户id查询出角色id再根据角色id查询出其相对应的菜单
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        Integer roleid = userInfoService.selectRole(userInfo.getUserid());
        //调用根据角色id查询出其相对应的菜单集合的方法
        List<Menuinfo> menuinfos = userInfoService.selectMenuByRole(roleid);
        return menuinfos;
    }

    /**
     * 查询所有的菜单
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_selectMenuList")
    public HashMap<String,Object> selectMenuList(Integer page,Integer limit){
        HashMap<String,Object> maps=new HashMap<>();
        if(page!=null && limit!=null){
            maps.put("page",(page-1)*limit);
            maps.put("limit",limit);
        }
        //调用查询菜单集合的方法
        List<Menuinfo> menuinfos = menuinfoService.selectMenuAll(maps);
        //调用查询菜单总行数的方法
        int totalRows = menuinfoService.selectTotalRows();
        //使用工具类装入map
        Layui data = Layui.data(totalRows, menuinfos);
        //返回数据(默认转换为json数据)
        return data;
    }

    /**
     * 查询出所有的菜单信息在树状组件显示
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_selects")//用于编辑角色菜单
    public Object selects(Integer roleid){
        //调用查询所有父级菜单的方法
        List<Menus> menus = menuinfoService.selectFatherMenu();
        //根据角色id获取菜单集合
        List<String> roleidStr = menuinfoService.selectMenuIdListByRoleId(roleid);
        //调用根据父级id查询子级的方法
        for (Menus menu : menus) {
            /*System.out.println("menu.getId()="+menu.getId());*/
            //调用根据菜单id查询子集的方法
            List<Menus> menus1 = menuinfoService.selectMenusByMenuId(menu.getId());
            /*for (Menus menus2 : menus1) {
                System.out.println("menus2 = " + menus2);
            }*/
            //设置子集
            menu.setChildren(menus1);
            //获取子级
            List<Menus> children = menu.getChildren();
            //循环子级
            for (Menus child : children) {
                /*System.out.println("child = " + child);*/
                //调用id判断方法并得到结果result
               /* System.out.println("child.getId()="+child.getId()+"roleidStr="+roleidStr);*/
                boolean result= this.checkMenuId(child.getId(),roleidStr);
                //设置checked
                child.setChecked(result);
            }
        }
        //System.out.println(menus);
        return menus;
    }

    public boolean checkMenuId(String menuid,List<String> menuids){
        //循环menuids
        for (String s : menuids) {
            //判断是否相等并返回结果
            if(menuid.equals(s))return true;
        }
        return false;
    }

    /**
     * 插入菜单
     * @param menuinfo
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_insert")
    public Result insertMenu(@RequestBody Menuinfo menuinfo){
        boolean b = menuinfoService.insertMenu(menuinfo);
        if (b){
            return new Result(200,"插入菜单成功");
        }else{
            return new Result(100,"插入菜单失败");
        }
    }
    @ResponseBody
    @RequestMapping(value="menu_toUpdateMenu",produces = "text/html;charset=utf-8")
    public String toUpdateMenu(String menuid){
        return "";
    }

    /**
     * 修改菜单信息
     * @param menuinfo
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_doUpdateMenu")
    public Result doUpdateMenu(@RequestBody Menuinfo menuinfo){
        boolean b = menuinfoService.doUpdateMenu(menuinfo);
        if (b){
            return new Result(200,"修改菜单成功");
        }else{
            return new Result(100,"修改菜单失败");
        }
    }

    /**
     * 修改模块状态
     * @param state
     * @param menuid
     * @return
     */
    @RequestMapping("menu_modifyState")
    @ResponseBody
    public Result updateState(int state,String menuid){
        if(state==0){
            boolean b = menuinfoService.updateMenuState(state,menuid);
            return new Result(150,"启用成功");
        }else{
            boolean b = menuinfoService.updateMenuState(state,menuid);
            return new Result(50,"禁用成功");
        }
    }

    /**
     * 删除菜单
     * @param menuid
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_delete")
    public Result deleteMenu(String menuid){
        boolean b = menuinfoService.deleteMenu(menuid);
        if (b){
            return new Result(200,"删除菜单成功");
        }else{
            return new Result(100,"删除菜单失败");
        }
    }
    @RequestMapping(value = "role_selectAll",produces = "text/html;charset=utf-8")
    public ModelAndView selectRoleAll(){
        ModelAndView mv=new ModelAndView();

        return mv;
    }


    /**
     * 查询出所有的角色
     * @return
     */
    @RequestMapping("role_select")
    public ModelAndView selectRoleAlls(){
        ModelAndView mv=new ModelAndView();

        return mv;
    }
    // @ResponseBody
    @RequestMapping("menu_selectMenuinfo")
    public String selectMenuinfo(Integer roleid, HttpServletRequest request){

        return "forward:role_select";
    }

    /**
     * 修改角色对应的菜单
     * @return
     */
    @ResponseBody
    @RequestMapping("menu_updates")
    public String updateRoleMenus(Integer roleid,String menuidStr){
        return "修改失败！";
    }
}
