package org.conan.service;

import java.util.List;


import org.conan.domain.Criteria;
import org.conan.domain.UploadFile;
import org.conan.domain.UserIngreVO;
import org.conan.domain.UserProceVO;
import org.conan.domain.UserRecipeVO;

public interface UserRecipeService {
	public List<UserRecipeVO> getList();
	public List<UserRecipeVO> getList(Criteria cri);
	public UserRecipeVO get(int urrid);
	public List<UserIngreVO> getingre(int urrid);
	public List<UserProceVO> getproce(int urrid);
	public void register(UserRecipeVO board);
	public void register1(List<UserIngreVO> uringre);
	public void register2(List<UserProceVO> urproce);
	public List<UploadFile> uploadlist(int urrid);
	public int urrecipeCount(Criteria cri);
	public List<UploadFile> allimg();
	public boolean remove(int urrid);
	public boolean removeingre(int urrid);
	public boolean removeproce(int urrid);
}
