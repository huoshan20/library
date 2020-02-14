package com.liucan.service;

import com.liucan.Utils.FineStandard;
import com.liucan.Utils.MailUtils;
import com.liucan.entity.*;
import com.liucan.mapper.BookMapper;
import com.liucan.mapper.BorrowMapper;
import com.liucan.mapper.BorrowecordMapper;
import com.liucan.mapper.FineMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.accept.FixedContentNegotiationStrategy;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author asus
 * @create 2019-12-29 15:45
 */
@Service
public class BorrowService {
    @Autowired
    BorrowMapper borrowMapper;
    @Autowired
    BookMapper bookMapper;
    @Autowired
    BorrowecordMapper borrowecordMapper;
    @Autowired
    FineMapper fineMapper;

  public long countBorrow(){
      long l = borrowMapper.countByExample(new BorrowExample());
      return l;
  }
  public long countOverdue(){
      long l = borrowMapper.countOverdue();
      return l;

  }
  @Transactional
    public int borrowBook(Borrow borrow) {
        int insert = borrowMapper.insert(borrow);
        bookMapper.updatebookstatus(borrow.getBookid());
        return insert;
    }

    public List<Book> getborrowbooks(String readerid) {
   List<Book> books=  borrowMapper.getborrowbooks(readerid);
   return books;
    }
@Transactional
    public List<FineStandard> returnbook(String readerid, Integer[] bookids) {

      List<FineStandard> fineStandards=new ArrayList<>();
       for (Integer bookid :bookids){
           Borrowecord borrowecord=new Borrowecord();
           Borrow borrow = borrowMapper.selectByPrimaryKey(new BorrowKey(bookid, readerid));
           borrowecord.setBookid(borrow.getBookid());
           borrowecord.setReaderid(borrow.getReaderid());
           borrowecord.setBorrowdate(borrow.getBorrowdate());
           borrowecord.setExpiredate(borrow.getExpiredate());
           Date date=new Date();
           borrowecord.setReturndate(date);
           if (date.getTime()>borrow.getExpiredate().getTime()){
               int days = (int) ((date.getTime() - borrow.getExpiredate().getTime()) / (1000*3600*24));
               Book book = bookMapper.selectbybookid(bookid);
               fineStandards.add(new FineStandard(book.getBookname(),days));
               Fine fine=new Fine();
               fine.setOverdueday(days);
               DecimalFormat decimalFormat=new DecimalFormat("0.00");
               fine.setOverduemoney(Double.parseDouble(decimalFormat.format(days*FineStandard.getStrandard())));
               fineMapper.insertfine(fine);
               borrowecord.setFineid(fine.getFineid());
               borrowecordMapper.insert(borrowecord);
           }
           bookMapper.updatestatus(bookid);
       }
      borrowMapper.deletebooks(bookids);
       return fineStandards;
    }

    public int queryCount(HashMap<String,Object> map) {
      return borrowMapper.queryCount(map);
    }

    public List<Borrow> queryByLimit(HashMap<String,Object> map) {
      return  borrowMapper.queryByLimit(map);
    }

    public void sendemail() {
    List<Borrow> borrows= borrowMapper.queryOverdue();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
    for (Borrow borrow:borrows){
       String to=borrow.getReader().getQq()+"@qq.com";
       String aa=simpleDateFormat.format(borrow.getExpiredate());
       String text="您借的"+borrow.getBook().getBookname()+"已经过了约定时间"+aa+",请及时归还";
       String title="书籍归还提醒";
        MailUtils.sendMail(to,text,title);
    }
    }
}
