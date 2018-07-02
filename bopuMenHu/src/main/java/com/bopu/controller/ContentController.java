package com.bopu.controller;

import com.alibaba.fastjson.parser.deserializer.StringFieldDeserializer;
import com.bopu.pojo.BoPuResult;
import com.bopu.pojo.Content;
import com.bopu.service.ContentService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
     * 获取首页 信息 轮播图 以及 图片文章的详情信息 (访问路径命名不合理)
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
     * 图片 文章(首页的图片文章)管理
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "content/managerPA")
    public String getPicAndArt(Model model) {
        List<Content> contents = contentService.getInformation();
        model.addAttribute("contents", contents);
        return "admin/pictureManage";
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
    @RequestMapping(value = "content/uploadPic")
    public String uploadPic(@RequestParam("file[]") MultipartFile file[], Integer sort, HttpServletRequest request) throws IOException {
        // 检查 sort是否存在 如:sort = 4,那么第四张图片是否存在 不存在就要添加一条记录
        String name = contentService.findPicSort(sort);
        String path = request.getSession().getServletContext().getRealPath("/file/picture/");
        File f = new File(path, name);
        if (!f.getParentFile().exists()) {
            f.getParentFile().mkdirs();
        }
        // I:\javaweb\bopu\bopuMenHu\target\bopuMenHu-1.0-SNAPSHOT\picture\0eb4318799ca47e49d8414a4c904e566.jpg
        file[0].transferTo(f);
        return "redirect:managerPA";
    }

    /**
     * 删除三张固定轮播图之后的图
     *
     * @param sort 轮播图片的序号
     */
    @RequestMapping(value = "content/delPic")
    public String delPic(Integer sort, HttpServletRequest request) {
        Content content = contentService.deletePic(sort);
        // 删除图片
        File file = new File(request.getSession().getServletContext().getRealPath(content.getPic()));
        if (file.exists()) {
            // 删除图片
            file.delete();
        }
        return "redirect:managerPA";
    }

    /**
     * 更新轮播图，只需要替换文件
     *
     * @param file
     * @param sort
     */
    @RequestMapping(value = "content/updatePic")
    public String updataPic(@RequestParam("file[]") MultipartFile file[], Integer sort, Integer category, HttpServletRequest request) {
        // 获取原图片名称
        String name = contentService.getPic(sort, category);
        File f = new File(request.getSession().getServletContext().getRealPath(name));
        if (!f.getParentFile().exists()) {
            f.getParentFile().mkdirs();
        }
        // 直接替换文件
        try {
            file[0].transferTo(f);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "admin/home";
    }
    // ----------------------------------------------------------------------------------
    /**
     * 添加首页文章
     *
     * @param file      图片
     * @param articleId 文章id
     * @param sort      序号 1 2 3
     */
    @RequestMapping(value = "content/addArticle")
    public String addArt(MultipartFile file[], Integer articleId, Integer sort, HttpServletRequest request) throws IOException {
        // 图片文章 更新序号的 图片和文章id
        String path = request.getSession().getServletContext().getRealPath("/file/art/");
        // 上传图片命名
        File f = new File(path, "art" + sort + ".jpg");
        if (!f.getParentFile().exists()) {
            f.getParentFile().mkdirs();
        }
        // 保存图片
        file[0].transferTo(f);
        // 数据库操作
        contentService.addArt(articleId, sort, "/file/art/" + file[0].getOriginalFilename());
        // 结束
        return "admin/home";
    }

    /**
     * 根据序号删除首页文章
     *
     * @param sort 序号
     */
    @Deprecated
    @RequestMapping(value = "content/delArticle")
    public String delArt(Integer sort, HttpServletRequest request) {
        contentService.deleteArt(sort);
        // 删除文章图片
        File file = new File(request.getSession().getServletContext().getRealPath("/file/art/art" + sort + ".jpg"));
        if (file.exists()) {
            // 删除图片
            file.delete();
        }
        return "admin/home";
    }

    /**
     * 修改置顶文章
     *
     * @param file
     * @param articleId
     * @param sort
     */
    @RequestMapping(value = "content/updateArticle")
    public String updateArt(MultipartFile file[], Integer articleId, Integer sort, HttpServletRequest request) throws IOException {
        if (file != null) {
            String path = request.getSession().getServletContext().getRealPath("/file/art/");
            File f = new File(path, "art" + sort + ".jpg");
            if (!f.getParentFile().exists()) {
                f.getParentFile().mkdirs();
            }
            file[0].transferTo(f);
            // 数据库操作
            contentService.updateArt(articleId, sort, "/file/art/" + file[0].getOriginalFilename());
            // 结束
        } else {
            contentService.updateArt(articleId, sort, null);
        }
        return "admin/home";
    }

    /**
     * 设置关于我们
     */
    @RequestMapping(value = "setabout")
    @ResponseBody
    public BoPuResult setabout(String email, String phone) {
        contentService.setabout("邮箱", email);
        contentService.setabout("电话", phone);
        BoPuResult boPuResut = new BoPuResult(200, "");
        return boPuResut;
    }

    /**
     * 设置简介 (简介有很多分段 该如何处理 利用序号？ 简介还有图片 利用序号？ 那么样式就不可改了)
     *
     * @param sort    序号
     * @param file    图片
     * @param request
     * @param content 内容
     * @return
     */
    @RequestMapping(value = "setIntroduction")
    public BoPuResult setIntroduction(Integer sort, MultipartFile file[], HttpServletRequest request, String content) {
        return BoPuResult.build(200, "");
    }
}
