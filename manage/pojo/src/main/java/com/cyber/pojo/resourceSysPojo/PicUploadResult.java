package com.cyber.pojo.resourceSysPojo;

public class PicUploadResult {
    private Integer error;
    private String url;             //应该是浏览器能够解析的具体页面路径  相对路径http://image.jt/1212.jpg
    //本地路径:存放图片路径     D:\jt-upload\images\2017\06\03
    private String width;
    private String height;

    public Integer getError() {
        return error;
    }

    public void setError(Integer error) {
        this.error = error;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    @Override
    public String toString() {
        return "PicUploadResult{" +
                "error=" + error +
                ", url='" + url + '\'' +
                ", width='" + width + '\'' +
                ", height='" + height + '\'' +
                '}';
    }
}
