package top.yll.dao;

import top.yll.domain.Account;
import top.yll.domain.Semester;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 帐户dao接口
 */
@Repository
public interface AccountDao {

    // 查询所有账户
    @Select("select * from account")
    public List<Account> findAll();

    // 保存帐户信息
    @Insert("insert into account (name,money) values (#{name},#{money})")
    public void saveAccount(Account account);

    //保存学期信息
    @Insert("insert into semesters (start_day,total_weeks,semester_name) values(#{start_day},#{total_weeks},#{semester_name})")
    public void saveSemesterInfo(Semester semester);

    //查询学期信息
    @Select("select * from semesters")
    public List<Semester> getCalendar();
}
