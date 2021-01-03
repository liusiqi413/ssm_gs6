package com.utils;

/*
 * layui 数据表格类
 * 由于LayUI数据表格要求返回4个属性，分别是code、msg、count、data，为了方便代码编写，将
 * 这4个属性封装到类中
 * 此类封装LayUI数据表格中返回的数据格式
 */
public class DataGridViewResult {
    private Integer code=0;//执行状态码
    private String msg="";//提示信息
    private Long count=0L;//数量
    private Object data;//数据

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 创建数据表格对象
     * @param count     数据总数量
     * @param data      数据集合列表
     *                  封装数据表格
     */
    public DataGridViewResult(Long count, Object data) {
        super();
        this.count = count;
        this.data = data;
    }
    public DataGridViewResult(Object data) {
        super();
        this.data = data;
    }

    public DataGridViewResult() {
    }
}