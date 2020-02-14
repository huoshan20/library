package com.liucan;

import org.junit.jupiter.api.Test;
import org.junit.platform.commons.util.PackageUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author asus
 * @create 2020-01-05 16:56
 */
public class CalendarTest {
    @Test
    public void testclander(){
        Calendar instance = Calendar.getInstance();
        System.out.println(instance);
        Date time = instance.getTime();
        instance.add(Calendar.DAY_OF_MONTH,27);
        Date time1 = instance.getTime();
        System.out.println(time1);
        System.out.println(time);
        Date date=new Date();


        System.out.println(date);
    }
    @Test
    public void test2(){

    }
}
