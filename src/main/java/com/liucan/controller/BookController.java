package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Page;
import com.liucan.entity.Book;
import com.liucan.entity.Bookshelf;
import com.liucan.entity.Booktype;
import com.liucan.service.BookService;
import com.liucan.service.BookshelfService;
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
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    BooktypeService booktypeService;
    @Autowired
    BookshelfService bookshelfService;
    @RequestMapping("/book")
    public String tobook(){
        return "bookmanage/book_list";
    }
    @ResponseBody
    @RequestMapping("/bookajaxQuery")
    public AjaxResult bookajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Book> books = bookService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = bookService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Book> bookPage = new Page<Book>();
            bookPage.setTotalPageNo(totalPageNo);
            bookPage.setPageSize(pageSize);
            bookPage.setPageNo(pageNo);
            bookPage.setList(books);

            ajaxResult.setData(bookPage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletebooks")
    public AjaxResult deletebooks(String[] bookIds){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            bookService.deletebooks(bookIds);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletebook")
    public AjaxResult deletebook(String id){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            bookService.deletebook(id);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
   @RequestMapping("/booktoUpdate") 
    public String booktoUpdate(@RequestParam(value = "bookid" , required = false) String bookid,
                                     Model model){
       Book book = bookService.querybookById(bookid);
       List<Booktype> booktypes= booktypeService.selectall();
       List<Bookshelf> bookshelfs= bookshelfService.selectall();
       model.addAttribute("booktypes",booktypes);
       model.addAttribute("bookshelfs",bookshelfs);
       model.addAttribute("book",book);
        return "bookmanage/book_update";
   }
   @ResponseBody
    @RequestMapping("/bookupdate")
    public AjaxResult bookUpdate(Book book){
       AjaxResult ajaxResult = new AjaxResult();
       try{
           bookService.updatebook(book);
       }catch(Exception e){
           ajaxResult.setSuccess(false);
           e.printStackTrace();
       }
       return ajaxResult;
    }
    @RequestMapping("/booktoadd")
    public String booktoadd(Model model){
    List<Booktype> booktypes= booktypeService.selectall();
    List<Bookshelf> bookshelfs= bookshelfService.selectall();
    model.addAttribute("booktypes",booktypes);
    model.addAttribute("bookshelfs",bookshelfs);
        return "bookmanage/book_add";
    }
    @ResponseBody
    @RequestMapping("/bookadd")
    public AjaxResult bookadd(Book book){
        AjaxResult ajaxResult = new AjaxResult();
        try{
book.setIndate(new Date());
book.setBookstatus(0);
book.setBorrowtotals(0);
          bookService.addbook(book);

        }catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    
}
