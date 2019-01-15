package com.cyber.service;

import com.cyber.mapper.UserInfoMapper;
import com.cyber.pojo.User;
import com.cyber.pojo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService {


    @Autowired
    private UserInfoMapper userInfoMapper;

    public UserInfo selectUserInfoById(Integer userId) {

        return userInfoMapper.selectUserInfoById(userId);
    }

    public User selectUserById(Integer userId) {
        return userInfoMapper.selectUserById(userId);
    }
}
