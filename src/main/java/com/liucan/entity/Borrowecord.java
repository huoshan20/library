package com.liucan.entity;

import java.util.Date;

public class Borrowecord {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.borrowecordid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Integer borrowecordid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.fineid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Integer fineid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.readerid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private String readerid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.bookid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Integer bookid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.borrowdate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Date borrowdate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.expiredate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Date expiredate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column borrowecord.returndate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Date returndate;
    private Reader reader;
    private Book book;
    private Fine fine;

    public Reader getReader() {
        return reader;
    }

    public void setReader(Reader reader) {
        this.reader = reader;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Fine getFine() {
        return fine;
    }

    public void setFine(Fine fine) {
        this.fine = fine;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.borrowecordid
     *
     * @return the value of borrowecord.borrowecordid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Integer getBorrowecordid() {
        return borrowecordid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.borrowecordid
     *
     * @param borrowecordid the value for borrowecord.borrowecordid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setBorrowecordid(Integer borrowecordid) {
        this.borrowecordid = borrowecordid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.fineid
     *
     * @return the value of borrowecord.fineid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Integer getFineid() {
        return fineid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.fineid
     *
     * @param fineid the value for borrowecord.fineid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setFineid(Integer fineid) {
        this.fineid = fineid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.readerid
     *
     * @return the value of borrowecord.readerid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public String getReaderid() {
        return readerid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.readerid
     *
     * @param readerid the value for borrowecord.readerid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setReaderid(String readerid) {
        this.readerid = readerid == null ? null : readerid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.bookid
     *
     * @return the value of borrowecord.bookid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Integer getBookid() {
        return bookid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.bookid
     *
     * @param bookid the value for borrowecord.bookid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.borrowdate
     *
     * @return the value of borrowecord.borrowdate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Date getBorrowdate() {
        return borrowdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.borrowdate
     *
     * @param borrowdate the value for borrowecord.borrowdate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setBorrowdate(Date borrowdate) {
        this.borrowdate = borrowdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.expiredate
     *
     * @return the value of borrowecord.expiredate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Date getExpiredate() {
        return expiredate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.expiredate
     *
     * @param expiredate the value for borrowecord.expiredate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setExpiredate(Date expiredate) {
        this.expiredate = expiredate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column borrowecord.returndate
     *
     * @return the value of borrowecord.returndate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Date getReturndate() {
        return returndate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column borrowecord.returndate
     *
     * @param returndate the value for borrowecord.returndate
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setReturndate(Date returndate) {
        this.returndate = returndate;
    }
}