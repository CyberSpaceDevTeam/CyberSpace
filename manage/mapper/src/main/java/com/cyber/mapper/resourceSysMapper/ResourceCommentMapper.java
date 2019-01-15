package com.cyber.mapper.resourceSysMapper;


import com.cyber.pojo.resourceSysPojo.ResourceComment;

import java.util.List;

public interface ResourceCommentMapper {


    List<ResourceComment> selectList(Integer resourceId);

    Integer insertResourceComment(ResourceComment resourceComment);

    ResourceComment selectResourceComment();
}
