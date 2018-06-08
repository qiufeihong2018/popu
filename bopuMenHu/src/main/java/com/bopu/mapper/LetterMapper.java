package com.bopu.mapper;

import com.bopu.pojo.Letter;
import com.bopu.pojo.LetterExample;
import java.util.List;

import com.bopu.pojo.LetterVo;
import org.apache.ibatis.annotations.Param;

public interface LetterMapper {
    int countByExample(LetterExample example);

    int deleteByExample(LetterExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Letter record);

    int insertSelective(Letter record);

    List<Letter> selectByExampleWithBLOBs(LetterExample example);

    List<Letter> selectByExample(LetterExample example);

    Letter selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Letter record, @Param("example") LetterExample example);

    int updateByExampleWithBLOBs(@Param("record") Letter record, @Param("example") LetterExample example);

    int updateByExample(@Param("record") Letter record, @Param("example") LetterExample example);

    int updateByPrimaryKeySelective(Letter record);

    int updateByPrimaryKeyWithBLOBs(Letter record);

    int updateByPrimaryKey(Letter record);

    List<Letter> selectListByReceiverAndSender(@Param("receiver") String receiver, @Param("sender") String sender,@Param("startRow") Integer startRow);

    List<LetterVo> selectDistinctserNameByReceiver(String receiver);
}