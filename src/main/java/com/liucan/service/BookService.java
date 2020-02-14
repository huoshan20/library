package com.liucan.service;

import com.liucan.entity.Book;

import com.liucan.entity.Booktype;
import com.liucan.mapper.BookMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 16:56
 */
@Service
public class BookService {
    @Autowired
    BookMapper bookMapper;
    public List<Book> queryByLimit(HashMap<String,Object> map) {
     List<Book> books  = bookMapper.queryByLimit(map);
     return books;
    }

    public int queryCount(HashMap<String,Object> map) {
      int a=  bookMapper.queryCount(map);
      return a;
    }

    public void deletebooks(String[] bookIds) {
        bookMapper.deletebooks(bookIds);
    }

    public void deletebook(String bookId) {
        bookMapper.deletebook(bookId);
    }

    public Book querybookById(String bookid) {
        return  bookMapper.querybookById(bookid);
    }

    public void updatebook(Book book) {
        bookMapper.updatebook(book);
    }

    public void addbook(Book book) {
        bookMapper.addbook(book);
    }



}
