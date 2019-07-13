package com.nbchen.service.impl;

import com.nbchen.exception.UsersException;
import com.nbchen.mapper.UserMapper;
import com.nbchen.pojo.Users;
import com.nbchen.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * Create by nbchen
 * 2019-07-11 11:30
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Users userLogin(String username, String password) {
        Users users = userMapper.selectUserByname(username);
        if (Objects.isNull(users)) {
            // 用户不存在
            throw new UsersException("用户不存在或密码有误");
        } else if (!users.getUserpwd().equals(password)) {
            // 密码有误
            throw new UsersException("用户不存在或密码有误");
        }
        return users;
    }
}
