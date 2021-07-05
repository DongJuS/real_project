package org.conan.sample;

import java.sql.SQLException;

import org.conan.mapper.TimeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTest {
	@Setter(onMethod_= {@Autowired})
	private TimeMapper timeMapper;
	
	@Test(expected = SQLException.class)
	public void testGetTime() throws Exception {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime2());
	}
	
	


  @Test(expected = SQLException.class)
  public void testGetTime2() throws Exception { 
	  log.info("getTime2");
	  log.info(timeMapper.getTime2()); }
  
  
  @Test
  public void testGetBookList(){ 
	  
	  try {
		log.info(timeMapper.getBookList()); 
		  log.info(timeMapper.getBookList().bookid);
		  log.info(timeMapper.getBookList().bookName);
		  log.info(timeMapper.getBookList().publisher);
		  log.info(timeMapper.getBookList().price);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
  }
  
  }
 