package com.cyber.common.util;

import java.util.List;

/**
 * 分页类
 *
 * @param <T>
 */
public class PageUtils<T> {

    // 当前页
    private int currPage;
    // 每页行数
    private int pageSize;
    // 所有行数
    private int totalCount;
    // 所有页数
    private int totalPage;
    // 当前分页的数据
    private List<T> pageList;

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return 8;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getPageList() {
        return pageList;
    }

    public void setPageList(List<T> pageList) {
        this.pageList = pageList;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currPage=" + currPage +
                ", pageSize=" + pageSize +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", pageList=" + pageList +
                '}';
    }

}
