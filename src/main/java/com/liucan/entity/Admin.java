package com.liucan.entity;

public class Admin {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.adminid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private Integer adminid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.adminname
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private String adminname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.admintel
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private String admintel;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.adminaddress
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private String adminaddress;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column admin.password
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    private String password;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column admin.adminid
     *
     * @return the value of admin.adminid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public Integer getAdminid() {
        return adminid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.adminid
     *
     * @param adminid the value for admin.adminid
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column admin.adminname
     *
     * @return the value of admin.adminname
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public String getAdminname() {
        return adminname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.adminname
     *
     * @param adminname the value for admin.adminname
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column admin.admintel
     *
     * @return the value of admin.admintel
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public String getAdmintel() {
        return admintel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.admintel
     *
     * @param admintel the value for admin.admintel
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setAdmintel(String admintel) {
        this.admintel = admintel == null ? null : admintel.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column admin.adminaddress
     *
     * @return the value of admin.adminaddress
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public String getAdminaddress() {
        return adminaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.adminaddress
     *
     * @param adminaddress the value for admin.adminaddress
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setAdminaddress(String adminaddress) {
        this.adminaddress = adminaddress == null ? null : adminaddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column admin.password
     *
     * @return the value of admin.password
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column admin.password
     *
     * @param password the value for admin.password
     *
     * @mbg.generated Sun Dec 29 16:04:15 CST 2019
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}