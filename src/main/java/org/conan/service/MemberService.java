package org.conan.service;

import org.conan.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
public interface MemberService {

@Autowired
public void  register(MemberVO vo) throws Exception;
public MemberVO login(MemberVO vo) ;
public int Idcheck(String id);
public void Update(MemberVO vo);
}
