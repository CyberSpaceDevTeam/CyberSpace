package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceMapper;
import com.cyber.pojo.resourceSysPojo.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeAndCategoryService {

    @Autowired
    private ResourceMapper resourceMapper;

    public List<Resource> findTypeAndCategory(Integer typeId, Integer categoryId) {
        return resourceMapper.findTypeAndCategory(typeId, categoryId);
    }
}
