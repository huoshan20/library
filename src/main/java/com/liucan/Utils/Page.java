package com.liucan.Utils;

import java.util.List;

/**
 * @author kfstart
 * @descrption
 * @create 2019-10-29 17:38
 */
public class Page<T> {

    private List<T> list;
    private Integer pageNo;
    private Integer totalPageNo;
    private Integer pageSize;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getTotalPageNo() {
        return totalPageNo;
    }

    public void setTotalPageNo(Integer totalPageNo) {
        this.totalPageNo = totalPageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
