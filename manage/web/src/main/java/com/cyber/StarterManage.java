package com.cyber;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.cyber.mapper")
/*@ServletComponentScan("com.cyber.filter")*/
public class StarterManage {
    public static void main(String[] args) {

        SpringApplication.run(StarterManage.class, args);
    }
}
