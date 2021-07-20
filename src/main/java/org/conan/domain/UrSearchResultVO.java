package org.conan.domain;

import java.util.List;

import lombok.Data;

@Data
public class UrSearchResultVO {
	private int urrid;
	private List<String> ingsList;
	private List<String> needIngs;
	private List<String> haveIngs;
	private String urname;
	private String ursummary;
	
	public UrSearchResultVO() {}
	public UrSearchResultVO(int urrid, List<String> ingsList, List<String> needIngs,List<String> haveIngs, String urname, String ursummary) {
		super();
		this.urrid=urrid;
		this.ingsList=ingsList;
		this.haveIngs=haveIngs;
		this.needIngs=needIngs;
		this.urname=urname;
		this.ursummary=ursummary;
	}
}
