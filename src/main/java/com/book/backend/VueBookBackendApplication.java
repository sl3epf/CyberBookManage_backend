package com.book.backend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.tags.EditorAwareTag;
import sun.jvmstat.perfdata.monitor.PerfStringVariableMonitor;

import javax.swing.*;


@SpringBootApplication
@MapperScan("com.book.backend.mapper")
@EnableTransactionManagement
public class VueBookBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(VueBookBackendApplication.class, args);
    }
}
