package com.cyber.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.List;

@Table(name = "tb_column")
public class Column {

    /**
     * 唯一主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer columnId;
    private User user;
    private Integer clickCount;
    private String columnName;
    private String columnDesc;
    private Date columnCtime;
    private Date columnUtime;
    private String columnPicture;
    private Integer columnArticleCount;

    private List<Article> articleList;

    public List<Article> getArticleList() {
        return articleList;
    }

    public void setArticleList(List<Article> articleList) {
        this.articleList = articleList;
    }

    public Column() {
        super();
    }

    public Integer getColumnId() {
        return columnId;
    }

    public void setColumnId(Integer columnId) {
        this.columnId = columnId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnDesc() {
        return columnDesc;
    }

    public void setColumnDesc(String columnDesc) {
        this.columnDesc = columnDesc;
    }

    public Date getColumnCtime() {
        return columnCtime;
    }

    public void setColumnCtime(Date columnCtime) {
        this.columnCtime = columnCtime;
    }

    public Date getColumnUtime() {
        return columnUtime;
    }

    public void setColumnUtime(Date columnUtime) {
        this.columnUtime = columnUtime;
    }

    public String getColumnPicture() {
        return columnPicture;
    }

    public void setColumnPicture(String columnPicture) {
        this.columnPicture = columnPicture;
    }

    public Integer getColumnArticleCount() {
        return columnArticleCount;
    }

    public void setColumnArticleCount(Integer columnArticleCount) {
        this.columnArticleCount = columnArticleCount;
    }

    @Override
    public String toString() {
        return "Column [columnId=" + columnId + ", user=" + user + ", clickCount=" + clickCount + ", columnName="
                + columnName + ", columnDesc=" + columnDesc + ", columnCtime=" + columnCtime + ", columnUtime="
                + columnUtime + ", columnPicture=" + columnPicture + ", columnArticleCount=" + columnArticleCount
                + ", articleList=" + articleList + "]";
    }

}
