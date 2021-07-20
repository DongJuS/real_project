package org.conan.task;




import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import org.conan.domain.UploadFile;
import org.conan.mapper.UploadFileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	@Setter(onMethod_= {@Autowired})
	private UploadFileMapper mapper;

	private String getFolderYesterday() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String str=sdf.format(cal.getTime());
		return str.replace("-", File.separator);
	}


	@Scheduled(cron="* * 18 * * *") 
	public void checkFile() throws Exception{
		List<UploadFile> filelist=mapper.getold(); 
		List<Path> fileListpaths= filelist.stream().map(vo->Paths.get("c:\\upload", vo.getUploadPath(),
				vo.getUuid()+"_"+vo.getFilename())).collect(Collectors.toList()); 
		//log.info(path);
		filelist.stream().filter(vo->vo.isFiletype()==true).map(vo->Paths.get("c:\\upload", vo.getUploadPath(), vo.getUuid()+"_"+vo.getFilename()))
		.forEach(p->fileListpaths.add(p));
		File targetDir=Paths.get("c:\\upload",getFolderYesterday()).toFile(); 
		File[] removeFiles=targetDir.listFiles(file->fileListpaths.contains(file.toPath())==false);
		log.info(removeFiles);
		for(File file : removeFiles) { 
			log.warn(file.getAbsoluteFile());
			file.delete(); 
		} 
	}



}
