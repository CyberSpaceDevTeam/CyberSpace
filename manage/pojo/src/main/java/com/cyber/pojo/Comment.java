package com.cyber.pojo;

import javax.persistence.Table;
import java.util.Date;

/**
 * 评论的JavaBean
 *
 * @author Administrator
 */
@Table(name = "tb_article_review")
public class Comment {

    private Article article;
    // private String img;
    private String articleReview;
    private Date articleReviewCtime;

    private User user;

    public Comment() {
        super();
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getArticleReview() {
        return articleReview;
    }

    public void setArticleReview(String articleReview) {
        this.articleReview = articleReview;
    }

    public Date getArticleReviewCtime() {
        return articleReviewCtime;
    }

    public void setArticleReviewCtime(Date articleReviewCtime) {
        this.articleReviewCtime = articleReviewCtime;
    }

    @Override
    public String toString() {
        return "Comment [article=" + article + ", articleReview=" + articleReview + ", articleReviewCtime="
                + articleReviewCtime + ", user=" + user + "]";
    }

}
