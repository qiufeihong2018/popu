package com.bopu.service.impl;

import com.bopu.mapper.CommentMapper;
import com.bopu.mapper.UserMapper;
import com.bopu.pojo.Comment;
import com.bopu.pojo.CommentExample;
import com.bopu.pojo.CommentVo;
import com.bopu.pojo.User;
import com.bopu.service.CommentService;
import com.bopu.utils.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    @Autowired
    private UserMapper userMapper;

    /**
     * 保存评论
     *
     * @param comment
     */
    public void saveComment(Comment comment) {
        comment.setTime(new Date());
        comment.setFlag(1);
        commentMapper.insert(comment);
    }

    public List<Comment> findListByArticleId(Integer id, PageBean pb) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andArticleidEqualTo(id);
        // 评论存在
        criteria.andFlagEqualTo(1);
        example.setOrderByClause("id desc");
        PageHelper.startPage(pb.getCurrentPage(), pb.getPageSize());
        List<Comment> comments = commentMapper.selectByExampleWithBLOBs(example);
        PageInfo<Comment> pageComment = new PageInfo<Comment>(comments);
        return comments;
    }

    public void deleteById(Integer id) {
        commentMapper.updateFlagByPrimaryKey(id);
    }

    public List<CommentVo> findUsers(List<Comment> comments) {
        List<CommentVo> list = new ArrayList<CommentVo>();
        for (Comment c : comments) {
            CommentVo commentVo = new CommentVo();
            commentVo.setUser(userMapper.selectByPrimaryKey(c.getUserid()));
            commentVo.setComment(c);
            list.add(commentVo);
        }
        return list;
    }

    public CommentMapper getCommentMapper() {
        return commentMapper;
    }

    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }
}
