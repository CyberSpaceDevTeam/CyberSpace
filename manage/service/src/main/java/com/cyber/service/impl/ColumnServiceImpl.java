package com.cyber.service.impl;

import com.cyber.mapper.ColumnMapper;
import com.cyber.pojo.Column;
import com.cyber.service.ColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColumnServiceImpl implements ColumnService {

    @Autowired
    private ColumnMapper columnMapper;

    @Override
    public List<Column> columnList() {
        List<Column> columnList = columnMapper.columnList();
        return columnList;
    }

    @Override
    public Column columnArticle(Integer columnId) {
        Column columnArticle = columnMapper.columnArticle(columnId);
        return columnArticle;
    }

}
