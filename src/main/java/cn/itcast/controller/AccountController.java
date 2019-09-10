package cn.itcast.controller;

import cn.itcast.domain.Account;
import cn.itcast.domain.Semester;
import cn.itcast.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 帐户web
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/findAll")
    public String findAll(Model model) {
        System.out.println("表现层：查询所有账户...");
        // 调用service的方法
        List<Account> list = accountService.findAll();
        model.addAttribute("list", list);
        return "list";
    }

    /**
     * 保存
     *
     * @return
     */
    @RequestMapping("/save")
    public void save(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        accountService.saveAccount(account);
        response.sendRedirect(request.getContextPath() + "/account/findAll");
        return;
    }

    /**
     * 提交日期信息
     */
    @RequestMapping("/saveSemester")
    public void submitSemesterInfo(Semester semester, HttpServletRequest request, HttpServletResponse response) throws IOException {
        accountService.saveSemesterInfo(semester);
        response.sendRedirect(request.getContextPath()+"/account/getCalendar2");
        return;
    }

    @RequestMapping("/getCalendar")
    public String getCalendar(Model model) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        // 调用service的方法
        List<Semester> calendar = accountService.getCalendar();
        Semester se =  calendar.get(calendar.size()-1);
        model.addAttribute("calendar", calendar);
        model.addAttribute("weeks",se.getTotal_weeks());
        Date date = se.getStart_day();
        String dateFormat = sdf.format(date);
        model.addAttribute("startDay",dateFormat);
        model.addAttribute("semName",se.getSemester_name());
        return "schoolcalendar";
    }

    @RequestMapping("/getCalendar2")
    public String getCalendar2(Model model) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        // 调用service的方法
        List<Semester> calendar = accountService.getCalendar();
        Semester se =  calendar.get(calendar.size()-1);
        model.addAttribute("calendar", calendar);
        model.addAttribute("weeks",se.getTotal_weeks());
        Date date = se.getStart_day();
        String dateFormat = sdf.format(date);
        model.addAttribute("startDay",dateFormat);
        model.addAttribute("semName",se.getSemester_name());
        return "schoolcalendar2";
    }

    @RequestMapping("/calendar")
    @ResponseBody
    public List<Semester> calendar(){
        List<Semester> calendar = accountService.getCalendar();
        return calendar;
    }


}
