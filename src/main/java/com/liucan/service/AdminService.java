package com.liucan.service;


import com.liucan.entity.Admin;
import com.liucan.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 16:56
 */
@Service
public class AdminService {
    @Autowired
    AdminMapper adminMapper;
    public List<Admin> queryByLimit(HashMap<String,Object> map) {
     List<Admin> admins  = adminMapper.queryByLimit(map);
     return admins;
    }

    public int queryCount(HashMap<String,Object> map) {
      int a=  adminMapper.queryCount(map);
      return a;
    }

    public void deleteadmins(Integer[] adminIds) {
        adminMapper.deleteadmins(adminIds);
    }

    public void deleteadmin(Integer adminId) {
        adminMapper.deleteadmin(adminId);
    }

    public Admin queryadminById(Integer adminid) {
        return  adminMapper.queryadminById(adminid);
    }

    public void updateadmin(Admin admin) {
        adminMapper.updateadmin(admin);
    }

    public void addadmin(Admin admin) {
        adminMapper.addadmin(admin);
    }

    public  Admin getAdminByNameAndPassword(Admin admin) {
        return adminMapper.getAdminByNameAndPassword(admin);
    }

    public void updatepassword(Admin adminInfo, String jiami) {
        adminMapper.updatepassword(adminInfo,jiami);
    }
}
