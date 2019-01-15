package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceListMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeleteResourceListService {

    @Autowired
    private ResourceListMapper resourceListMapper;

    public void deleteResourcelist(Integer id) {
        resourceListMapper.deleteResourcelist(id);
    }
}
