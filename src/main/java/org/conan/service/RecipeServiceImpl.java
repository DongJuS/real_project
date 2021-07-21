package org.conan.service;

import java.util.List;

import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;
import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;
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
public class RecipeServiceImpl implements RecipeService {
	@Setter(onMethod_=@Autowired)
	private RecipeMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private UploadFileMapper uploadmapper;
	
	@Override
	public RecipeVO readRecipe(int rid) {
		return mapper.readRecipe(rid);
	}
	@Override
	public List<IngreVO> readIngre(int rid) {
		// TODO Auto-generated method stub
		return mapper.readIngre(rid);
	}
	@Override
	public List<ProceVO> readProce(int rid) {
		// TODO Auto-generated method stub
		return mapper.readProce(rid);
	}
	@Override
	public List<String> readAllIngreNames() {
		// TODO Auto-generated method stub
		return mapper.readAllIngreNames();
	}
	@Override
	public List<String> readIngreNames(int rid) {
		// TODO Auto-generated method stub
		return mapper.readIngreNames(rid);
	}
	@Override
	public int recipeCount() {		//蹂묒꽍�씠�삎�쓽 getTotalCount�� �룞�씪
		// TODO Auto-generated method stub
		return mapper.recipeCount();
	}
	
	
	@Override
	public List<RecipeVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	@Override
	public List<RecipeVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int recipeCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.recipeCount(cri);
	}
	@Override
	public void register(RecipeVO recipe) {
		mapper.recipeinsert(recipe);
		/*
		 * if(recipe.getFileupload()==null||recipe.getFileupload().size()<=0) { return;
		 * } recipe.getFileupload().forEach(upload->{ upload.setRid(recipe.getRid());
		 * uploadmapper.insert(upload); });
		 */
		
	}
	@Override
	public void register1(List<IngreVO> ingre) {
		if (ingre != null) {
			for (IngreVO ing : ingre) {
				
				mapper.ingreinsert(ing);
			}
		}
		
	}
	@Override
	public void register2(List<ProceVO> proce) {
		if (proce != null) {
			for (ProceVO pro : proce) {
				mapper.proceinsert(pro);
			}
		}
	}
	
	@Override
	public List<RecipeVO> readBestRecipe() {
		return mapper.readBestRecipe();
	}
	
	@Override
	public List<RecipeVO> readMinIngRecipe() {
		return mapper.readMinIngRecipe();
	}
}
