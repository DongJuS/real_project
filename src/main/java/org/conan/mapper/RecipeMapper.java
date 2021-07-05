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
	
	
	public List<RecipeVO> getList();
	public List<RecipeVO> getListWithPaging(Criteria cri);
		
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO board);
	public List<BoardVO> b_getListWithPaging(Criteria cri);
	public List<BoardVO> b_getList();
	public int b_getTotalCount(Criteria cri);
	public void updateReplyCnt(@Param("bno")Long no, @Param("amount")int amount);
}
