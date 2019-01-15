package com.cyber.service;

import com.cyber.pojo.Column;

import java.util.List;

public interface ColumnService {

    List<Column> columnList();

    Column columnArticle(Integer columnId);

}
