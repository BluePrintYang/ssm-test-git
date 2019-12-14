package top.yll.service.impl;

import top.yll.dao.AccountDao;
import top.yll.domain.Account;
import top.yll.domain.Semester;
import top.yll.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService{

    @Autowired
    private AccountDao accountDao;

    public List<Account> findAll() {
        System.out.println("业务层：查询所有账户...");
        return accountDao.findAll();
    }

    public void saveAccount(Account account) {
        System.out.println("业务层：保存帐户...");
        accountDao.saveAccount(account);
    }

    @Override
    public void saveSemesterInfo(Semester semester) {
        accountDao.saveSemesterInfo(semester);
    }

    @Override
    public List<Semester> getCalendar() {
        return accountDao.getCalendar();
    }
}
