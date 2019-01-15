package com.cyber.pojo.resourceSysPojo;

import java.util.Date;

public class ResourceCommentTemp {

    private String userName;
    private Date resourceReviewCtime;
    private String resourceReview;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getResourceReviewCtime() {
        return resourceReviewCtime;
    }

    public void setResourceReviewCtime(Date resourceReviewCtime) {
        this.resourceReviewCtime = resourceReviewCtime;
    }

    public String getResourceReview() {
        return resourceReview;
    }

    public void setResourceReview(String resourceReview) {
        this.resourceReview = resourceReview;
    }
}
