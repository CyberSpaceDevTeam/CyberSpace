package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceListMapper;
import com.cyber.pojo.resourceSysPojo.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InterationService {
    @Autowired
    private ResourceListMapper resourceListMapper;


    public void saveResourceToList(Integer id, Integer resourcelistId) {
        resourceListMapper.saveResourceToList(id, resourcelistId);
    }

    public void deleteResourceToList(Integer id, Integer resourcelistId) {
        resourceListMapper.deleteResourceToList(id, resourcelistId);
    }

    public List<Resource> findNotResource(Integer resourcelistId) {
        return resourceListMapper.findNotResource(resourcelistId);
    }
}
