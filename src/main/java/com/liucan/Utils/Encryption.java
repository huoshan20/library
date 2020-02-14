package com.liucan.Utils;

import org.springframework.util.DigestUtils;

/**
 * @author asus
 * @create 2019-12-21 10:56
 */
public class Encryption {
    public static  String jiami(String mingweng){
        String s = DigestUtils.md5DigestAsHex(mingweng.getBytes());
        String b=s.substring(1,6)+s.substring(8,13)+s.substring(16,21)+s.substring(25,30);
        return b;
    }
}
