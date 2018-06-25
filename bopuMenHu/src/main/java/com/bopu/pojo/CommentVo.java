package com.bopu.pojo;

/**
 * @author Exler
 * @create 2018/6/25
 * @time 14:50
 * @describe: 评论 及用户信息
 **/

public class CommentVo {
    private User user;
    private Comment comment;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }
}
