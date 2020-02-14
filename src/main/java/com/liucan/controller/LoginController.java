package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.AuthCodeUtil;
import com.liucan.Utils.Encryption;
import com.liucan.entity.Admin;
import com.liucan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;

/**
 * @author asus
 * @create 2019-12-19 11:03
 */
@Controller
public class LoginController {
    @Autowired
    AdminService adminService;
    @ResponseBody
    @RequestMapping("/doAJAXLogin")
    public AjaxResult login(Admin admin, @RequestParam("code") String validateCode ,HttpSession session){
        boolean isSuccess = true;
        Map<String, Object> resultMap = new HashMap<>();
        admin.setPassword(Encryption.jiami(admin.getPassword()));
        try {
            // 1、 校验验证码是否和 session 域中保存的验证码一致
            String sessionValidateCode = (String) session.getAttribute("code");
            if(!sessionValidateCode.equalsIgnoreCase(validateCode)){
                // 验证码不正确
                resultMap.put("messageCode",1001);
            }else{
                // 2、 校验用户名和密码是否一致
                Admin adminInfo = adminService.getAdminByNameAndPassword(admin);
                if(adminInfo == null){
                    resultMap.put("messageCode",1002);
                }else{
                    resultMap.put("messageCode",1000);

                    //  将数据存入Session域中
                    session.setAttribute("adminInfo",adminInfo);

                    if (admin.getAdminid()==1001){
                        session.setAttribute("admin","superadmin");
                    }
                }
            }
        } catch (Exception e) {
            isSuccess = false;
            e.printStackTrace();
        }
        AjaxResult ajaxResult = new AjaxResult(isSuccess, resultMap);

        return ajaxResult;
    }

    @RequestMapping("/")
    public String chushi(){
        return "login";
    }
    @RequestMapping("/library")
    public String zhuti(){
        return "main/main";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
}
