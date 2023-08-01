package com.cafmap.service;

import com.cafmap.dto.MemDto;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

public interface MemService {
	public MemDto login(HashMap<String, String> param);
	public MemDto nickName(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
	public int countUser();
	public String getProfilePath(HashMap<String, String> params, HttpSession session);
	public boolean writeProfileImg(HashMap<String, String> params, MultipartFile[] uploadFile, HttpSession session);
    public void modify(HashMap<String, String> params);
}
