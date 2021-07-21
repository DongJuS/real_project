package org.conan.service;


import org.conan.domain.AuthVO;
import org.conan.domain.MemberVO;
import org.conan.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MemberServiceImpl implements MemberService {
@Autowired
private MemberMapper mapper;
   @Override
   public void register(MemberVO vo) {
      // TODO Auto-generated method stub
      
      mapper.register(vo);
   }
   @Override
   public MemberVO login(MemberVO vo) {
      // TODO Auto-generated method stub
       return mapper.login(vo);
   }
   @Override
   public int Idcheck(String id) {
      // TODO Auto-generated method stub
      return mapper.Idcheck(id);
   }
   @Override
   public void Update(MemberVO vo) {
      // TODO Auto-generated method stub
       mapper.update(vo);
   }
   @Override
   public void join(MemberVO mem) {
      mapper.insertMember(mem);
      
   }
   @Override
   public void a_join(AuthVO au) {
      mapper.a_insertMember(au);
      
   }
   

   
   



}