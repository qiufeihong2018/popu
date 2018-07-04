<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Exler
  Date: 2018/6/5
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ArticleView</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>
</head>

<body class="gray-bg">

 <!-- 引入header.jsp -->
<jsp:include page="header.jsp" flush="true"></jsp:include>

<div class="row">


    <!--主体-->
    <div class="col-md-11 col-xs-11">

        <!--文章内容-->
        <div class="content">
            <div class="detail">
                <h1>${article.title}</h1>
                <span style="background-color: rgb(255, 255, 255); color: rgb(119, 119, 119); font-size: 16px;float: right;margin-top: 15px">${article.type==2 ? '': article.author}</span>
            </div>
            <hr>
            <div class="detail">
                <h6><c:if test="${article.type == 2}">项目成员有: ${article.author}<br>项目地址:
                    <a href="${article.look}">${article.look}</a></c:if></h6>
                <h4>
                    内容填充
                    ${article.content}
                </h4>
            </div>
            <span style="background-color: rgb(255, 255, 255); color: rgb(119, 119, 119); font-size: 16px;float: right;margin-right: 20px;margin-bottom: 15px">${article.time}</span>
            <br>
            <hr>
            <%-- 分页 内容相似文章推荐 --%>
            <div class="text-center text">

            </div>
            <hr>
            <!--附加内容-->
            <div class="text-center text">
                <c:if test="${user != null}">
                <c:choose>
                <c:when test="${article.flag == 1}">
                <form role="form">
                    <div class="form-group">

                        <textarea class="form-control" rows="3" id="content"></textarea>
                    </div>
                </form>
                <div class="text-center">
                    <h4>
                        <button class="newbtn" onclick="publish()">评论</button>
                    </h4>
                </div>
            </div>
            <hr>
            <div id="commentDiv1"  class="row">
                <h4>
                此文章暂无评论
                </h4>
            </div>
            <div id="allComment" style="display: none">
            <div>
                <h2 style="margin-left: 20px;margin-bottom: 20px;">评论：</h2>
            </div>
            <div   class="row">

                <div id="commentDiv" class="col-lg-12">


                </div>
                </c:when>
                <c:otherwise>
                    <h4>此文章无评论权限</h4>
                    <hr>
                </c:otherwise>
                </c:choose>
                </c:if>
            </div>
            </div>
        </div>
    </div>


</div>

</body>

</html>
<style>
    /*中间部分*/
    .row {
        display: flex;
        /*使子项目水平居中*/
        justify-content: center;
    }

    /*背景色*/

    .gray-bg,
    .btn-link {
        background-color: #f3f3f4;
    }

    /*左右固定*/

    html,
    body {
        overflow-x: hidden;
    }

  

    .img-top {
        width: 100%;
        height: 60px;
    }

    .img-top img {
        width: 100%;
        height: 100%;
    }

    .content {
        background-color: #FFFFFF;
        margin-bottom: 30px;

    }

    .detail {
        padding: 10px 40px 30px 40px;
    }

    .text {
        padding: 10px 20px 10px 20px;
    }

    .newbtn {
        padding: 10px;
        color: #FFFFFF;
        background-color: orangered;
        border-radius: 10px;
        border: none;
    }

    /*评论*/
    /* Social feed */

    .social-feed-separated .social-feed-box {
        margin-left: 62px;
    }

    .social-feed-separated .social-avatar {
        float: left;
        padding: 0;
    }

    .social-feed-separated .social-avatar img {
        width: 52px;
        height: 52px;
        border: 1px solid #e7eaec;
    }

    .social-feed-separated .social-feed-box .social-avatar {
        padding: 15px 15px 0 15px;
        float: none;
    }

    .social-feed-box {
        /*padding: 15px;*/
        border: 1px solid #e7eaec;
        background: #fff;
        margin-bottom: 15px;
        margin-left: 4%;
        margin-right: 4%;
        position: relative;
    }

    .article .social-feed-box {
        margin-bottom: 0;
        border-bottom: none;
    }
    .text-muted{
        position: absolute;
        width: 40px;
        height: 30px;
        right: 0%;
        top: 35px;
    }

    .article .social-feed-box:last-child {
        margin-bottom: 0;
        border-bottom: 1px solid #e7eaec;
    }

    .article .social-feed-box p {
        font-size: 13px;
        line-height: 18px;
    }

    .social-avatar {
        padding: 15px 15px 0 15px;
    }

    .social-comment .social-comment {
        margin-left: 45px;
    }

    .social-avatar img {
        height: 40px;
        width: 40px;
        margin-right: 10px;
        border-radius: 100%;
    }

    .social-avatar .media-body a {
        font-size: 14px;
        display: block;
    }

    .social-feed-separated .social-avatar {
        float: left;
        padding: 0;
    }

    .social-feed-separated .social-avatar img {
        width: 52px;
        height: 52px;
        border: 1px solid #e7eaec;
    }

    .social-feed-separated .social-feed-box .social-avatar {
        padding: 15px 15px 0 15px;
        float: none;
    }

    img {
        width: 100%;
    }
</style>
<script type="text/javascript">

    var page = 1;
    var flag = false;
    var userId = 0;


    $(document).ready(

        loadComment()
    )

    //滚动滚动条加载评论事件
    $(window).scroll(function () {
        if ($(document).scrollTop() + $(window).height() >= $(document).height()-200) {
            if(flag){flag=false;
                //alert("123");
                loadComment();
            }
        }
    });
    function loadComment() {
        if(page!=0){
        $.post("${pageContext.request.contextPath}/comment/list", {
            id:"${article.id}",
            currentPage: page
        }, function (data) {
            if(data["obj"].length==0){
                $("#commentDiv1").show();
            }else{
                $("#allComment").show();
            }
            var text='';
            $.each(data["obj"], function (index, val) {
                var msg = "";
                if(userId!=0&&userId==val["user"]["id"]){
                    msg='<a href="${pageContext.request.contextPath}/comment/del?id='+val["comment"]["id"]+'&articleId=${article.id}">删除</a>';
                }

                // 每次5条
                text += '<div class="social-feed-box">' +
                    '                        <div class="social-avatar">' +
                    '                            <a href="" class="pull-left">' +
                    '                                <img alt="image" src="'+val["user"]["pic"]+'">' +
                    '                            </a>' +
                    '                            <div class="media-body">' +
                    '                                    '+val["user"]["name"]+'' +
                    '                                <small class="text-muted">' +
                        msg+
                    '</small>' +
                    '                            </div>' +
                    '                        </div>' +
                    '                        <div class="social-body">' +
                    '                            <p>' +
                    '                                '+val["comment"]["content"]+'' +
                    '                            </p>' +
                    '                        </div>' +
                    '                    </div>';
            });
            $("#commentDiv").append(text);
            page+=1;
            flag=true;
            if(data.length<5)
                page=0;
        });
        }
    }


    <c:if test="${user != null}">
    userId = ${user.id};
    function publish() {
        // alert();
        var content = $("#content").val();
        $.post("${pageContext.request.contextPath}/comment/publish", {
            articleid: ${article.id},
            userid: ${user.id},
            content: content
        }, function (result) {
            if (result["status"] == 200) {
                alert("success");
            } else {
                // 提交失败
            }
        });
    }
    </c:if>
</script>