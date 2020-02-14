package com.liucan;

import com.liucan.Utils.Encryption;
import org.assertj.core.internal.bytebuddy.agent.builder.AgentBuilder;
import org.junit.jupiter.api.Test;
import org.springframework.util.DigestUtils;
import sun.security.action.PutAllAction;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author asus
 * @create 2019-12-21 10:57
 */
public class jiami {
    @Test
    public void testmd5() throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        System.out.println("123456".getBytes());
        md5.update("123456".getBytes());
        byte[] digest = md5.digest();
        for (byte b :digest){
            System.out.println(b);
        }
        System.out.println(digest);
        System.out.println(digest.length);
        String s = DigestUtils.md5DigestAsHex("123456".getBytes());
        System.out.println(s);
        System.out.println();
    }
    @Test
    public void testjiami(){
     String s=   Encryption.jiami("123456");
        System.out.println(s+" "+s.length());
        System.out.println("123".equals(123));
        System.out.println("123".equals("123"));
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(simpleDateFormat.format(new Date()));
    }


}
