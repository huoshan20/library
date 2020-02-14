package com.liucan.config;

import com.liucan.Interceptor.LoginInterceptor;
import com.liucan.Interceptor.SuperAdminInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author asus
 * @create 2020-02-12 20:52
 */
@Configuration
public class DispatcherConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {

       registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**")
               .excludePathPatterns(new String[]{"/","/doAJAXLogin","/login"});
        registry.addInterceptor(new SuperAdminInterceptor()).addPathPatterns("/*admin*");

    }
}
