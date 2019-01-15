package com.cyber.pojo.resourceSysPojo;

import com.cyber.pojo.Category;
import com.cyber.pojo.User;

import java.util.Date;


public class Resource {
    private Integer resourceId;
    private String resourceName;
    private String resourceDesc;
    private String resourcePicture;
    private String resourcePath;

    private String resourcePwd;
    private Integer resourceCount;
    private Date resourceCtime;
    private Date resourceUtime;
    private Character power;

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getResourceDesc() {
        return resourceDesc;
    }

    public void setResourceDesc(String resourceDesc) {
        this.resourceDesc = resourceDesc;
    }

    public String getResourcePicture() {
        return resourcePicture;
    }

    public void setResourcePicture(String resourcePicture) {
        this.resourcePicture = resourcePicture;
    }

    public String getResourcePath() {
        return resourcePath;
    }

    public void setResourcePath(String resourcePath) {
        this.resourcePath = resourcePath;
    }

    public String getResourcePwd() {
        return resourcePwd;
    }

    public void setResourcePwd(String resourcePwd) {
        this.resourcePwd = resourcePwd;
    }

    public Integer getResourceCount() {
        return resourceCount;
    }

    public void setResourceCount(Integer resourceCount) {
        this.resourceCount = resourceCount;
    }

    public Date getResourceCtime() {
        return resourceCtime;
    }

    public void setResourceCtime(Date resourceCtime) {
        this.resourceCtime = resourceCtime;
    }

    public Date getResourceUtime() {
        return resourceUtime;
    }

    public void setResourceUtime(Date resourceUtime) {
        this.resourceUtime = resourceUtime;
    }

    public Character getPower() {
        return power;
    }

    public void setPower(Character power) {
        this.power = power;
    }

    private User user;
    private Type type;
    private Category category;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "resourceId=" + resourceId +
                ", resourceName='" + resourceName + '\'' +
                ", resourceDesc='" + resourceDesc + '\'' +
                ", resourcePicture='" + resourcePicture + '\'' +
                ", resourcePath='" + resourcePath + '\'' +
                ", resourcePwd='" + resourcePwd + '\'' +
                ", resourceCount=" + resourceCount +
                ", resourceCtime=" + resourceCtime +
                ", resourceUtime=" + resourceUtime +
                ", power=" + power +
                ", user=" + user +
                ", type=" + type +
                ", category=" + category +
                '}';
    }
}