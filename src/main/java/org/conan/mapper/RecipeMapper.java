package org.conan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;
import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;

public interface RecipeMapper {
	public RecipeVO readRecipe(int rid);
	public List<IngreVO> readIngre(int rid);
	public List<ProceVO> readProce(int rid);
	public List<String> readAllIngreNames();
	public List<String> readIngreNames(int rid);
	public int recipeCount();
	public int recipeCount(Criteria cri);
	public void recipeinsert(RecipeVO recipe);
	public void ingreinsert(IngreVO ingre); 
	public void proceinsert(ProceVO proce);
	public List<RecipeVO> readBestRecipe();
	public List<RecipeVO> readMinIngRecipe();
	
	public List<RecipeVO> getList();
	public List<RecipeVO> getListWithPaging(Criteria cri);
		
	public void updateReplyCnt(@Param("bno")Long no, @Param("amount")int amount);
	
}
