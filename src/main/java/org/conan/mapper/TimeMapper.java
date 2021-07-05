package org.conan.mapper;

import org.apache.ibatis.annotations.Select;
import org.conan.sample.BookVO;

public interface TimeMapper {
	@Select("select sysdate from dual")
	public String getTime();
	public String getTime2();
	public BookVO getBookList();
}
