package com.bopu.service;

import com.bopu.pojo.User;

public interface UserService {

    /**
     * 保存用户
     * @param user 用户
     */
    public void saveUser(User user)throws Exception;

    /**
     * 根据用户名密码查询用户
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public User userLogin(String username,String password);

    /**
     * 根据名字查询用户
     * @param name
     * @return
     */
    public User selectUserByName(String name);
}
