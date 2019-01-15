package com.cyber.mapper.resourceSysMapper;

import com.cyber.pojo.Category;
import com.cyber.pojo.resourceSysPojo.Resource;
import com.cyber.pojo.resourceSysPojo.ResourceScore;
import com.cyber.pojo.resourceSysPojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceMapper {
    //保存数据
    void saveResource(Resource resource);

    //查询数据
    List<Resource> findResource();

    //查询单个数据
    Resource getInfoResOne(Integer id);

    //查询类型
    List<Type> findTypeAll();

    //查询种类
    List<Category> findCategoryAll();

    //更新数据
    void updateResource(Resource resource);

    //删除数据
    void deleteResource(Integer id);

    //更新点击量
    void updateCount(Integer id);

    //查询分数
    ResourceScore findRscore(@Param(value = "userId") Integer userId, @Param(value = "resourceId") Integer resourceId);

    //保存分数
    void saveRscore(ResourceScore resourceScore);

    //查询平均分
    Float avgRscore(Integer resourceId);


    //分类查询
    List<Resource> findTypeAndCategory(@Param(value = "typeId") Integer typeId, @Param(value = "categoryId") Integer categoryId);

    List<Resource> pageResource(@Param("pageStart") Integer pageStart, @Param("pageSize") Integer pageSize, @Param("userId") Integer userId);

    Integer resourceCount(Integer id);

    Resource showResourceById(Integer resourceId);

    List<Resource> selectTop();
}
