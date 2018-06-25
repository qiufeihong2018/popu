package com.bopu.service;

import com.bopu.pojo.Comment;
import com.bopu.pojo.CommentVo;
import com.bopu.utils.PageBean;

import java.util.List;

public interface CommentService {

    void saveComment(Comment comment);

    List<Comment> findListByArticleId(Integer id, PageBean pb);

    void deleteById(Integer id);

    List<CommentVo> findUsers(List<Comment> comments);
}
