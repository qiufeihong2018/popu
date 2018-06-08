package com.bopu.websocket;

import com.bopu.mapper.LetterMapper;
import com.bopu.mapper.UserMapper;
import com.bopu.pojo.Letter;
import com.bopu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * writer: holien
 * Time: 2017-08-01 13:00
 * Intent: webSocket服务器
 */
@ServerEndpoint("/webSocket/chat/{roomName}/{userId}/{myName}/{otherName}/{myPic}/{otherPic}")
public class WsServer {

    private UserMapper userMapper;
    private LetterMapper letterMapper;

    public WsServer() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/ApplicationContext-dao.xml");
        userMapper = applicationContext.getBean(UserMapper.class);
        letterMapper = applicationContext.getBean(LetterMapper.class);
    }

    // 使用map来收集session，key为roomName，value为同一个房间的用户集合
    // concurrentMap的key不存在时报错，不是返回null
    private static final Map<String, Set<Session>> rooms = new ConcurrentHashMap();

    @OnOpen
    public void connect(@PathParam("roomName") String roomName, Session session) throws Exception {
        // 将session按照房间名来存储，将各个房间的用户隔离
        if (!rooms.containsKey(roomName)) {
            // 创建房间不存在时，创建房间
            Set<Session> room = new HashSet<Session>();
            // 添加用户
            room.add(session);
            rooms.put(roomName, room);
        } else {
            // 房间已存在，直接添加用户到相应的房间
            rooms.get(roomName).add(session);
        }
        System.out.println("a client has connected!");
    }

    @OnClose
    public void disConnect(@PathParam("roomName") String roomName, Session session) {
        //获取房间
        Set<Session> sessions = rooms.get(roomName);
        //从房间中移除用户
        sessions.remove(session);
        //房间如果没人，删除房间
        if(sessions.size()==0){
            rooms.remove(sessions);
        }
        System.out.println("a client has disconnected!");
    }

    //发送消息
    @OnMessage
    public void receiveMsg(@PathParam("roomName") String roomName,@PathParam("userId") String userId,
                           @PathParam("myName") String myName,@PathParam("otherName") String otherName,
                           @PathParam("myPic") String myPic,@PathParam("otherPic") String otherPic,
                           String msg, Session session) throws Exception {
        //获取双方id
        String[] split = roomName.split("-");
        //根据id选择头像
        String pic = "";
        if (userId.equals(split[0])){
            pic = myPic;
        }else {
            pic = otherPic;
        }
        //创建时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date =new Date();
        String time = simpleDateFormat.format(date);
        String message;
        //把消息保存到数据库中
        Letter letter = new Letter();
        letter.setContent(msg);
        letter.setReceiver(otherName);
        letter.setSender(myName);
        letter.setTime(date);
        letter.setReaded(false);
        for (Session session1 : rooms.get(roomName)) {
            //判断是否发送给自己
            if(session1.equals(session)) {
                //发送给自己
                message = "<div class=\"chat-message-right\"><img class=\"img-circle\" src=\""+pic+"\" alt=\"\" style=\"width:48px;height: 48px;\"><div class=\"message\"><a class=\"message-author\" href=\"#\"> "+myName+"</a><span class=\"message-date\"> "+time+" </span><span class=\"message-content\">"+msg+"</span></div></div>";
            }else {
                //发送给别人
                message = "<div class=\"chat-message-left\"><img class=\"img-circle\" src=\""+pic+"\" alt=\"\" style=\"width:48px;height: 48px;\"><div class=\"message\"><a class=\"message-author\" href=\"#\"> "+myName+"</a><span class=\"message-date\"> "+time+" </span><span class=\"message-content\">"+msg+"</span></div></div>";
                //设置为已读消息
                letter.setReaded(true);
            }
            //发送
            session1.getBasicRemote().sendText(message);

        }
        letterMapper.insert(letter);

    }


}