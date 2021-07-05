package org.conan.sample;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.conan.mapper.RecipeMapper;
import org.conan.mapper.TimeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeMapperTest {
	@Setter(onMethod_= {@Autowired})
	private RecipeMapper recipeMapper;
	
	@Test(expected = SQLException.class)
	public void test1() throws Exception {
		
		String[] recBefore =  recipeMapper.readRecipe(0).getSummary().split(" ");
		ArrayList<String> aa = new ArrayList<>(Arrays.asList(recBefore));
		log.info(aa);
		log.info("*********************************************");
		log.info(aa.removeIf(s -> (s.equals("만개의레시피"))));
		log.info(aa.removeIf(s -> (s.equals("세상의모든레시피"))));
		log.info(aa);
		String bb = String.join(" ", aa);
		log.info(bb);
		log.info("*********************************************");
		log.info("*********************************************");
		
		
	}
	
	@Test
	public void testInsert() throws Exception{
		
	}
	
	//	@Test(expected = SQLException.class)
//	public void testGetTime() throws Exception {
//		log.info(timeMapper.getClass().getName());
//		log.info(timeMapper.getTime2());
//	}
//	
//	
//
//
//  @Test(expected = SQLException.class)
//  public void testGetTime2() throws Exception { 
//	  log.info("getTime2");
//	  log.info(timeMapper.getTime2()); }
  
  
//  @Test
//  public void testGetBookList(){ 
//	  
//	  try {
//		log.info(timeMapper.getBookList()); 
//		  log.info(timeMapper.getBookList().bookid);
//		  log.info(timeMapper.getBookList().bookName);
//		  log.info(timeMapper.getBookList().publisher);
//		  log.info(timeMapper.getBookList().price);
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//	  
//  }
  
  }
 