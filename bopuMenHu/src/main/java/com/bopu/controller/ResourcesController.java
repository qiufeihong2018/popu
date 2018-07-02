package com.bopu.controller;

import com.bopu.pojo.BoPuResult;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Properties;

/**
 * 静态资源修改Controller
 */
@Controller
public class ResourcesController {


    @RequestMapping("/admin/email")
    @ResponseBody
    public BoPuResult emailUpdate(HttpServletRequest  request, String MY_EMAIL_ACCOUNT, String My_Email_SMTP_Host, String MY_EMAIL_PASSWORD){
        //获得资源文件
        String path = "/WEB-INF/classes/properties/resource.properties";
        String realPath = request.getSession().getServletContext().getRealPath(path);
        File file = new File(realPath);
        System.out.println(file.getAbsolutePath());
        Properties prop = new Properties();
        //获得流
        OutputStream outputFile = null;
        try {
            outputFile = new FileOutputStream(file);
            //设值-保存
            prop.setProperty("MY_EMAIL_ACCOUNT", MY_EMAIL_ACCOUNT);
            prop.setProperty("My_Email_SMTP_Host", My_Email_SMTP_Host);
            prop.setProperty("MY_EMAIL_PASSWORD", MY_EMAIL_PASSWORD);
            prop.store(outputFile, null);
        } catch (IOException e) {
            e.printStackTrace();
            return BoPuResult.build(400, "修改失败");
        }
        //关闭流
        finally{
            try {
                if(null!=outputFile){
                    outputFile.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
                return BoPuResult.build(400, "流关闭失败");
            }
        }

        return BoPuResult.ok();

    }

    @Test
    public void Test1(){
        //获得资源文件
        String path = "D:/IdeaWorkSpace/github/bopu/bopuMenHu/target/classes/properties/resource.properties";
        File file = new File(path);
        System.out.println(file.getAbsolutePath());
        Properties prop = new Properties();
        //获得流
        InputStream inputFile = null;
        OutputStream outputFile = null;
        try {
           /* inputFile = new FileInputStream(file);
            prop.load(inputFile);
            // inputFile.close();//一定要在修改值之前关闭inputFile
            inputFile.close();
            System.out.println(prop.getProperty("MY_EMAIL_ACCOUNT"));*/
            outputFile = new FileOutputStream(file);
            //设值-保存
            prop.setProperty("1223", "123");
            prop.setProperty("12", "123");
            prop.setProperty("33", "123");
            prop.setProperty("123", "123");
            prop.setProperty("2", "2");
            prop.setProperty("3", "3");
            prop.store(outputFile, null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //关闭流
        finally{
            try {
                if(null!=outputFile){
                    outputFile.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 获取邮箱账号信息，跳转页面
     */
    @RequestMapping("/admin/emailChange")
    public String showEmailPage(Model model,HttpServletRequest request){
        //获得资源文件
        try {
            String path = "/WEB-INF/classes/properties/resource.properties";
            String realPath = request.getSession().getServletContext().getRealPath(path);
            File file = new File(realPath);
            Properties prop = new Properties();
            //获得流
            InputStream inputFile = null;
            inputFile = new FileInputStream(file);
            prop.load(inputFile);
            //一定要在修改值之前关闭inputFile
            inputFile.close();
            String MY_EMAIL_ACCOUNT = prop.getProperty("MY_EMAIL_ACCOUNT");
            String MY_EMAIL_PASSWORD = prop.getProperty("MY_EMAIL_PASSWORD");
            String My_Email_SMTP_Host = prop.getProperty("My_Email_SMTP_Host");
            model.addAttribute("MY_EMAIL_ACCOUNT", MY_EMAIL_ACCOUNT);
            model.addAttribute("MY_EMAIL_PASSWORD", MY_EMAIL_PASSWORD);
            model.addAttribute("My_Email_SMTP_Host", My_Email_SMTP_Host);
            return "admin/emailManager";
        } catch (IOException e) {
            e.printStackTrace();
            return "500";
        }
    }
}
