package com.liucan.service;

import com.liucan.entity.Reader;
import com.liucan.mapper.ReaderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 16:56
 */
@Service
public class ReaderService {
    @Autowired
    ReaderMapper readerMapper;
    public List<Reader> queryByLimit(HashMap<String,Object> map) {
     List<Reader> readers  = readerMapper.queryByLimit(map);
     return readers;
    }

    public int queryCount(HashMap<String,Object> map) {
      int a=  readerMapper.queryCount(map);
      return a;
    }

    public void deletereaders(String[] readerIds) {
        readerMapper.deletereaders(readerIds);
    }

    public void deletereader(String readerId) {
        readerMapper.deletereader(readerId);
    }

    public Reader queryreaderById(String readerid) {
        return  readerMapper.queryreaderById(readerid);
    }

    public void updatereader(Reader reader) {
        readerMapper.updatereader(reader);
    }

    public void addreader(Reader reader) {
        readerMapper.addreader(reader);
    }

    public int countnow(String s) {
        return readerMapper.countnow(s);
    }
}
