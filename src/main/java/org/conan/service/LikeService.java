package org.conan.service;

import java.util.List;

import org.conan.domain.LikeVO;

public interface LikeService {
	public List<LikeVO> readLike(LikeVO lVO);
	public void insertLike(int rid, String userId);
	public int countLike(int rid);
}
