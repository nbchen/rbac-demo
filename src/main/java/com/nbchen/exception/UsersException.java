package com.nbchen.exception;

/**
 * 自定义用户异常
 * Create by nbchen
 * 2019-07-11 11:52
 */
public class UsersException extends RuntimeException {

    public UsersException() {
    }

    public UsersException(String message) {
        super(message);
    }

    public UsersException(String message, Throwable cause) {
        super(message, cause);
    }
}
