package org.conan.mapper;

import org.conan.domain.MemberVO;

public interface MemberMapper {

	public void register(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public int Idcheck(String id);
	public void update(MemberVO vo);
	
	/* 시큐리티 시작 */
	public MemberVO read(String userid);
}