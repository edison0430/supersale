package org.supersale.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.supersale.entity.Member;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class MemberDaoTest {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private MemberDao memberDao;

    @Test
    public void insertCustomer() {
        Member member = new Member();
        member.setName("張三");
        member.setPhone("0975605839");
        member.setEmail("edison76309@gmail.c");
        member.setPassword("784533");
        logger.info("插入前的ID: {}", member.getMemberId());
        memberDao.insertMember(member);
        logger.info("插入後的ID: {}", member.getMemberId());
    }

    @Test
    public void updateMember() {
        Member member = new Member();
        member.setName("王顯群");
        member.setGender("男");
        member.setPhone("0975605812");
        member.setEmail("asd@c");
        member.setAddress("台中市XX街");
        member.setMemberId(26);
        memberDao.updateMember(member);
    }

    @Test
    public void existUser() {
        String email="asd@c";
        boolean existUser = memberDao.isUserExisted(email);
        logger.info("使用者是否存在: {}", existUser);
    }

    @Test
    public void updatePassword() {
        String password = "7855";
        int memberId = 26;
        memberDao.updatePassword(memberId,password);
    }

    @Test
    public void Login() {
        String email="edison763092@gmail.com";
        String password="784455";
        Member member = memberDao.Login(email, password);
        if(member != null) {
            String name = member.getName();
            logger.info("登入成功, {} 你好", name);
        } else {
            logger.info("登入失敗");
        }
    }

    @Test
    public void isOldPasswordCorrect() {
        int customerId = 26;
        String password = "784533";
        boolean result = memberDao.isOldPasswordCorrect(customerId, password);
        logger.info("舊密碼是否正確: {}", result);
    }
}