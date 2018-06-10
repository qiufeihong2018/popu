package com.bopu.controller;

import com.bopu.pojo.BoPuResult;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
public class ImageController {

    @RequestMapping("/upload")
    @ResponseBody
    public BoPuResult fileUpload2(@RequestParam("file") MultipartFile file, HttpServletResponse response, HttpServletRequest request) throws IOException {
        //String file1 = request.getParameter("file");


        String rootPath =request.getSession().getServletContext().getRealPath("/");
        String name = "uploadImg/"+new Date().getTime()+file.getOriginalFilename();

        File newFile=new File(rootPath+name);
        //不存在目录就创建
        if(!newFile.getParentFile().exists()) {
            newFile.getParentFile().mkdirs();
        }
        //保存
        file.transferTo(newFile);
        //返回的json数据
        return BoPuResult.build(200,"/"+name);
    }
    /**
     * 删除文件夹中的图片
     */
}
