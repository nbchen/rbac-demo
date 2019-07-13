package com.nbchen.web.controller;

import com.nbchen.exception.UsersException;
import com.nbchen.pojo.Funs;
import com.nbchen.pojo.Users;
import com.nbchen.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Create by nbchen
 * 2019-07-11 11:56
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping("userLogin")
    public String userLogin(Users users, Model model, HttpSession session) {

        try {
            Users user = userService.userLogin(users.getUsername(), users.getUserpwd());

            session.setAttribute("user",user);
        } catch (UsersException e) {
            // 登录失败
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
            return "login";
        }

        return "redirect:/index";
    }
}
