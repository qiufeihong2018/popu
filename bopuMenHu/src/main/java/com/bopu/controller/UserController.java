package com.bopu.controller;

import com.alibaba.fastjson.JSONObject;
import com.bopu.mapper.UserMapper;
import com.bopu.pojo.BoPuResult;
import com.bopu.pojo.Letter;
import com.bopu.pojo.LetterVo;
import com.bopu.pojo.User;
import com.bopu.service.LetterService;
import com.bopu.service.UserService;
import com.bopu.utils.MailUtil;
import com.bopu.utils.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 用户管理
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LetterService letterService;

    @Value("${MY_EMAIL_ACCOUNT}")
    public String MY_EMAIL_ACCOUNT;
    @Value("${MY_EMAIL_PASSWORD}")
    public String MY_EMAIL_PASSWORD;
    @Value("${My_Email_SMTP_Host}")
    public String My_Email_SMTP_Host;


    /**
     * 保存用户
     *
     * @param user
     * @return
     */
    @RequestMapping("user/save")
    public String saveUser(User user, Model model) {
        try {
            user.setType(1);
            //随机分配头像
            Random random = new Random();
            int i = random.nextInt(10) + 1;
            user.setPic("/img/" + i + ".jpg");
            userService.saveUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", e.getMessage());
            model.addAttribute("user", user);
            return "register";
        }
        return "login";
    }

    /**
     * 用户登入
     *
     * @param account
     * @param password
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("user/login")
    public String loginUser(String account, String password, HttpSession session, Model model) {
        User user = userService.userLogin(account, password);
        if (user != null) {
            session.setAttribute("user", user);
        } else {
            model.addAttribute("account", account);
            model.addAttribute("fail", "用户名或密码错误");
            return "login";
        }
        return "index";
    }

    /**
     * 注册时判断用户名是否存在
     *
     * @param account
     * @return
     */
    @RequestMapping("user/checkName")
    @ResponseBody
    public BoPuResult checkName(String account) {
        //查找用户
        User user = userService.selectUserByAccount(account);
        if (user != null) {
            //有此用户放回失败
            return BoPuResult.build(500, "用户名已存在");
        } else {
            //没有此用户放回成功
            return BoPuResult.ok();
        }
    }

    /**
     * 找回密码时判断是否有此用户
     *
     * @param account
     * @return
     */
    @RequestMapping("user/checkNotName")
    @ResponseBody
    public BoPuResult checkNotName(String account) {
        User user = userService.selectUserByAccount(account);
        if (user != null) {
            //有此用户返回成功
            return BoPuResult.ok();
        } else {
            //没有此用户返回失败
            return BoPuResult.build(500, "用户名不存在");
        }
    }

    /**
     * 保存用户账号，跳转到邮箱页面
     *
     * @param account
     * @param model
     * @return
     */
    @RequestMapping("user/searchEmail")
    public String searchEmail(String account, Model model) {
        //查找用户
        User user = userService.selectUserByAccount(account);
        if (user != null) {
            //有此用户成功跳转
            model.addAttribute("account", account);
            return "searchEmail";
        } else {
            //没有此用户放回失败
            model.addAttribute("account", account);
            model.addAttribute("message", "用户名不存在");
            return "searchAccount";
        }
    }

    /**
     * 根据账号验证邮箱是否正确
     *
     * @param account
     * @param email
     * @return
     */
    @RequestMapping("user/checkEmail")
    @ResponseBody
    public BoPuResult checkEmail(String account, String email) {
        //查找用户
        User user = userService.selectUserByAccountAndEmail(account, email);
        if (user != null) {
            //有此用户放回成功
            return BoPuResult.ok();
        } else {
            //没有此用户放回失败
            return BoPuResult.build(500, "邮箱不正确");
        }
    }

    /**
     * 发送验证码
     *
     * @param account
     * @param email
     * @return
     */
    @RequestMapping("user/getCode")
    @ResponseBody
    public BoPuResult getCode(String account, String email) {
        try {
            //查询用户
            User user = userService.selectUserByAccountAndEmail(account, email);
            if (user != null) {//查找到用户
                //随机生成验证码
                String code = RandomCode.init();
                //发送验证码
                MailUtil mailUtil = new MailUtil();
                mailUtil.send(account, code, email, MY_EMAIL_ACCOUNT, MY_EMAIL_PASSWORD, My_Email_SMTP_Host);
                //设置验证码
                user.setSearchid(code);
                //设置时间
                user.setSearchtime(new Date());
                //保存用户
                userService.updataUser(user);
            } else {//没找到用户
                return BoPuResult.build(500, "邮箱不正确");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return BoPuResult.build(500, "邮箱不正确");
        }
        //返回成功
        return BoPuResult.ok();
    }

    /**
     * @param account
     * @param email
     * @param code
     * @param model
     * @return
     */
    @RequestMapping("user/searchPassword")
    public String searchPassword(String account, String email, String code, Model model) {
        //查询用户
        User user = userService.selectUserByAccountAndEmail(account, email);
        if (user != null) {//查找到用户
            //比较验证码是否正确
            if (user.getSearchid() != null && code.equals(user.getSearchid())) {
                //比较验证码时间是否过期，过期为30分钟
                if (new Date().getTime() - user.getSearchtime().getTime() < 1800000) {
                    //使验证码无效
                    user.setSearchid(null);
                    user.setSearchtime(null);
                    //更新用户
                    userService.updataUser(user);
                    //验证通过到修改密码页面
                    model.addAttribute("id", user.getId());
                    return "searchPassword";
                } else {//验证码超时
                    model.addAttribute("account", account);
                    model.addAttribute("email", email);
                    model.addAttribute("codeMsg", "验证码过期");
                    return "searchEmail";
                }
            } else {//错误返回
                model.addAttribute("account", account);
                model.addAttribute("email", email);
                model.addAttribute("codeMsg", "验证码错误");
                return "searchEmail";
            }
        } else {//没找到用户
            model.addAttribute("account", account);
            model.addAttribute("email", email);
            model.addAttribute("emailMsg", "邮箱不存在");
            return "searchEmail";
        }
        //返回成功
    }

    /**
     * 修改密码
     *
     * @param user
     * @return
     */
    @RequestMapping("user/changePassword")
    @ResponseBody
    public BoPuResult changePassword(User user) {
        if (user != null && user.getId() != null) {
            //根据id查找用户
            User user1 = userService.selectUserById(user.getId());
            //修改密码
            user1.setPassword(user.getPassword());
            //保存用户
            userService.updataUser(user1);
            //返回成功
            return BoPuResult.ok();
        } else {
            //返回失败
            return BoPuResult.build(500, "用户信息错误，请重试");
        }
    }

    /**
     * 根据手机like查询用户
     *
     * @param phone
     * @return
     */
    @RequestMapping("user/phoneSearch")
    @ResponseBody
    public List<User> phoneSearch(String phone) {
        //根据手机查询用户
        List<User> list = userService.selectUserLikePhone(phone);
        //返回用户
        return list;
    }

    @RequestMapping("user/chat")
    public String phoneSearch(String id, HttpSession session, Model model) {
        //查询用户是否登陆
        Object object = session.getAttribute("user");
        //判断
        if (object == null || id == null || id.equals("")) {
            return "login";
        } else {
            User user = (User) object;
            //保存对方id
            String roomId = "";
            if (user.getId() > Integer.parseInt(id)) {
                roomId = id + "-" + user.getId();
            } else {
                roomId = user.getId() + "-" + id;
            }
            //保存房间id
            model.addAttribute("roomId", roomId);
            //获取对方
            User u = userService.selectUserById(Integer.parseInt(id));
            //保存对方
            model.addAttribute("other", u);
            //跳转到聊天页面
            return "chat";
        }
    }

    @RequestMapping("user/readLetter")
    @ResponseBody
    public BoPuResult readLetter(String receiver, String sender) {
        letterService.readLettersByReceiverAndSender(receiver, sender);
        return BoPuResult.ok();
    }


    @RequestMapping("user/getLetter")
    @ResponseBody
    public List<Letter> getLetter(String receiver, String sender, Integer startRow) {
        List<Letter> list = letterService.getLettersByReceiverAndSender(receiver, sender, startRow);
        return list;
    }

    @RequestMapping("user/getDistinctUser")
    @ResponseBody
    public List<LetterVo> getLetter(String receiver) {
        //获得发送者
        List<LetterVo> list = letterService.selectDistinctserNameByReceiver(receiver);
        //返回
        return list;
    }

    @RequestMapping("user/personChange")
    public String personChange(User user, HttpSession session) {
        //根据id查找用户
        User u = userService.selectUserById(user.getId());
        //修改信息
        u.setAddress(user.getAddress());
        u.setDuties(user.getDuties());
        u.setEmail(user.getEmail());
        u.setPhone(user.getPhone());
        u.setWork(user.getWork());
        u.setProfessional(user.getProfessional());
        u.setStation(user.getStation());
        //保存
        userService.updataUser(u);
        //更新session
        session.setAttribute("user", u);
        //返回
        return "index";
    }

    @RequestMapping("user/passwordChange")
    public String passwordChange(User user, String oldPassword, String newPassword, String reNewPassword, Model model, HttpSession session) {
        //根据id查找用户
        User u = userService.selectUserById(user.getId());
        //判断两次密码是否一致
        if (reNewPassword.equals(newPassword)) {
            //判断密码是否正确
            if (u.getPassword().equals(oldPassword)) {

                //修改信息
                u.setPassword(newPassword);
                //保存
                userService.updataUser(u);
                //更新session
                session.setAttribute("user", u);
                //返回
                return "index";
            } else {
                model.addAttribute("oldPassword", "原密码不正确");
                return "passwordChange";
            }
        } else {
            model.addAttribute("newPassword", "两次密码不一致");
            return "passwordChange";
        }

    }

    @RequestMapping("user/picChange")
    public String picChange(User user, HttpSession session) {
        //查找用户
        User u = userService.selectUserById(user.getId());
        //修改pic
        u.setPic(user.getPic());
        //保存
        userService.updataUser(u);
        //更新session
        session.setAttribute("user", u);
        return "index";
    }

    /**
     * 用户账号登出
     */

}
