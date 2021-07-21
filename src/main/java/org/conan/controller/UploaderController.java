package org.conan.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.text.SimpleDateFormat;

import org.conan.domain.UploadFile;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploaderController {
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder="c:\\upload";

		for(MultipartFile multipartFile : uploadFile) {
			log.info("upload File Name" + multipartFile.getOriginalFilename());
			log.info("upload file size" + multipartFile.getSize());

			File saveFile=new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajox");
	}
	
	@PostMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<UploadFile>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<UploadFile> list=new ArrayList<>();
		String uploadFolder="c:\\upload";	
		File uploadPath=new File(uploadFolder,getFolder());
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}

		for(MultipartFile multipartFile: uploadFile) {
			UploadFile upload=new UploadFile();
			String uploadFileName=multipartFile.getOriginalFilename();
			upload.setFilename(uploadFileName);
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;			
			/* log.info(uploadFileName); */
			File saveFile=new File(uploadPath,uploadFileName);

			try {				
				multipartFile.transferTo(saveFile);

				upload.setUuid(uuid.toString());
				upload.setUploadPath(getFolder());

				
				  if(checkImageType(saveFile)) { upload.setFiletype(true); }
				 
				list.add(upload);

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	@GetMapping(value="/uploadAjaxAction", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<UploadFile>> uploadAjaxPost1(MultipartFile[] uploadFile) {
		List<UploadFile> list=new ArrayList<>();
		String uploadFolder="c:\\upload";	
		File uploadPath=new File(uploadFolder,getFolder());
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}

		for(MultipartFile multipartFile: uploadFile) {
			UploadFile upload=new UploadFile();
			String uploadFileName=multipartFile.getOriginalFilename();
			upload.setFilename(uploadFileName);
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;			
			/* log.info(uploadFileName); */
			File saveFile=new File(uploadPath,uploadFileName);

			try {				
				multipartFile.transferTo(saveFile);

				upload.setUuid(uuid.toString());
				upload.setUploadPath(getFolder());


				if(checkImageType(saveFile)) { upload.setFiletype(true); }

				list.add(upload);

			} 
			catch (IllegalStateException e) { // TODO Auto-generated catch block
				e.printStackTrace(); }
			catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}

	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String filename){
		//log.info("fileName : "+filename);
		File file=new File("c:/upload/"+filename);
		//log.info("file : "+ file);
		ResponseEntity<byte[]> result=null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	private String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date= new Date();
		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}


	private boolean checkImageType(File file) { 	
		try { 
			String contentType=Files.probeContentType(file.toPath()); 
			return 	contentType.startsWith("image"); 
			}catch (IOException e) { 
					// TODO	Auto-generated catch block 
				e.printStackTrace(); 
				}
		return false; 
		}





}
