package com.cafmap.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.cafmap.dto.MemDto;

@Mapper
public interface MemDao {
	public MemDto login(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}
