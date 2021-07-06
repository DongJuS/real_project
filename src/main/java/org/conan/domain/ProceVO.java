package org.conan.domain;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProceVO {		//寃��깋寃곌낵 �럹�씠吏� �끂異쒖떆�궗 �궡�슜
   private int rid;			//�젅�떆�뵾 踰덊샇
   private String txt;		//�씠誘몄��뿉 ���븳 �꽕紐�,�슂由� �닚�꽌
   private String pimg;		//�쓬�떇 �씠誘몄�
   
   public ProceVO(String txt, String pimg) {
		this.pimg=pimg;
		this.txt=txt;
	}
}
