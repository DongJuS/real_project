package org.conan.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class IngreVO {		//�젅�떆�뵾�뿉 �뵲瑜� �옱猷�
   private int rid;			//�젅�떆�뵾踰덊샇
   private String Ingre_name;	//�옱猷뚯씠由�
   private String Ingre_count;	//�빐�떦�옱猷뚭갗�닔
   private String Ingre_unit;	//�옱猷� 媛��닔�뿉 �뵲瑜� �떒�쐞
   
   public IngreVO(String Ingre_name, String Ingre_count, String Ingre_unit) { 
		this.Ingre_name=Ingre_name;
		this.Ingre_count=Ingre_count;
		this.Ingre_unit=Ingre_unit;
	}
}