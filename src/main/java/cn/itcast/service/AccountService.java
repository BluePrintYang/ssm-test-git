package cn.itcast.service;

import cn.itcast.domain.Account;
import cn.itcast.domain.Semester;

import java.util.List;

public interface AccountService {



    // 查询所有账户
    public List<Account> findAll();

    // 保存帐户信息
    public void saveAccount(Account account);

    //保存学期信息
    public void saveSemesterInfo(Semester semester);

    //展示校历
    public List<Semester> getCalendar();
}
