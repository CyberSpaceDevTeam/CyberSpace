package com.cyber.mapper;

import com.cyber.pojo.User;
import com.cyber.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

public interface UserInfoMapper {
    public UserInfo selectUserInfoById(@Param(value = "userId") Integer userId);

    public User selectUserById(Integer userId);
}
