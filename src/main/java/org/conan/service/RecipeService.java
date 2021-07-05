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
	public int recipeCount();	//병석이형의 getTotalCount와 동일
	public int recipeCount(Criteria cri);
	
	public List<RecipeVO> getList();
	public List<RecipeVO> getList(Criteria cri);
	
	public void register(RecipeVO recipe);
	public void register1(List<IngreVO> ingre); 
	public void register2(ProceVO proce);
	
	public void register(BoardVO board);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
    public List<BoardVO> b_getList();
	public List<BoardVO> b_getList(Criteria cri);
	public int getTotal(Criteria cri);
	public boolean deleteAll(Long bno);

}
