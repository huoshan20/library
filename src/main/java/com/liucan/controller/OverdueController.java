package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Page;
import com.liucan.entity.Borrow;
import com.liucan.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
public class OverdueController {
    @Autowired
    BorrowService borrowService;

    @RequestMapping("/overdue")
    public String tooverdue(){
        return "info/overdue";
    }
    @ResponseBody
    @RequestMapping("/overdueajaxQuery")
    public AjaxResult overdueajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Borrow> overdues = borrowService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = borrowService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Borrow> overduePage = new Page<Borrow>();
            overduePage.setTotalPageNo(totalPageNo);
            overduePage.setPageSize(pageSize);
            overduePage.setPageNo(pageNo);
            overduePage.setList(overdues);

            ajaxResult.setData(overduePage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }
    @ResponseBody
    @RequestMapping("/sendemail")
    public AjaxResult sendemail(){
      AjaxResult ajaxResult=new AjaxResult();
      try {
         borrowService.sendemail();
      }catch (Exception e){
          ajaxResult.setSuccess(false);
          e.printStackTrace();

      }
      return ajaxResult;
}

}
