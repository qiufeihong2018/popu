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

    public void saveUser(User user) throws Exception{
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(user.getName());
        List<User> list = userMapper.selectByExample(example);
        if(list.size()==0) {
            userMapper.insert(user);
        }else{
            throw new RuntimeException("用户名已存在");
        }
    }



    public User userLogin(String name, String password) {

        return userMapper.selectUserByNameAndPassword(name, password);

    }

    public User selectUserByName(String name) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<User> list = userMapper.selectByExample(example);
        if(list.size()==0){
            return null;
        }else{
            return list.get(0);
        }
    }

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
