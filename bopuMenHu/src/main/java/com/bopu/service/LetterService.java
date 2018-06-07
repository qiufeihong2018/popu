package com.bopu.service;

import com.bopu.mapper.LetterMapper;
import com.bopu.pojo.Letter;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface LetterService {

    public void readLettersByReceiverAndSender(String receiver,String sender);

    public List<Letter> getLettersByReceiverAndSender(String receiver,String sender,Integer startRow);

    public List<String> selectDistinctserNameByReceiver(String receiver);
}
