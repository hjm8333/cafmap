package com.cafmap.service;

import com.cafmap.dto.MemDto;

import java.util.HashMap;

public interface MemService {
	public MemDto login(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}
