package com.bopu.service;

import com.bopu.pojo.User;

import java.util.List;

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
     * 根据账号查询用户
     * @param account
     * @return
     */
    public User selectUserByAccount(String account);

    /**
     * 根据用户账号和邮箱查询用户
     * @param account
     * @param email
     * @return
     */
    public User selectUserByAccountAndEmail(String account,String email);

    /**
     * 更新用户
     * @param user
     */
    public void updataUser(User user);

    /**
     * 通过主键查找用户
     * @param id
     * @return
     */
    public User selectUserById(Integer id);

    public List<User> selectUserLikePhone(String phone);
}
