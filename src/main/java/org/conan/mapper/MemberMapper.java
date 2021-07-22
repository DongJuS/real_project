package org.conan.mapper;

import org.conan.domain.AuthVO;
import org.conan.domain.MemberVO;

public interface MemberMapper {

   public void register(MemberVO vo);
   public MemberVO login(MemberVO vo);
   public int Idcheck(String id);
   public void update(MemberVO vo);
   
   /* ��ť��Ƽ ���� */
   public MemberVO read(String userid);

   public void insertMember(MemberVO mem);/* ��� ���� */

   public void a_insertMember(AuthVO au);/* ���� �ο� */
   
}