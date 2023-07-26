package com.cafmap.dao;

import com.cafmap.dto.MemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface MemDao {
	public MemDto login(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}
