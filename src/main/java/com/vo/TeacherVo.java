package com.vo;
import com.entity.Teacher;

public class TeacherVo extends Teacher {
        //注意：page和limit属性要与LayUI的数据表格参数一致
        //当前页码
        private Integer page;
        //每页显示数量
        private Integer limit;

        public Integer getPage() {
            return page;
        }

        public void setPage(Integer page) {
            this.page = page;
        }

        public Integer getLimit() {
            return limit;
        }

        public void setLimit(Integer limit) {
            this.limit = limit;
        }
    }
