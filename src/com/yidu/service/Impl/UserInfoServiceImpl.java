package com.yidu.service.Impl;

import com.yidu.bean.Menuinfo;
import com.yidu.bean.Roleinfo;
import com.yidu.bean.UserInfo;
import com.yidu.dao.UserInfoMapper;
import com.yidu.service.UserInfoService;
import com.yidu.util.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public UserInfo userLogin(UserInfo userInfo) {
        return userInfoMapper.userLogin(userInfo);
    }

    @Override
    public boolean insertUser(UserInfo userInfo) {
        int i = userInfoMapper.insertUser(userInfo);
        return i > 0 ? true : false;
    }

    @Override
    public boolean userUpdate(UserInfo userInfo) {
        int i = userInfoMapper.userUpdate(userInfo);
        return i > 0 ? true : false;
    }

    @Override
    public boolean updatePassword(Integer userid, String nPass) {
        int i = userInfoMapper.updatePassword(userid, nPass);
        return i>0?true:false;
    }

    @Override
    public boolean deleteUser(int userid) {
        int i = userInfoMapper.deleteUser(userid);
        return i > 0 ? true : false;
    }

    @Override
    public Integer selectRole(Integer userid) {
        return userInfoMapper.selectRole(userid);
    }

    @Override
    public List<Roleinfo> selectRoleAll() {
        return userInfoMapper.selectRoleAll();
    }

    @Override
    public List<Menuinfo> selectMenuByRole(Integer roleid) {
        return userInfoMapper.selectMenuByRole(roleid);
    }

    @Override
    public int deleteMenuByRoleid(Integer roleid) {
        return userInfoMapper.deleteMenuByRoleid(roleid);
    }

    @Override
    public int insertMenu(Map<String, Object> idMap) {
        return userInfoMapper.insertMenu(idMap);
    }

    @Override
    public List<UserInfo> queryAllUser(Map<String, Object> maps) {
        return userInfoMapper.queryAllUser(maps);
    }

    @Override
    public int queryAllRows() {
        return userInfoMapper.queryAllRows();
    }

    @Override
    public String selectDepNameByDepId(int departmentid) {
        return userInfoMapper.selectDepNameByDepId(departmentid);
    }

    @Override
    public String selectRoleNameByRoleId(int roleid) {
        return userInfoMapper.selectRoleNameByRoleId(roleid);
    }

    @Override
    public boolean updateUserState(int userid, int state) {
        int i = userInfoMapper.updateUserState(userid, state);
        return i > 0 ? true : false;
    }

    /**
     * ??????id??????????????????
     *
     * @param id
     * @param url
     * @return
     */
    public boolean updateImage(int id, String url) {
        int i = userInfoMapper.insertImage(id, url);
        return i > 0 ? true : false;
    }

    @Override
    public String ajaxUploadExcel(MultipartFile file) {
        // ??????IO???
        InputStream in = null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
            return "???????????????????????????";
        }

        // ??????IO????????????
        List<List<Object>> listob = null;
        try {
            listob = new ExcelUtil().getBankListByExcel(in, file.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
            return "?????????????????????????????????";
        }

        // ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            UserInfo j = null;
            // ????????????????????????????????????????????????????????????
            try {
                Integer.valueOf(String.valueOf(lo.get(0)));//??????userid
                String.valueOf(lo.get(1));
                String.valueOf(lo.get(2));
                String.valueOf(lo.get(3));
                String.valueOf(lo.get(4));
                Integer.valueOf(String.valueOf(lo.get(5)));
                String.valueOf(lo.get(6));
                String.valueOf(lo.get(7));
                String.valueOf(lo.get(8));
                String.valueOf(lo.get(9));
                Integer.valueOf(String.valueOf(lo.get(10)));
                Integer.valueOf(String.valueOf(lo.get(11)));
                Integer.valueOf(String.valueOf(lo.get(12)));
                String.valueOf(lo.get(13));
            } catch (Exception e) {
                return "?????????????????????????????????????????????";
            }

            // ????????????Excel?????????????????????????????????????????????????????????????????????return
            j = userInfoMapper.getUser(Integer.valueOf(String.valueOf(lo.get(0))));
            if (j != null) {
                return "??????ID:" + Integer.valueOf(String.valueOf(lo.get(0))) + "?????????";
            }
        }

        // ???????????????service?????????????????????????????????????????????????????????????????????
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            UserInfo userMes = new UserInfo();

            userMes.setUserid(Integer.valueOf(String.valueOf(lo.get(0))));//??????userid
            userMes.setUsername(String.valueOf(lo.get(1)));
            userMes.setUserpass(String.valueOf(lo.get(2)));
            userMes.setSex(String.valueOf(lo.get(3)));
            userMes.setBirthday(String.valueOf(lo.get(4)));
            userMes.setDepartmentid(Integer.valueOf(String.valueOf(lo.get(5))));
            userMes.setTelephone(String.valueOf(lo.get(6)));
            userMes.setAddress(String.valueOf(lo.get(7)));
            userMes.setEmail(String.valueOf(lo.get(8)));
            userMes.setEntertime(String.valueOf(lo.get(9)));
            userMes.setSalary(Integer.valueOf(String.valueOf(lo.get(10))));
            userMes.setRoleid(Integer.valueOf(String.valueOf(lo.get(11))));
            userMes.setState(Integer.valueOf(String.valueOf(lo.get(12))));
            userMes.setImageurl(String.valueOf(lo.get(13)));
            System.out.println(userMes);
            userInfoMapper.batchAddUser(userMes);

        }
        return "???????????????";
    }
}
