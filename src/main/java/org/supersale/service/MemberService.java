package org.supersale.service;

import org.supersale.entity.Member;

public interface MemberService {

    boolean isUserExisted(String email);

    boolean isValidPassword(String password);

    void insertMember(Member member);

    void updateMember(Member member);

    boolean isOldPasswordCorrect(int customerId, String password);

    void updatePassword(int customerId, String password);

    Member checkLogin(String email, String password);


}
