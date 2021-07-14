package org.conan.domain;

import lombok.Data;

@Data
public class LikeVO {
	private int rid;
	private String userId;
	private int checklike;
	
	public LikeVO() {}
	public LikeVO(int rid, String userId) {
		super();
		this.rid = rid;
		this.userId = userId;
	}

}
