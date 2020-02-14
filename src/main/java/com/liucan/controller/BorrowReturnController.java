package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.FineStandard;
import com.liucan.entity.Book;
import com.liucan.entity.Borrow;
import com.liucan.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-30 10:18
 */
@Controller
public class BorrowReturnController {
    @Autowired
    BorrowService borrowService;

    @RequestMapping("/borrow")
    public String toborrowbook(){
        return "borrow_return/borrowbook";
    }
    @RequestMapping("/return")
    public String toreturnbook(){
        return "borrow_return/returnbook";
    }
    @ResponseBody
    @RequestMapping("/borrowbook")
    public AjaxResult borrowbook(Borrow borrow,Integer borrowdates){
        AjaxResult ajaxResult = new AjaxResult();

        try{
            borrow.setBorrowdate(new Date());
            Calendar instance = Calendar.getInstance();
            instance.add(Calendar.DAY_OF_MONTH,borrowdates);
            Date time = instance.getTime();
            borrow.setExpiredate(time);
            borrowService.borrowBook(borrow);
        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
        
    }
    @ResponseBody
    @RequestMapping("/getborrowbooks")
    public AjaxResult getborrowbooks(String readerid){
        AjaxResult ajaxResult=new AjaxResult();
        try{
            List<Book> books= borrowService.getborrowbooks(readerid);
            ajaxResult.setData(books);
        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;


    }
    @ResponseBody
    @RequestMapping("/returnbook")
    public AjaxResult returnbook(String readerid,Integer[]bookids){
        AjaxResult ajaxResult=new AjaxResult();
        try{
            List<FineStandard> returnbook = borrowService.returnbook(readerid, bookids);
            if (returnbook.size()>0){
                ajaxResult.setData(returnbook);
            }
        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;


    }


}
