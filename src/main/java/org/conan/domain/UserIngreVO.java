package org.conan.domain;

import lombok.Data;

@Data
public class UserIngreVO {
	private int urrid;
	private String urIngre_name;
	private String urIngre_count;
	private String urIngre_unit;
	
	public UserIngreVO(String urIngre_name, String urIngre_count, String urIngre_unit) { 
		this.urIngre_name=urIngre_name;
		this.urIngre_count=urIngre_count;
		this.urIngre_unit=urIngre_unit;
	}
}
