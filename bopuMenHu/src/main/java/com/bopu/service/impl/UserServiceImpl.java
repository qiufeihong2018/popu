package com.bopu.service.impl;

import com.bopu.mapper.UserMapper;
import com.bopu.pojo.User;
import com.bopu.pojo.UserExample;
import com.bopu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 保存用户
     * @param user 用户
     * @throws Exception
     */
    public void saveUser(User user) throws Exception{
        //查询用户
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(user.getName());
        List<User> list = userMapper.selectByExample(example);
        //判断用户名是否存在
        if(list.size()==0) {
            userMapper.insert(user);
        }else{
            //已经存在
            throw new RuntimeException("用户名已存在");
        }
    }



    public User userLogin(String account, String password) {

        return userMapper.selectUserByAccountAndPassword(account, password);

    }

    public User selectUserByAccount(String account) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(account);
        List<User> list = userMapper.selectByExample(example);
        if(list.size()==0){
            return null;
        }else{
            return list.get(0);
        }
    }

    public User selectUserByAccountAndEmail(String account, String email) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(account);
        criteria.andEmailEqualTo(email);
        List<User> list = userMapper.selectByExample(example);
        if(list.size()==0){
            return null;
        }else{
            return list.get(0);
        }
    }

    public void updataUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    public User selectUserById(Integer id){
        return userMapper.selectByPrimaryKey(id);

    }

    public List<User> selectUserLikePhone(String phone) {
        //创建example对象
        UserExample example = new UserExample();
        //创建条件
        UserExample.Criteria criteria = example.createCriteria();
        //设置条件
        criteria.andPhoneLike("%"+phone+"%");
        //查询
        List<User> list = userMapper.selectByExample(example);
        //返回
        return list;
    }

    public User selectUserByName(String name) {
        return userMapper.selectUserByName(name);
    }

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
