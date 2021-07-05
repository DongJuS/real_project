package org.conan.sample;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {
	@Setter(onMethod_= {@Autowired})
	private DataSource rag;
	@Test
	public void testConnection() {
		try (Connection con = rag.getConnection()){
			log.info("될지도 ? : "+con);
		} catch (SQLException e) {fail(e.getMessage());}
	}
	
	@Setter(onMethod_= {@Autowired})
	private SqlSessionFactory Salesian;
	@Test
	public void testMyBatis() {
		try (SqlSession session = Salesian.openSession();
				Connection con = session.getConnection();){
			log.info("세션은 : "+session);
			log.info("커넥션은 : "+con);
		} catch (Exception e) {fail(e.getMessage());}
	}
}