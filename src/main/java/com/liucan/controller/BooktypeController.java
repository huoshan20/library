package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Page;
import com.liucan.entity.Booktype;
import com.liucan.service.BooktypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2020-02-05 21:07
 */
@Controller
public class BooktypeController {
    @Autowired
    BooktypeService booktypeService;

    @RequestMapping("/booktype")
    public String tobooktype(){
        return "bookmanage/booktype_list";
    }
    @ResponseBody
    @RequestMapping("/booktypeajaxQuery")
    public AjaxResult booktypeajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Booktype> booktypes = booktypeService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = booktypeService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Booktype> booktypePage = new Page<Booktype>();
            booktypePage.setTotalPageNo(totalPageNo);
            booktypePage.setPageSize(pageSize);
            booktypePage.setPageNo(pageNo);
            booktypePage.setList(booktypes);

            ajaxResult.setData(booktypePage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletebooktypes")
    public AjaxResult deletebooktypes(Integer[] booktypeIds){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            booktypeService.deletebooktypes(booktypeIds);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletebooktype")
    public AjaxResult deletebooktype(Integer id){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            booktypeService.deletebooktype(id);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
   @RequestMapping("/booktypetoUpdate") 
    public String booktypetoUpdate(@RequestParam(value = "booktypeid" , required = false) Integer booktypeid,
                                     Model model){
       Booktype booktype = booktypeService.querybooktypeById(booktypeid);

       model.addAttribute("booktype",booktype);
        return "bookmanage/booktype_update";
   }
   @ResponseBody
    @RequestMapping("/booktypeupdate")
    public AjaxResult booktypeUpdate(Booktype booktype){
       AjaxResult ajaxResult = new AjaxResult();
       try{
           booktypeService.updatebooktype(booktype);
       }catch(Exception e){
           ajaxResult.setSuccess(false);
           e.printStackTrace();
       }
       return ajaxResult;
    }
    @RequestMapping("/booktypetoadd")
    public String booktypetoadd(){
        return "bookmanage/booktype_add";
    }
    @ResponseBody
    @RequestMapping("/booktypeadd")
    public AjaxResult booktypeadd(Booktype booktype){
        AjaxResult ajaxResult = new AjaxResult();
        try{

          booktypeService.addbooktype(booktype);

        }catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    
}
