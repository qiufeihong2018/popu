<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: Exler
Date: 2018/6/5
Time: 21:20
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>波普后台文章管理</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/layui/layui.css"
          rel="stylesheet">
    <!--上传图片的css样式-->
    <link
            href="${pageContext.request.contextPath}/css/plugins/dropzone/basic.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/css/plugins/dropzone/dropzone.css"
            rel="stylesheet">

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/js/bootstrap-3.3.7.min.js"></script>

    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js"></script>
    <!-- layui -->
    <script src="${pageContext.request.contextPath}/layui/layui.js"
            charset="utf-8"></script>

    <!-- DROPZONE -->
    <script
            src="${pageContext.request.contextPath}/js/plugins/dropzone/dropzone.js"></script>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>显示：</h5>
                        <a href="${pageContext.request.contextPath}/article/list"
                           class="file-control active">全部</a> <a
                            href="${pageContext.request.contextPath}/article/list?type=1"
                            class="file-control">最近活动</a> <a
                            href="${pageContext.request.contextPath}/article/list?type=2"
                            class="file-control">项目(研究成果)</a> <a
                            href="${pageContext.request.contextPath}/article/list?type=3"
                            class="file-control">业内动态</a> <a
                            href="${pageContext.request.contextPath}/article/list?type=4"
                            class="file-control">内部通知</a> <a
                            href="${pageContext.request.contextPath}/admin/setIntroduction">简介修改</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-xs-12">
                    <c:forEach items="${pageBean.rows}" var="article">
                        <div class="file-box">
                            <div class="file">
                                <a
                                        href="${pageContext.request.contextPath}/article/show?articleId=${article.id}"
                                        target="view_window"> <span class="corner"></span>
                                    <div class="file-name" style="height: 200px">
                                            ${article.title} <br/>
                                        <div>
                                            <h4>${article.flag == 1 ? "可以评论":"禁止评论" }</h4>
                                        </div>
                                        <br/>
                                        <div style="margin-top: 80px;">
                                            <a
                                                    href="${pageContext.request.contextPath}/article/updateShow?articleId=${article.id}">编辑</a>&nbsp;|
                                            <a onclick="del(${article.id})">删除</a>&nbsp;|
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!--分页-->
        <div class="row">
            <div class="col-md-1"></div>

            <div class="col-md-10 col-xs-12 text-center">

                <nav aria-label="navigation">
                    <ul class="pagination ">
                        <li><a href="javascript:void(0);" onclick="page(1)"
                               aria-label="Previous"> <span aria-hidden="true">上一页</span>
                        </a></li>
                        <li>
                            <a style="background-color: #f3f3f4;border-bottom-color: #f3f3f4;border-top-color: #f3f3f4;">&nbsp;&nbsp;&nbsp;</a>
                        </li>
                        <li><a href="javascript:void(0);" onclick="page(2)"
                               aria-label="Next"> <span aria-hidden="true">下一页</span>
                        </a></li>
                    </ul>
                </nav>
            </div>

            <div class="col-md-1"></div>

        </div>

        <script type="text/javascript">
            var currentPage = ${pageBean.currentPage};

            function page(a) {
                var currentPage = ${pageBean.currentPage};
                var totalPage = Math.ceil(${pageBean.total / pageBean.pageSize})
                if (a == 1) {
                    if (currentPage > 1) {
                        window.location.href = "${pageContext.request.contextPath}/article/list?currentPage=${pageBean.currentPage - 1}&type=${pageBean.type != null ? pageBean.type[0]: null}";
                    }
                } else {
                    if (currentPage < totalPage) {
                        window.location.href = "${pageContext.request.contextPath}/article/list?currentPage=${pageBean.currentPage + 1}&type=${pageBean.type != null ? pageBean.type[0]: null}";
                    }
                }

            }

            $(document).ready(function () {
                $('.file-box').each(function () {
                    animationHover(this, 'pulse');
                });
            });

            function del(id) {
                /*     alert("是否删除");
                 */
                //询问框
                parent.layer.confirm('确定要删除吗', {
                        btn: ['确定', '取消'], //按钮
                        shade: false //不显示遮罩
                    }
                );
                $.post("${pageContext.request.contextPath}/article/delete",
                    {
                        articleId: id,
                    },
                    function (data) {
                        if (data["message"] == "true") {
                            window.location.href = "${pageContext.request.contextPath}/article/list?currentPage=" + currentPage;
                        }
                        else {
                            parent.layer.alert("此文章被引用，无法删除");
                        }
                    })
            }
        </script>

        <script type="text/javascript"
                src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
        <!--统计代码，可删除-->
    </div>
</div>
</body>
</html>