package com.liucan.controller;

import com.liucan.Utils.AjaxResult;
import com.liucan.Utils.Page;

import com.liucan.entity.Borrowecord;
import com.liucan.service.BorrowecordService;
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
public class BorrowecordController {
    @Autowired
    BorrowecordService borrowecordService;

    @RequestMapping("/borrowecord")
    public String toborrowecord(){
        return "info/borrowhistory";
    }
    @ResponseBody
    @RequestMapping("/borrowecordajaxQuery")
    public AjaxResult borrowecordajaxQuery(@RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                      @RequestParam(required = false, defaultValue = "4") Integer pageSize,
                                      @RequestParam(required = false, defaultValue = "") String queryLikeStr){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.setSuccess(true);
        try {
            HashMap<String, Object> map = new HashMap<String, Object>();

            map.put("start", (pageNo - 1) * pageSize);
            map.put("size", pageSize);
            map.put("queryLikeStr", queryLikeStr);

            List<Borrowecord> borrowecords = borrowecordService.queryByLimit(map);

            int totalPageNo = 0;
            int totalSize = borrowecordService.queryCount(map);
            if (totalSize % pageSize == 0) {
                totalPageNo = totalSize / pageSize;
            } else {
                totalPageNo = totalSize / pageSize + 1;
            }

            Page<Borrowecord> borrowecordPage = new Page<Borrowecord>();
            borrowecordPage.setTotalPageNo(totalPageNo);
            borrowecordPage.setPageSize(pageSize);
            borrowecordPage.setPageNo(pageNo);
            borrowecordPage.setList(borrowecords);

            ajaxResult.setData(borrowecordPage);
        } catch (Exception e) {
            ajaxResult.setSuccess(false);
            e.printStackTrace();
        }
        return ajaxResult;
    }


}
