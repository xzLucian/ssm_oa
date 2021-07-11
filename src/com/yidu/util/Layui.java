package com.yidu.util;
import java.util.HashMap;
import java.util.List;

/**
 * @author XiongAiWen
 * @version 1.0
 * @description:
 * @data 2021/1/7 9:10
 */
public class Layui extends HashMap<String,Object> {

    public static Layui data(Integer count, List<?> data){
        Layui r = new Layui();
        r.put("code", 0);
        r.put("msg", "");
        r.put("count", count);
        r.put("data", data);
        return r;
    }
}

