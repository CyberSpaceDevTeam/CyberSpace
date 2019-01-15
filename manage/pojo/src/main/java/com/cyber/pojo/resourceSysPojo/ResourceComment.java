package com.cyber.pojo.resourceSysPojo;

import com.cyber.pojo.User;

import javax.persistence.Table;
import java.util.Date;

@Table(name = "tb_resource_review")
public class ResourceComment {
    private Resource resource;

    private String resourceReview;

    private User user;

    private Date resourceReviewCtime;

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public String getResourceReview() {
        return resourceReview;
    }

    public void setResourceReview(String resourceReview) {
        this.resourceReview = resourceReview;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getResourceReviewCtime() {
        return resourceReviewCtime;
    }

    public void setResourceReviewCtime(Date resourceReviewCtime) {
        this.resourceReviewCtime = resourceReviewCtime;
    }

    @Override
    public String toString() {
        return "ResourceComment{" +
                "resource=" + resource +
                ", resourceReview='" + resourceReview + '\'' +
                ", user=" + user +
                ", resourceReviewCtime=" + resourceReviewCtime +
                '}';
    }
}
