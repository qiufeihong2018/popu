package com.bopu.controller;

import com.bopu.mapper.UserMapper;
import com.bopu.pojo.BoPuResult;
import com.bopu.pojo.User;
import com.bopu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 用户管理
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 保存用户
     * @param user
     * @return
     */
    @RequestMapping("user/save")
    public String saveUser(User user,Model model){
        try {
            userService.saveUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message",e.getMessage());
            return "register";
        }
        return "login";
    }


    @RequestMapping("user/login")
    public String loginUser(String username,String password,HttpSession session,Model model){
        User user = userService.userLogin(username, password);
        if(user!=null){
            session.setAttribute("user", user);
        }else {
            model.addAttribute("username",username);
            model.addAttribute("fail","用户名或密码错误");
            return "login";
        }
        return "index";
    }

    @RequestMapping("user/checkName")
    @ResponseBody
    public BoPuResult checkName(String name){
        User user = userService.selectUserByName(name);
        if(user!=null){
            return BoPuResult.build(200, "用户名已存在");
        }else {
            return BoPuResult.ok();
        }
    }



}
