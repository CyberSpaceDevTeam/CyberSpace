package com.cyber.mapper.resourceSysMapper;

import com.cyber.pojo.resourceSysPojo.Resource;
import com.cyber.pojo.resourceSysPojo.ResourceList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ResourceListMapper {
    //保存清单
    void saveResourcelist(ResourceList resourceList);

    //查询全部清单
    List<ResourceList> findListAll();

    //点击数
    void updatelistCount();

    //查单个清单
    ResourceList findListOne(Integer resourcelistId);

    //查找清单列表资源
    List<Resource> findListResource(Integer resourcelistId);

    //更新清单详情
    void updateResourceList(ResourceList resourceList);

    //删除清单
    void deleteResourcelist(Integer resourcelistId);

    //添加资源到清单
    void saveResourceToList(@Param(value = "resourceId") Integer id, @Param(value = "resourcelistId") Integer resourcelistId);

    //删除清单中的资源
    void deleteResourceToList(@Param(value = "resourceId") Integer id, @Param(value = "resourcelistId") Integer resourcelistId);

    //查询未添加的资源
    List<Resource> findNotResource(Integer resourcelistId);

    List<ResourceList> findListAllById(Integer id);
}
