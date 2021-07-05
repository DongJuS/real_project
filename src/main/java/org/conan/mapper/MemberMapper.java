package org.conan.mapper;

import org.conan.domain.MemberVO;

public interface MemberMapper {

	public void register(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public int Idcheck(String id);
	public void update(MemberVO vo);
}