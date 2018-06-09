package com.bopu.controller;

import com.bopu.pojo.BoPuResult;
import com.bopu.pojo.Comment;
import com.bopu.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Exler
 * @create 2018/6/9
 * @time 15:22
 * @describe:
 **/
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    /**
     * 发表评论
     *
     * @param comment
     * @return
     */
    @RequestMapping(value = "comment/publish")
    @ResponseBody
    public BoPuResult publish(Comment comment) {
        // 返回 评论的json
        System.out.println(comment);
        return BoPuResult.build(200, "");
    }

    /**
     * 删除评论
     *
     * @param id 评论id
     * @return
     */
    public BoPuResult delComment(Integer id) {
        return BoPuResult.build(200, "");
    }

    /**
     * 查看文章评论列表
     *
     * @param id 文章id
     * @return
     */
    public BoPuResult list(Integer id) {
        return BoPuResult.build(200, "");
    }

    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }
}
