package cn.itcast.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Semester {
    private Integer id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start_day;
    private Integer total_weeks;
    private String semester_name;

    @Override
    public String toString() {
        return "Semester{" +
                "id=" + id +
                ", start_day=" + start_day +
                ", total_weeks=" + total_weeks +
                ", semester_name='" + semester_name + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStart_day() {
        return start_day;
    }

    public void setStart_day(Date start_day) {
        this.start_day = start_day;
    }

    public Integer getTotal_weeks() {
        return total_weeks;
    }

    public void setTotal_weeks(Integer total_weeks) {
        this.total_weeks = total_weeks;
    }

    public String getSemester_name() {
        return semester_name;
    }

    public void setSemester_name(String semester_name) {
        this.semester_name = semester_name;
    }
}
