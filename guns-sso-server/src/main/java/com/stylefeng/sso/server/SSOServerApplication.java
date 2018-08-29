package com.stylefeng.sso.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 单点登录服务器
 *
 * @author stylefeng
 * @Date 2018年2月3日15:32:21
 */
@SpringBootApplication
public class SSOServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SSOServerApplication.class, args);
    }
}