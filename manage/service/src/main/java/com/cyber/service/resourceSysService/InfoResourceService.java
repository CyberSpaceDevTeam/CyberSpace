package com.cyber.service.resourceSysService;

import com.cyber.common.util.PageUtils;
import com.cyber.mapper.resourceSysMapper.ResourceMapper;
import com.cyber.pojo.resourceSysPojo.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoResourceService {
    @Autowired
    private ResourceMapper resourceMapper;

    //查询所有
    public List<Resource> getInfoSource() {

        return resourceMapper.findResource();
    }

    //查询单个
    public Resource getInfoResOne(Integer id) {
        resourceMapper.updateCount(id);
        return resourceMapper.getInfoResOne(id);
    }

    //查询平均分
    public Float avgRscore(Integer resourceId) {
        return resourceMapper.avgRscore(resourceId);
    }

    public PageUtils<Resource> pageResource(Integer currPage, Integer id) {

        if (currPage == null || currPage <= 0) {
            currPage = 1;
        }

        PageUtils<Resource> pageUtils = new PageUtils<>();

        pageUtils.setCurrPage(currPage);

        int pageSize = pageUtils.getPageSize();
        List<Resource> resourceList = resourceMapper.pageResource((currPage - 1) * pageSize, pageSize, id);

        pageUtils.setPageList(resourceList);

        Integer resourceCount = resourceMapper.resourceCount(id);
        pageUtils.setTotalCount(resourceCount);

        Integer totalPage = resourceCount % pageSize == 0 ? resourceCount / pageSize : (resourceCount / pageSize) + 1;

        pageUtils.setTotalPage(totalPage);

        return pageUtils;
    }
}
