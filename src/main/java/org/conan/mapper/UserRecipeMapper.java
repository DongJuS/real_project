package org.conan.mapper;

import java.util.List;

import org.conan.domain.Criteria;
import org.conan.domain.UserIngreVO;
import org.conan.domain.UserProceVO;
import org.conan.domain.UserRecipeVO;

public interface UserRecipeMapper {
	public List<UserRecipeVO> getList();
	public List<UserRecipeVO> getListWithPaging(Criteria cri);
	public void inserturecipe(UserRecipeVO urrecipe);
	public UserRecipeVO read(int urrid);
	public List<UserIngreVO> readingre(int urrid);
	public List<UserProceVO> readproce(int urrid);
	public void insert(UserRecipeVO urrecipe);
	public void ingreinsert(UserIngreVO uringre);
	public void proceinsert(UserProceVO urproce);
	public int urrecipeCount(Criteria cri);
	public int remove(int urrid);
	public int removeingre(int urrid);
	public int removeproce(int urrid);
}