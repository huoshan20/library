package com.liucan.controller;

import com.liucan.Utils.AjaxResult;

import com.liucan.Utils.Encryption;
import com.liucan.entity.Admin;
import com.liucan.service.AdminService;
import com.liucan.service.BookecordService;
import com.liucan.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.lang.model.element.NestingKind;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author asus
 * @create 2019-12-29 15:43
 */
@Controller
public class MainController {
     @Autowired
    BookecordService bookecordService;
     @Autowired
    BorrowService borrowService;
    @Autowired
    AdminService adminService;

     @RequestMapping("/main")
    public String main(Map<String,Object> map){
        long l = bookecordService.countBookecord();
         map.put("bookecords",l);
         long ll = borrowService.countOverdue();
         long l1 = borrowService.countBorrow();
         map.put("borrows",l1);
         map.put("overduo",ll);
         return "main/info";
     }
     @RequestMapping("toupdatepassword")
    public String toupdatepassword(){
         return "main/updatepassword";
     }
    @RequestMapping("toupdateinfo")
    public String toupdateinfo(){
        return "main/updateinfo";
    }
     @ResponseBody
    @RequestMapping("/updatepassword")
    public AjaxResult updatepassword(@RequestParam("oldpassword")String oldpassword, @RequestParam("password1")String password
     , HttpSession session){
         AjaxResult ajaxResult=new AjaxResult();
         try {
             Admin adminInfo = (Admin) session.getAttribute("adminInfo");
             if (adminInfo.getPassword().equals(Encryption.jiami(oldpassword))){
                 adminService.updatepassword(adminInfo,Encryption.jiami(password));
                 adminInfo.setPassword(Encryption.jiami(password));
             }else{
                 ajaxResult.setData(0);
             }

         }catch (Exception e){
             ajaxResult.setSuccess(false);
             e.printStackTrace();
         }
         return ajaxResult;
     }
    @ResponseBody
    @RequestMapping("/updateinfo")
    public AjaxResult updateinfo(Admin admin   , HttpSession session){
        AjaxResult ajaxResult=new AjaxResult();
        try {
         adminService.updateadmin(admin);
            Admin adminInfo = (Admin)session.getAttribute("adminInfo");
            adminInfo.setAdminaddress(admin.getAdminaddress());
            adminInfo.setAdminname(admin.getAdminname());
            adminInfo.setAdmintel(admin.getAdmintel());
        }catch (Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
@RequestMapping("/logout")
    public String logout(HttpSession session){
       session.invalidate();
       return "login";
}
    @RequestMapping("/nopower")
    public String nopower(HttpSession session){
        session.invalidate();
        return "nopower";
    }
}
