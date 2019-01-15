package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceListMapper;
import com.cyber.pojo.resourceSysPojo.Resource;
import com.cyber.pojo.resourceSysPojo.ResourceList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceListService {
    @Autowired
    private ResourceListMapper resourceListMapper;

    //查询全部清单
    public List<ResourceList> findListAll() {
        return resourceListMapper.findListAll();
    }

    //点击数

    public void updatelistCount() {
        resourceListMapper.updatelistCount();
    }

    public ResourceList findListOne(Integer resourcelistId) {

        return resourceListMapper.findListOne(resourcelistId);
    }

    public List<Resource> findListResource(Integer resourcelistId) {
        return resourceListMapper.findListResource(resourcelistId);
    }

    public List<ResourceList> findListAllById(Integer id) {
        return resourceListMapper.findListAllById(id);
    }
}
