package org.conan.domain;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProceVO {		//검색결과 페이지 노출시킬 내용
   private int rid;			//레시피 번호
   private String txt;		//이미지에 대한 설명,요리 순서
   private String pimg;		//음식 이미지
}
