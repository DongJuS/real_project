package org.conan.service;

import java.util.List;

import org.conan.domain.LikeVO;

public interface LikeService {
	public List<LikeVO> readLike(LikeVO lVO);
	public void insertLike(LikeVO lVO);
	public Integer countLike(int rid);
	public Integer countLike2(int rid);
	public Integer likeOrNot(LikeVO lVO);
	public void deleteLike(LikeVO lVO);
	public int getMaxRid();
	public void updateLikeCount(LikeVO lVO);
}
