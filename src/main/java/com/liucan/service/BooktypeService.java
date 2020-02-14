package com.liucan.service;

import com.liucan.entity.Booktype;
import com.liucan.mapper.BooktypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 16:56
 */
@Service
public class BooktypeService {
    @Autowired
    BooktypeMapper booktypeMapper;
    public List<Booktype> queryByLimit(HashMap<String,Object> map) {
     List<Booktype> booktypes  = booktypeMapper.queryByLimit(map);
     return booktypes;
    }

    public int queryCount(HashMap<String,Object> map) {
      int a=  booktypeMapper.queryCount(map);
      return a;
    }

    public void deletebooktypes(Integer[] booktypeIds) {
        booktypeMapper.deletebooktypes(booktypeIds);
    }

    public void deletebooktype(Integer booktypeId) {
        booktypeMapper.deletebooktype(booktypeId);
    }

    public Booktype querybooktypeById(Integer booktypeid) {
        return  booktypeMapper.querybooktypeById(booktypeid);
    }

    public void updatebooktype(Booktype booktype) {
        booktypeMapper.updatebooktype(booktype);
    }

    public void addbooktype(Booktype booktype) {
        booktypeMapper.addbooktype(booktype);
    }



    public List<Booktype> selectall() {
        return booktypeMapper.selectall();
    }
}
