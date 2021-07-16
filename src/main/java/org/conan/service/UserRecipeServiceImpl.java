package org.conan.service;

import java.util.List;

import org.conan.domain.Criteria;
import org.conan.domain.UploadFile;
import org.conan.domain.UserIngreVO;
import org.conan.domain.UserProceVO;
import org.conan.domain.UserRecipeVO;
import org.conan.mapper.UploadFileMapper;
import org.conan.mapper.UserRecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
@Repository
public class UserRecipeServiceImpl implements UserRecipeService {
	@Setter(onMethod_=@Autowired )
	private UserRecipeMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private UploadFileMapper uploadmapper;
	
	
	@Override
	public List<UserRecipeVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public UserRecipeVO get(int urrid) {
		uploadmapper.findbyrid(urrid);
		return mapper.read(urrid);
	}

	@Override
	public void register(UserRecipeVO urrecipe) {
		mapper.insert(urrecipe);
		
		  if(urrecipe.getUploadFile()==null||urrecipe.getUploadFile().size()<=0) { return;
		  } urrecipe.getUploadFile().forEach(upload->{ upload.setUrrid(urrecipe.getUrrid());
		  uploadmapper.insert(upload); });
		 
	}

	

	@Override
	public List<UserIngreVO> getingre(int urrid) {
		// TODO Auto-generated method stub
		return mapper.readingre(urrid);
	}

	@Override
	public List<UserProceVO> getproce(int urrid) {
		// TODO Auto-generated method stub
		return mapper.readproce(urrid);
	}

	@Override
	public void register1(List<UserIngreVO> uringre) {
		if (uringre != null) {
			for (UserIngreVO ing : uringre) {
				
				mapper.ingreinsert(ing);
			}
		}
		
	}

	@Override
	public void register2(List<UserProceVO> urproce) {
		if (urproce != null) {
			for (UserProceVO pro : urproce) {
				mapper.proceinsert(pro);
			}
		}
		
	}

	@Override
	public List<UserRecipeVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<UploadFile> uploadlist(int urrid) {
		// TODO Auto-generated method stub
		return uploadmapper.findbyrid(urrid);
	}

	@Override
	public int urrecipeCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.urrecipeCount(cri);
	}

	@Override
	public List<UploadFile> allimg() {
		// TODO Auto-generated method stub
		return uploadmapper.allimg();
	}

	@Override
	public boolean remove(int urrid) {
		uploadmapper.delete(urrid);
		return mapper.remove(urrid)==1;
	}

	@Override
	public boolean removeingre(int urrid) {
		// TODO Auto-generated method stub
		return mapper.removeingre(urrid)==1;
	}

	@Override
	public boolean removeproce(int urrid) {
		// TODO Auto-generated method stub
		return mapper.removeproce(urrid)==1;
	}

	@Override
	public List<UserIngreVO> getAll() {
		// TODO Auto-generated method stub
		return mapper.getAll();
	}

	@Override
	public List<String> readIngreNames(int urrid) {
		// TODO Auto-generated method stub
		return mapper.readIngreNames(urrid);
	}

	@Override
	public List<String> readAllIngreNames() {
		// TODO Auto-generated method stub
		return mapper.readAllIngreNames();
	}

	@Override
	public int urrecipeCount() {
		// TODO Auto-generated method stub
		return mapper.urrecipeCount();
	}

}
