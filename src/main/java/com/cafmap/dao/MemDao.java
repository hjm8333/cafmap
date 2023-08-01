package com.cafmap.dao;

import com.cafmap.dto.MemDto;
import org.apache.ibatis.annotations.Mapper;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Mapper
public interface MemDao {
	public MemDto login(HashMap<String, String> param);
	public MemDto nickName(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
	public int countUser();
	public MemDto selectUser(int userId);
	public String getProfilePath(HashMap<String, String> params);
	public boolean writeProfileImg(HashMap<String, String> params);
	public void modify(HashMap<String, String> params);
}
