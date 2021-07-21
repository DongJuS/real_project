package org.conan.service;

import java.util.List;


import org.conan.domain.LikeVO;
import org.conan.mapper.LikeMapper;
import org.conan.mapper.RecipeMapper;
import org.conan.mapper.UploadFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@Repository
public class LikeServiceImpl implements LikeService {
	@Setter(onMethod_=@Autowired)
	private LikeMapper mapper;

	@Override
	public List<LikeVO> readLike(LikeVO lVO) {
		return mapper.readLike(lVO);
	}

	@Override
	public void insertLike(LikeVO lVO) {
		mapper.insertLike(lVO);
	}

	@Override
	public Integer countLike(int rid) {
		return mapper.countLike(rid);
	}
	
	@Override
	public Integer countLike2(int rid) {
		return mapper.countLike2(rid);
	}

	@Override
	public Integer likeOrNot(LikeVO lVO) {
		return mapper.likeOrNot(lVO);
	}

	@Override
	public void deleteLike(LikeVO lVO) {
		mapper.deleteLike(lVO);
	}

	@Override
	public int getMaxRid() {
		return mapper.getMaxRid();
	}

	@Override
	public void updateLikeCount(LikeVO lVO) {
		mapper.updateLikeCount(lVO);
	}

}
