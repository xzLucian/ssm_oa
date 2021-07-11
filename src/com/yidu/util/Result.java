package com.yidu.util;

/**
 * 通用ajax响应对象
 * @author bigpeng
 * @create 2021-04-28-10:39
 */
public class Result {
    private int code;//状态码
    private String msg;//消息提示
    private  Object data;//数据
    private long count;//记录条数

    public Result() {
    }
    //只返回数据
    public Result(Object data) {
        this.data = data;
    }
    //只返回状态码
    public Result(int code) {
        this.code = code;
    }
    //返回数据和数据条数
    public Result(Object data, long count) {
        this.data = data;
        this.count = count;
    }
    //返回状态码、信息、数据条数、数据
    public Result(int code, String msg,int count,Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }
    //返回状态码、数据信息、数据
    public Result(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    //返回状态码和信息
    public Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    //返回状态码和数据
    public Result(int code, Object data) {
        this.code = code;
        this.data = data;
    }
    //返回状态码、数据条数、数据
    public Result(int code,int count,Object data) {
        this.code = code;
        this.count = count;
        this.data = data;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }
}
