package org.conan.domain;

import java.util.List;

import lombok.Data;

@Data
public class SearchResultVO {

	private int rid;		//레시피아이디
	private List<String> ingsList;		//요리에 필요한 총 재료수
	private List<String> needIngs;		//요리에 필요하고, 고객에게는 없는 재료의 리스트
	private List<String> haveIngs;		//요리에 필요하고, 고객에게 있는 재료의 리스트	
	private String name;		//레시피이름
	private String img;		//음식 이미지
	private String summary;	//상세 정보

	public SearchResultVO() {}

	public SearchResultVO(int rid, List<String> ingsList, List<String> needIngs, List<String> haveIngs, String name, String img,
			String summary) {
		super();
		this.rid = rid;
		this.ingsList = ingsList;
		this.needIngs = needIngs;
		this.haveIngs = haveIngs;
		this.name = name;
		this.img = img;
		this.summary = summary;
	}


}
