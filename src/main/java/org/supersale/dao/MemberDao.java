package org.supersale.dao;

import org.apache.ibatis.annotations.Param;
import org.supersale.entity.Member;

public interface MemberDao {

  /**
     * 新增會員
     * @param member
     * @return
     */
  int insertMember(Member member);

  /**
   * 修改會員資料
   * @param member
   * @return
   */
  int updateMember(Member member);

  /**
   * 修改密碼時，確認舊密碼是否正確
   * @param memberId
   * @param password
   * @return
   */
  boolean isOldPasswordCorrect(@Param("memberId") int memberId, @Param("password") String password);

  /**
   * 變更會員密碼
   * @param memberId
   * @param password
   * @return
   */
  int updatePassword(@Param("memberId") int memberId, @Param("password") String password);

  /**
     * 確認email是否已被註冊
     * @param email
     * @return
     */
    boolean isUserExisted(@Param("email") String email);

  /**
     * 登入時檢查email及password是否正確
     * @param email
     * @param password
     * @return
      */
    Member Login(@Param("email") String email, @Param("password") String password);

}
