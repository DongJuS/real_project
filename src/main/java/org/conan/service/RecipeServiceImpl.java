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
		if(recipe.getFileupload()==null||recipe.getFileupload().size()<=0) {
			return;
		}
		recipe.getFileupload().forEach(upload->{
			upload.setRid(recipe.getRid());
			uploadmapper.insert(upload);
		});
		
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
	/* �룞二� �궡媛� �꽔湲� �떆�옉 */
	
//	@Override 
//	public List<BoardVO> getList(){
//		log.info("getList.....");
//		return mapper.getList();
//	}
	@Override 
	public void register(BoardVO board){
		log.info("register...."+board.getBno());
		mapper.insertSelectKey(board);
	}
	@Override 
	public BoardVO get(Long bno){
		log.info("getList....."+bno);
		return mapper.read(bno);
	}
	@Override 
	public boolean modify(BoardVO board){
		log.info("modify....."+board);
		return mapper.update(board)==1;
	}
	@Override 
	public boolean remove(Long bno){
		log.info("remove....."+bno);
		return mapper.delete(bno)==1;
	}
	@Override
	public List<BoardVO> b_getList(Criteria cri){
		log.info("getList with criteria: "+cri);
		return mapper.b_getListWithPaging(cri);
	}
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.b_getTotalCount(cri);
	}

	@Override
	public boolean deleteAll(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public List<BoardVO> b_getList() {
		log.info("getList.............................");
		return mapper.b_getList();
	}
	
	

}
