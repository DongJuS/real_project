package org.conan.domain;

import lombok.Data;

@Data
public class UserProceVO {
	private int urrid;
	private String urtxt;

	public UserProceVO(String urtxt) {
		
		this.urtxt=urtxt;
		
	}


}
