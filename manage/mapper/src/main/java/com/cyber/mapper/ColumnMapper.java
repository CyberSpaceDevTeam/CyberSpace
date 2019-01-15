package com.cyber.mapper;

import com.cyber.pojo.Column;

import java.util.List;

public interface ColumnMapper {

    List<Column> columnList();

    Column columnArticle(Integer columnId);

}
