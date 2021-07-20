package org.conan.mapper;

import org.conan.domain.AuthVO;
import org.conan.domain.MemberVO;

public interface MemberMapper {

	public void register(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public int Idcheck(String id);
	public void update(MemberVO vo);
	
	/* 시큐리티 시작 */
	public MemberVO read(String userid);

	public void insertMember(MemberVO mem);/* 멤버 생성 */

	public void a_insertMember(AuthVO au);/* 권한 부여 */
	
}