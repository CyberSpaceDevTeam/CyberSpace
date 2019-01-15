package com.cyber.service.resourceSysService;

import com.cyber.mapper.resourceSysMapper.ResourceMapper;
import com.cyber.pojo.resourceSysPojo.ResourceScore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RscoreService {
    @Autowired
    private ResourceMapper resourceMapper;

    public void saveRscore(Integer score, Integer resourceId, Integer userId) {
        ResourceScore resourceScore = new ResourceScore();
        resourceScore.setUserId(userId);
        resourceScore.setResourceScore(score);
        resourceScore.setResourceTime(System.currentTimeMillis());
        resourceScore.setResourceId(resourceId);
        resourceMapper.saveRscore(resourceScore);
    }

    public ResourceScore findRscore(Integer userId, Integer resourceId) {

        return resourceMapper.findRscore(userId, resourceId);
    }
}
