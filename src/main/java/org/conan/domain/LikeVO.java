package org.conan.domain;

import lombok.Data;

@Data
public class LikeVO {
	private int rid;
	private String userId;
	private int checklike;
	private int likeSum;
	private int yesNo;
	
	
	public LikeVO() {}
	public LikeVO(int rid, String userId) {
		super();
		this.rid = rid;
		this.userId = userId;
	}
	public LikeVO(int likeSum, int yesNo) {
		super();
		this.likeSum = likeSum;
		this.yesNo = yesNo;
	}
	public LikeVO(int rid, int likeSum, int yesNo) {
		super();
		this.rid = rid;
		this.likeSum = likeSum;
	}
	
	

}
