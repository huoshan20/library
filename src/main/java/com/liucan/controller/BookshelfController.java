package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Page;
import com.liucan.entity.Bookshelf;
import com.liucan.service.BookshelfService;
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
public class BookshelfController {
    @Autowired
    BookshelfService bookshelfService;

    @RequestMapping("/bookshelf")
    public String tobookshelf(){
        return "bookmanage/bookshelf_list";
    }
    @ResponseBody
    @RequestMapping("/bookshelfajaxQuery")
    public AjaxResult bookshelfajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Bookshelf> bookshelfs = bookshelfService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = bookshelfService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Bookshelf> bookshelfPage = new Page<Bookshelf>();
            bookshelfPage.setTotalPageNo(totalPageNo);
            bookshelfPage.setPageSize(pageSize);
            bookshelfPage.setPageNo(pageNo);
            bookshelfPage.setList(bookshelfs);

            ajaxResult.setData(bookshelfPage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletebookshelfs")
    public AjaxResult deletebookshelfs(Integer[] bookshelfIds){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            bookshelfService.deletebookshelfs(bookshelfIds);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletebookshelf")
    public AjaxResult deletebookshelf(Integer id){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            bookshelfService.deletebookshelf(id);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
   @RequestMapping("/bookshelftoUpdate") 
    public String bookshelftoUpdate(@RequestParam(value = "bookshelfid" , required = false) Integer bookshelfid,
                                     Model model){
       Bookshelf bookshelf = bookshelfService.querybookshelfById(bookshelfid);

       model.addAttribute("bookshelf",bookshelf);
        return "bookmanage/bookshelf_update";
   }
   @ResponseBody
    @RequestMapping("/bookshelfupdate")
    public AjaxResult bookshelfUpdate(Bookshelf bookshelf){
       AjaxResult ajaxResult = new AjaxResult();
       try{
           bookshelfService.updatebookshelf(bookshelf);
       }catch(Exception e){
           ajaxResult.setSuccess(false);
           e.printStackTrace();
       }
       return ajaxResult;
    }
    @RequestMapping("/bookshelftoadd")
    public String bookshelftoadd(){
        return "bookmanage/bookshelf_add";
    }
    @ResponseBody
    @RequestMapping("/bookshelfadd")
    public AjaxResult bookshelfadd(Bookshelf bookshelf){
        AjaxResult ajaxResult = new AjaxResult();
        try{

           bookshelfService.addbookshelf(bookshelf);

        }catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    
}
