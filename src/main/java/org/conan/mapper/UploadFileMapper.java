package org.conan.mapper;

import java.util.List;

import org.conan.domain.UploadFile;

public interface UploadFileMapper {
   public void insert(UploadFile upload);
   public void delete(int urrid);
   public List<UploadFile> findbyrid(int rid);
   public List<UploadFile> allimg();
   public List<UploadFile> getold();
}