package org.conan.service;

import java.util.List;

import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;
import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;

public interface RecipeService {
	public RecipeVO readRecipe(int rid);
	public List<IngreVO> readIngre(int rid);
	public List<ProceVO> readProce(int rid);
	public List<String> readAllIngreNames();
	public List<String> readIngreNames(int rid);
	public int recipeCount();	//蹂묒꽍�씠�삎�쓽 getTotalCount�� �룞�씪
	public int recipeCount(Criteria cri);
	
	public List<RecipeVO> getList();
	public List<RecipeVO> getList(Criteria cri);
	public List<RecipeVO> readBestRecipe();
	public List<RecipeVO> readMinIngRecipe();
	
	public void register(RecipeVO recipe);
	public void register1(List<IngreVO> ingre); 
	public void register2(List<ProceVO> proce);
	
	

}
