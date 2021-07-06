package org.conan.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String type; //�˻��׸�
	private String keyword; //�˻� Ű����
	
	public String[] getTypeArr() {
		return type==null? new String [] {} : type.split("");
		//�˻������� �迭�� ó�� 
	}
	public String getListLink() {
		UriComponentsBuilder builder=UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
	
	public Criteria() {
		this(1,10);
	}
	
	
	public Criteria(int pageNum, int amount) {
		this.amount=amount;
		this.pageNum=pageNum;
	}
}
