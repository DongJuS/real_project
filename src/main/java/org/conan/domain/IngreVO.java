package org.conan.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@RequiredArgsConstructor
public class IngreVO {		//레시피에 따른 재료
   private int rid;			//레시피번호
   private String Ingre_name;	//재료이름
   private String Ingre_count;	//해당재료갯수
   private String Ingre_unit;	//재료 갯수에 따른 단위
   
   public IngreVO(int rid,String Ingre_name) {
		this.rid=rid;
		this.Ingre_name=Ingre_name;
	}
}