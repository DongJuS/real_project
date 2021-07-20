package org.conan.domain;

import java.util.List;

import org.conan.domain.UploadFile;

import lombok.Data;

@Data
public class UserRecipeVO {
	private int urrid;
	private String urname;
	private String ursummary;
	private String userid;
	
	
	private List<UploadFile> uploadFile;

	
}
