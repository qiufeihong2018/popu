package com.bopu.service;

import com.bopu.pojo.Comment;

import java.util.List;

public interface CommentService {

    void saveComment(Comment comment);

    List<Comment> findListByArticleId(Integer id);
}
