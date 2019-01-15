package com.cyber.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 文章信息的JavaBean
 *
 * @author li
 */
@Table(name = "tb_article")
public class Article {

    /**
     * 唯一主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer articleId;
    private String articleName;
    private String articlePath;
    private Date articleCtime;
    private Date articleUtime;
    private Category category;
    private User user;
    private String articleContent;
    private Integer clickCount;

    public Article() {
        super();
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticleName() {
        return articleName;
    }

    public void setArticleName(String articleName) {
        this.articleName = articleName;
    }

    public String getArticlePath() {
        return articlePath;
    }

    public void setArticlePath(String articlePath) {
        this.articlePath = articlePath;
    }

    public Date getArticleCtime() {
        return articleCtime;
    }

    public void setArticleCtime(Date articleCtime) {
        this.articleCtime = articleCtime;
    }

    public Date getArticleUtime() {
        return articleUtime;
    }

    public void setArticleUtime(Date articleUtime) {
        this.articleUtime = articleUtime;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    @Override
    public String toString() {
        return "Article [articleId=" + articleId + ", articleName=" + articleName + ", articlePath=" + articlePath
                + ", articleCtime=" + articleCtime + ", articleUtime=" + articleUtime + ", category=" + category
                + ", user=" + user + ", articleContent=" + articleContent + ", clickCount=" + clickCount + "]";
    }

}
