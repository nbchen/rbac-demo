package com.nbchen.pojo;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Create by nbchen
 * 2019-07-11 10:23
 */
public class Users {
    private String username;
    private String userpwd;

    private Roles roles;

    private List<Menu> menus = new ArrayList<>();

    private List<Funs> funs = new ArrayList<>();

    public List<Funs> getFuns() {
        return funs;
    }

    public void setFuns(List<Funs> funs) {
        this.funs = funs;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }
}
