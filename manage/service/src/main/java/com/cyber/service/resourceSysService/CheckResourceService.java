package com.cyber.service.resourceSysService;


import com.cyber.mapper.resourceSysMapper.ResourceMapper;
import com.cyber.pojo.resourceSysPojo.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

@Service
public class CheckResourceService {

    /**
     * 需要更改到service层
     */
    @Autowired
    private ResourceMapper resourceMapper;


    public String showArtiById(Integer resourceId) {
        // 读取服务器保存的文件，需要考虑保存后直接查看与文章列表中查看
        Resource resource = resourceMapper.showResourceById(resourceId);

        StringBuilder sb = new StringBuilder();

        try (FileInputStream fis = new FileInputStream(new File(resource.getResourcePath()))) {
            int len = 0;
            byte[] buff = new byte[1024];
            while ((len = fis.read(buff)) != -1) {
                sb.append(new String(buff, 0, len));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sb.toString();
    }

    public Resource getResource(Integer resourceId) {
        Resource resource = resourceMapper.showResourceById(resourceId);
        return resource;
    }


    public List<Resource> selectTop() {
        List<Resource> topList = resourceMapper.selectTop();
        return topList;
    }

}
