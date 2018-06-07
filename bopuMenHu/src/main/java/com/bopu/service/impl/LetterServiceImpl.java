package com.bopu.service.impl;

import com.bopu.mapper.LetterMapper;
import com.bopu.pojo.Letter;
import com.bopu.pojo.LetterExample;
import com.bopu.service.LetterService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LetterServiceImpl implements LetterService {

    @Autowired
    private LetterMapper letterMapper;


    public void readLettersByReceiverAndSender(String receiver, String sender) {
        //创建未读消息example
        LetterExample example = new LetterExample();
        LetterExample.Criteria criteria = example.createCriteria();
        criteria.andReceiverEqualTo(receiver);
        criteria.andSenderEqualTo(sender);
        criteria.andReadedEqualTo(false);
        //创建修改条件
        Letter letter = new Letter();
        letter.setReaded(true);
        //修改
        letterMapper.updateByExampleSelective(letter, example);
    }

    public List<Letter> getLettersByReceiverAndSender(String receiver, String sender, Integer startRow) {
        List<Letter> list = letterMapper.selectListByReceiverAndSender(receiver, sender, startRow);
        return list;
    }

    public List<String> selectDistinctserNameByReceiver(String receiver) {
        return letterMapper.selectDistinctserNameByReceiver(receiver);
    }
}
