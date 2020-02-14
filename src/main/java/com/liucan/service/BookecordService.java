package com.liucan.service;

import com.liucan.entity.BorrowecordExample;
import com.liucan.mapper.BorrowecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author asus
 * @create 2019-12-29 15:45
 */
@Service
public class BookecordService {
    @Autowired
    BorrowecordMapper borrowecordMapper;
    public long countBookecord(){
        long l = borrowecordMapper.countByExample(new BorrowecordExample());
        return l;
    }
}
