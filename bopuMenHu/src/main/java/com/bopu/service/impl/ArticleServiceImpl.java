package com.bopu.service.impl;

import com.bopu.mapper.ArticleMapper;
import com.bopu.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

}
