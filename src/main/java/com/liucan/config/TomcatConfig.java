package com.liucan.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

/**
 * @author asus
 * @create 2020-02-11 21:23
 */
@Configuration
public class TomcatConfig {
    @Bean
    public ServletRegistrationBean myServlet(){
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean();
        servletRegistrationBean.setServlet(new AuthCodeServlet());
        servletRegistrationBean.setUrlMappings(Arrays.asList("/authCode"));
        servletRegistrationBean.setLoadOnStartup(1);
        return servletRegistrationBean;
    }
}
