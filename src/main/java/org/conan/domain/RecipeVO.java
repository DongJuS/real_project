package org.conan.domain;

import java.util.List;

import lombok.Data;

@Data
public class RecipeVO {		//레시피 상세내용
   private int rid;			//레시피번호
   private String name;		//레시피이름
   private String img;		//음식 이미지
   private String summary;	//상세 정보
   
   
public RecipeVO(int rid, String name, String img, String summary) {
	super();
	this.rid = rid;
	this.name = name;
	this.img = img;
	this.summary = summary;
}



}