package com.liucan.service;

import com.liucan.entity.Bookshelf;
import com.liucan.entity.Booktype;
import com.liucan.mapper.BookshelfMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 16:56
 */
@Service
public class BookshelfService {
    @Autowired
    BookshelfMapper bookshelfMapper;
    public List<Bookshelf> queryByLimit(HashMap<String,Object> map) {
     List<Bookshelf> bookshelfs  = bookshelfMapper.queryByLimit(map);
     return bookshelfs;
    }

    public int queryCount(HashMap<String,Object> map) {
      int a=  bookshelfMapper.queryCount(map);
      return a;
    }

    public void deletebookshelfs(Integer[] bookshelfIds) {
        bookshelfMapper.deletebookshelfs(bookshelfIds);
    }

    public void deletebookshelf(Integer bookshelfId) {
        bookshelfMapper.deletebookshelf(bookshelfId);
    }

    public Bookshelf querybookshelfById(Integer bookshelfid) {
        return  bookshelfMapper.querybookshelfById(bookshelfid);
    }

    public void updatebookshelf(Bookshelf bookshelf) {
        bookshelfMapper.updatebookshelf(bookshelf);
    }

    public void addbookshelf(Bookshelf bookshelf) {
        bookshelfMapper.addbookshelf(bookshelf);
    }



    public List<Bookshelf> selectall() {
     return   bookshelfMapper.selectall();
    }
}
