package com.cyber.config;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class PathConfig {

    /**
     * 保存文章内容中图片的磁盘路径
     */
    @Value("${window.saveImg.path}")
    private String imgPath;
    /**
     * 保存文章内容的磁盘路径
     */
    @Value("${window.saveArticle.path}")
    private String articlePath;
    /**
     * 对外开放的访问图片的路径，实际上是文章中访问
     */
    @Value("${window.server.img.path}")
    private String serverImgPath;
    /**
     * 对外开放的访问文章的路径
     */
    @Value("${window.server.article.path}")
    private String serverArtiPath;

    @Bean
    public String imgPath() {
        File imgFile = new File(imgPath);
        if (!imgFile.exists()) {
            imgFile.mkdirs();
            System.out.println("文件创建成功...");
        }
        return imgPath;
    }

    @Bean
    public String articlePath() {
        File imgFile = new File(articlePath);
        if (!imgFile.exists()) {
            imgFile.mkdirs();
            System.out.println("文件创建成功...");
        }
        return articlePath;
    }

    @Bean
    public String serverImgPath() {
        return serverImgPath;
    }

    @Bean
    public String serverArtiPath() {
        return serverArtiPath;
    }

}
