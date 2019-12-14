package top.yll.test;


import top.yll.domain.Semester;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Test01 {
    public static void main(String[] args) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Semester semester = new Semester();
        Date date = new Date();
        semester.setStart_day(date);
        Date date1 = semester.getStart_day();
        String date2 = simpleDateFormat.format(date1);
        System.out.println(date2);
    }
}


