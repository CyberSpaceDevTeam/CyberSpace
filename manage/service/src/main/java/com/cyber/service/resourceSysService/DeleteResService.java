package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeleteResService {
    @Autowired
    private ResourceMapper resourceMapper;

    public void deleteResource(Integer id) {
        resourceMapper.deleteResource(id);
    }
}
