package com.nbchen.service;

import com.nbchen.pojo.Users;

/**
 * Create by nbchen
 * 2019-07-11 11:29
 */
public interface UserService {

    Users userLogin(String username, String password);
}
