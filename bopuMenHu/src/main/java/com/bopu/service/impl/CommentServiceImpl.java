package com.bopu.service.impl;

import com.bopu.mapper.CommentMapper;
import com.bopu.pojo.Comment;
import com.bopu.pojo.CommentExample;
import com.bopu.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author Exler
 * @create 2018/6/9
 * @time 15:24
 * @describe: flag = 1,评论存在 flag = 2 评论被删除
 **/
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;


    /**
     * 保存评论
     *
     * @param comment
     */
    public void saveComment(Comment comment) {
        comment.setTime(new Date());
        comment.setFlag(1);
        System.out.println(comment);
        commentMapper.insert(comment);
    }

    public List<Comment> findListByArticleId(Integer id) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andArticleidEqualTo(id);
        List<Comment> comments = commentMapper.selectByExampleWithBLOBs(example);
        return comments;
    }

    public CommentMapper getCommentMapper() {
        return commentMapper;
    }

    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }
}