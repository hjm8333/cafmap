package com.cafmap.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafmap.dto.MemDto;

public interface MemService {
	public ArrayList<MemDto> login(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}
