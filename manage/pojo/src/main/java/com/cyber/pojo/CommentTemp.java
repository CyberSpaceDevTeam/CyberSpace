package com.cyber.pojo;

import java.util.Date;

public class CommentTemp {

    private String userName;
    private Date articleReviewCtime;
    private String articleReview;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getArticleReviewCtime() {
        return articleReviewCtime;
    }

    public void setArticleReviewCtime(Date articleReviewCtime) {
        this.articleReviewCtime = articleReviewCtime;
    }

    public String getArticleReview() {
        return articleReview;
    }

    public void setArticleReview(String articleReview) {
        this.articleReview = articleReview;
    }

}
