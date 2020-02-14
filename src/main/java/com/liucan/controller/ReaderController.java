package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Page;
import com.liucan.entity.Reader;
import com.liucan.service.ReaderService;
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
public class ReaderController {
    @Autowired
    ReaderService readerService;

    @RequestMapping("/reader")
    public String toreader(){
        return "readermanage/reader_list";
    }
    @ResponseBody
    @RequestMapping("/readerajaxQuery")
    public AjaxResult readerajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Reader> readers = readerService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = readerService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Reader> readerPage = new Page<Reader>();
            readerPage.setTotalPageNo(totalPageNo);
            readerPage.setPageSize(pageSize);
            readerPage.setPageNo(pageNo);
            readerPage.setList(readers);

            ajaxResult.setData(readerPage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletereaders")
    public AjaxResult deletereaders(String[] readerIds){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            readerService.deletereaders(readerIds);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/deletereader")
    public AjaxResult deletereader(String id){
        AjaxResult ajaxResult = new AjaxResult();

        try{

            readerService.deletereader(id);

        } catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
   @RequestMapping("/readertoUpdate") 
    public String readertoUpdate(@RequestParam(value = "readerid" , required = false) String readerid,
                                     Model model){
       Reader reader = readerService.queryreaderById(readerid);

       model.addAttribute("reader",reader);
        return "readermanage/reader_update";
   }
   @ResponseBody
    @RequestMapping("/readerupdate")
    public AjaxResult readerUpdate(Reader reader){
       AjaxResult ajaxResult = new AjaxResult();
       try{
           readerService.updatereader(reader);
       }catch(Exception e){
           ajaxResult.setSuccess(false);
           e.printStackTrace();
       }
       return ajaxResult;
    }
    @RequestMapping("/readertoadd")
    public String readertoadd(){
        return "readermanage/reader_add";
    }
    @ResponseBody
    @RequestMapping("/readeradd")
    public AjaxResult readeradd(Reader reader){
        AjaxResult ajaxResult = new AjaxResult();
        try{
            Date date=new Date();
            SimpleDateFormat sf=new SimpleDateFormat("yyyyMMdd");
            String s=sf.format(date);
         int a=   readerService.countnow(s);
         a++;
         String b=a+"";
         while (b.length()<=4){
             b="0"+b;
         }
         reader.setReadid(s+a);
            reader.setRegisterdate(new Date());
            reader.setStatus((byte)1);
            readerService.addreader(reader);

        }catch(Exception e){
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }

        return ajaxResult;
    }
    
}
