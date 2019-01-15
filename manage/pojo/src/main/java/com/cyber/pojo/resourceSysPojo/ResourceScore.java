package com.cyber.pojo.resourceSysPojo;

public class ResourceScore {
    private Integer resourceScore;

    private Integer resourceId;

    private Integer userId;

    private Long resourceTime;

    public Integer getResourceScore() {
        return resourceScore;
    }

    public void setResourceScore(Integer resourceScore) {
        this.resourceScore = resourceScore;
    }

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Long getResourceTime() {
        return resourceTime;
    }

    public void setResourceTime(Long resourceTime) {
        this.resourceTime = resourceTime;
    }

    @Override
    public String toString() {
        return "ResourceScore{" +
                "resourceScore=" + resourceScore +
                ", resourceId=" + resourceId +
                ", userId=" + userId +
                ", resourceTime=" + resourceTime +
                '}';
    }
}
