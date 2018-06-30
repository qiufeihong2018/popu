package com.bopu.utils;


import com.bopu.pojo.Comment;
import com.bopu.pojo.Content;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/**
 * @author Exler
 * @create 2018/6/30
 * @time 12:36
 * @describe:
 **/

public class RedisUtil {

    /**
     * 获取首页显示信息 picture article aboutour
     *
     * @return
     */
    public void  getIndex() {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/spring/ApplicationContext-dao.xml");
        JedisPool jedisPool = (JedisPool) applicationContext.getBean("jedisPool");
        Jedis jedis = jedisPool.getResource();
        Content content = new Content();
        content.setTitle("redis测试Title");
        content.setCategoryId(1);
        content.setUrl("/file/picture1");
        content.setSort(1);
        Map<String, String> map = new  HashMap<String, String>();
        map.put("title", "title测试");
        map.put("category_id", "1");
        map.put("sort", "1");
        map.put("url", "/file/picture1");
        jedis.hmset("picture1",map);
        System.out.println(jedis.hgetAll("picture2"));
        jedis.close();
    }

    /**
     * 设置首页显示信息
     * @param content
     */
    public static void setIndex(Content content) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/spring/ApplicationContext-dao.xml");
        JedisPool jedisPool = (JedisPool) applicationContext.getBean("jedisPool");
        Jedis jedis = jedisPool.getResource();
        Map<String, String> map = new HashMap<String, String>();
        map.put("title", content.getTitle());
        map.put("url", content.getUrl());
        map.put("category",content.getCategoryId().toString());
        map.put("sort", content.getSort().toString());
        map.put("pic", content.getPic());
        String key = null;
        if (content.getCategoryId() == 1) {
            key = "art";
        } else if (content.getCategoryId() == 2) {
            key = "picture";
        }
        key += content.getSort();
        jedis.hmset(key, map);
        jedis.close();

    }

    @Test
    public void test2() throws Exception {
        // jedis连接池
        // 创建连接池
//        JedisPool pool = new JedisPool("111.231.55.41", 6379);
        JedisPool pool = new JedisPool("111.231.55.41", 6379);
        // 获取连接
        Jedis jedis = pool.getResource();
        A a = new A("exler", "123");
        jedis.hset("picture1", "name", a.getName());
        jedis.hset("picture1", "pwd", a.getPwd());
        System.out.println(jedis.hget("picture1", "name"));
        jedis.close();
    }

}
class A implements Serializable {
    private String name;
    private String pwd;

    public A() {
    }

    public A(String name, String pwd) {
        this.name = name;
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
