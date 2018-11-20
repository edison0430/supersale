package org.supersale.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.supersale.dao.MemberDao;
import org.supersale.entity.Member;
import org.supersale.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;

    public boolean isUserExisted(String account) {

        boolean result = memberDao.isUserExisted(account);
        return result;
    }

    public boolean isValidPassword(String password) {

        boolean result = false;
        String regex = "^[A-Za-z0-9]{6,20}$";
        if(password.matches(regex)) {
            return true;
        }
        return result;
    }

    public void insertMember(Member member) {
        memberDao.insertMember(member);
    }

    public void updateMember(Member member) {
        memberDao.updateMember(member);
    }

    public void updatePassword(int customerId, String password) {
        memberDao.updatePassword(customerId, password);
    }

    public boolean isOldPasswordCorrect(int customerId, String password) {
        boolean result = memberDao.isOldPasswordCorrect(customerId, password);
        return result;
    }

    public Member checkLogin(String email, String password) {
        Member member = memberDao.Login(email, password);
        return member;
    }


}
