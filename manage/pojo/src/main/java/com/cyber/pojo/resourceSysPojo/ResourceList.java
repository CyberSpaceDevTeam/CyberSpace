package com.cyber.pojo.resourceSysPojo;

import com.cyber.pojo.User;

import java.util.Date;

public class ResourceList {


    private Integer resourcelistId;
    private String resourcelistName;
    private String resourcelistDesc;
    private String resourcelistPicture;
    private Date resourcelistCtime;
    private Date resourcelistUtime;
    private Integer resourcelistCount;

    private User user;


    public Date getResourcelistCtime() {
        return resourcelistCtime;
    }

    public void setResourcelistCtime(Date resourcelistCtime) {
        this.resourcelistCtime = resourcelistCtime;
    }

    public Date getResourcelistUtime() {
        return resourcelistUtime;
    }

    public void setResourcelistUtime(Date resourcelistUtime) {
        this.resourcelistUtime = resourcelistUtime;
    }

    public Integer getResourcelistId() {
        return resourcelistId;
    }

    public void setResourcelistId(Integer resourcelistId) {
        this.resourcelistId = resourcelistId;
    }

    public String getResourcelistName() {
        return resourcelistName;
    }

    public void setResourcelistName(String resourcelistName) {
        this.resourcelistName = resourcelistName;
    }

    public String getResourcelistDesc() {
        return resourcelistDesc;
    }

    public void setResourcelistDesc(String resourcelistDesc) {
        this.resourcelistDesc = resourcelistDesc;
    }

    public String getResourcelistPicture() {
        return resourcelistPicture;
    }

    public void setResourcelistPicture(String resourcelistPicture) {
        this.resourcelistPicture = resourcelistPicture;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getResourcelistCount() {
        return resourcelistCount;
    }

    public void setResourcelistCount(Integer resourcelistCount) {
        this.resourcelistCount = resourcelistCount;
    }

    @Override
    public String toString() {
        return "ResourceList{" +
                "resourcelistId=" + resourcelistId +
                ", resourcelistName='" + resourcelistName + '\'' +
                ", resourcelistDesc='" + resourcelistDesc + '\'' +
                ", resourcelistPicture='" + resourcelistPicture + '\'' +
                ", resourcelistCtime=" + resourcelistCtime +
                ", resourcelistUtime=" + resourcelistUtime +
                ", resourcelistCount=" + resourcelistCount +
                ", user=" + user +
                '}';
    }

}
