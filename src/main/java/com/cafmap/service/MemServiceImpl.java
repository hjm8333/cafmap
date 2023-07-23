package com.cafmap.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafmap.dao.MemDao;
import com.cafmap.dto.MemDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MemService")
public class MemServiceImpl implements MemService{

	@Autowired
	private MemDao dao;
	
	@Override
	public MemDto login(HashMap<String, String> param) {

		log.info("======================== MemServiceImpl.login() start ========================");
		
		MemDto dto = dao.login(param);
		
		log.info("======================== MemServiceImpl.login() end ========================");
		
		return dto;
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("======================== MemServiceImpl.write() start ========================");
		dao.write(param);
		log.info("======================== MemServiceImpl.write() end ========================");
	}

}
