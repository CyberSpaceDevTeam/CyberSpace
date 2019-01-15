package com.cyber.mapper;

import com.cyber.pojo.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.MySqlMapper;

public interface UserMapper extends MySqlMapper<UserMapper> {
    User selectUserByName(@Param("userName") String userName);

    User selectUserByEmail(@Param("email") String email);

    User selectUserByNameAndPwd(@Param("userName") String userName, @Param("userPwd") String userPwd);

    User selectUserByEmailAndPwd(@Param("email") String email, @Param("userPwd") String userPwd);


    void insertUser(User user);
}
