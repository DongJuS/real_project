package org.conan.domain;

import java.util.List;

import org.conan.domain.UploadFile;

import lombok.Data;

@Data
public class RecipeVO {		
	private int rownum;
   private int rid;			
   private String name;		
   private String img;		
   private String summary;	
   private int likecount;
   private int ingcount;
   
	private List<UploadFile> fileupload; 

   
   
 




}