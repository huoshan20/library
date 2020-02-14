package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Encryption;
import com.liucan.Utils.Page;

import com.liucan.entity.Admin;

import com.liucan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2020-02-05 21:07
 */
@Controller
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("/admin")
    public String toadmin(){
        return "admin/admin_list";
    }
    @ResponseBody
    @RequestMapping("/adminajaxQuery")
    public AjaxResult adminajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Admin> admins = adminService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = adminService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Admin> adminPage = new Page<Admin>();
            adminPage.setTotalPageNo(totalPageNo);
            adminPage.setPageSize(pageSize);
            adminPage.setPageNo(pageNo);
            adminPage.setList(admins);

            ajaxResult.setData(adminPage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deleteadmins")
    public AjaxResult deleteadmins(Integer[] adminIds){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            adminService.deleteadmins(adminIds);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deleteadmin")
    public AjaxResult deleteadmin(Integer id){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            adminService.deleteadmin(id);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
   @RequestMapping("/admintoUpdate") 
    public String admintoUpdate(@RequestParam(value = "adminid" , required = false) Integer adminid,
                                     Model model){
       Admin admin = adminService.queryadminById(adminid);

       model.addAttribute("admin",admin);
        return "admin/admin_update";
   }
   @ResponseBody
    @RequestMapping("/adminupdate")
    public AjaxResult adminUpdate(Admin admin){
       AjaxResult ajaxResult = new AjaxResult();
       try{
           adminService.updateadmin(admin);
       }catch(Exception e){
           ajaxResult.setSuccess(false);
           e.printStackTrace();
       }
       return ajaxResult;
    }
    @RequestMapping("/admintoadd")
    public String admintoadd(){
        return "admin/admin_add";
    }
    @ResponseBody
    @RequestMapping("/adminadd")
    public AjaxResult adminadd(Admin admin){
        AjaxResult ajaxResult = new AjaxResult();
        try{
           admin.setPassword(Encryption.jiami("123456"));
          adminService.addadmin(admin);

        }catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    
}
