package com.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class StudentHome {
    private Integer id;
    private String examno;
    private String stuno;
    private String stuname;
    private String idcard;
    private String stuaddr;
    private String homeaddr;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birth;
    private String ethnic;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getExamno() {
        return examno;
    }

    public void setExamno(String examno) {
        this.examno = examno;
    }

    public String getStuno() {
        return stuno;
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getStuaddr() {
        return stuaddr;
    }

    public void setStuaddr(String stuaddr) {
        this.stuaddr = stuaddr;
    }

    public String getHomeaddr() {
        return homeaddr;
    }

    public void setHomeaddr(String homeaddr) {
        this.homeaddr = homeaddr;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getEthnic() {
        return ethnic;
    }

    public void setEthnic(String ethnic) {
        this.ethnic = ethnic;
    }
}
