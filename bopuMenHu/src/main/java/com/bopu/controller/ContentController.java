package com.bopu.controller;

import com.alibaba.fastjson.parser.deserializer.StringFieldDeserializer;
import com.bopu.pojo.BoPuResult;
import com.bopu.pojo.Content;
import com.bopu.service.ContentService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.SortedMap;

/**
 * @author Exler
 * @create 2018/6/10
 * @time 15:44
 * @describe: 主页轮播图修改 置顶文章修改
 * category_id 类别 1. 文章 2. 图片 3.
 * title 标题 1文章
 * url 文章链接
 * pic 图片路径
 **/

@Controller
public class ContentController {
    @Autowired
    private ContentService contentService;

    /**
     * 获取首页 信息
     *
     * @return
     */
    @RequestMapping(value = "content/getArticle")
    @ResponseBody
    public BoPuResult getArticle() {
        List<Content> contents = contentService.getInformation();
        BoPuResult boPuResult = new BoPuResult(200, "");
        boPuResult.setObj(contents);
        return boPuResult;
    }

    /**
     * 更新首页文章
     */
    @RequestMapping(value = "content/updateArticle")
    public void update(MultipartFile file, Integer articleId, Integer sort) {
        // 图片或文章可为空 更新序号的 图片和文章id
        // 上传图片命名
        // 保存图片
        // 数据库操作
        // 结束
    }

    /**
     * 上传图片
     *
     * @param file    图片
     * @param request 请求
     * @param sort    序号
     *                // @param category 类型图片
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "content/updatePic")
    public String setPic(@RequestParam("file[]") MultipartFile file[], Integer sort, HttpServletRequest request) throws IOException {
        // 检查 sort是否存在 如:sort = 4,那么第四张图片是否存在 不存在就要添加一条记录
        contentService.findPicSort(sort);
        String path = request.getSession().getServletContext().getRealPath("/picture/");
        File f = new File(path, "picture" + sort + ".jpg");
        if (!f.getParentFile().exists()) {
            f.getParentFile().mkdirs();
        }
        // I:\javaweb\bopu\bopuMenHu\target\bopuMenHu-1.0-SNAPSHOT\picture\picture1.jpg
        file[0].transferTo(f);
        return "admin/home";
    }

    /**
     *
     * @param sort 轮播图片的序号
     */
    @RequestMapping(value = "content/delPic")
    public void delPic(Integer sort) {
        contentService.deletePic(sort);
    }



}
