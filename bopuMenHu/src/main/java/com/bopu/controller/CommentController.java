package com.bopu.controller;

import com.bopu.pojo.BoPuResult;
import com.bopu.pojo.Comment;
import com.bopu.pojo.CommentVo;
import com.bopu.service.CommentService;
import com.bopu.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
        commentService.saveComment(comment);
        // 返回 评论的json
        return BoPuResult.build(200, "");
    }

    /**
     * 查看文章评论列表
     *
     * @param id 文章id
     * @return
     */
    @RequestMapping(value = "comment/list")
    @ResponseBody
    public BoPuResult list(Integer id, Integer currentPage) {
        if (id != null) {
            PageBean pb = new PageBean();
            pb.setCurrentPage(null == currentPage ? 1 : currentPage);
            pb.setPageSize(5);

            // 根据文章id查找评论 返回List<Comment> 转换为json 发送给前端
            List<Comment> comments = commentService.findListByArticleId(id, pb);
            List<CommentVo> list = commentService.findUsers(comments);
            BoPuResult boPuResult = new BoPuResult(200, "success");
            boPuResult.setObj(list);
            return boPuResult;
        }
        return null;
    }

    /**
     * 删除评论 根据id删除评论
     *
     * @param id 评论id
     * @return
     */
    @RequestMapping(value = "comment/del")
    @ResponseBody
    public BoPuResult delComment(Integer id) {
        try {
            commentService.deleteById(id);
            return BoPuResult.build(200, "success");
        } catch (Exception e) {
            return BoPuResult.build(200, "error");
        }
    }



    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }
}
