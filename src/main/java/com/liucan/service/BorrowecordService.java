package com.liucan.service;

import com.liucan.Utils.FineStandard;
import com.liucan.entity.*;
import com.liucan.mapper.BookMapper;
import com.liucan.mapper.BorrowMapper;
import com.liucan.mapper.BorrowecordMapper;
import com.liucan.mapper.FineMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 15:45
 */
@Service
public class BorrowecordService {
    @Autowired
  BorrowecordMapper borrowecordMapper;


    public List<Borrowecord> queryByLimit(HashMap<String,Object> map) {
        return borrowecordMapper.queryByLimit(map);
    }

    public int queryCount(HashMap<String,Object> map) {
      return   borrowecordMapper.queryCount(map);
    }
}
