package com.bopu.mapper;

import com.bopu.pojo.Letter;

public interface LetterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Letter record);

    int insertSelective(Letter record);

    Letter selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Letter record);

    int updateByPrimaryKeyWithBLOBs(Letter record);

    int updateByPrimaryKey(Letter record);
}