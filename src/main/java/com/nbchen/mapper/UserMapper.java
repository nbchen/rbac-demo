package com.nbchen.mapper;

import com.nbchen.pojo.Users;
import org.apache.ibatis.annotations.Param;

/**
 * Create by nbchen
 * 2019-07-11 10:35
 */
public interface UserMapper {

    Users selectUserByname(@Param("username") String username);
}
