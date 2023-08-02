package com.cafmap.service;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

import com.cafmap.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafmap.dao.MemDao;
import com.cafmap.dto.MemDto;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Slf4j
@Service("MemService")
public class MemServiceImpl implements MemService{

	@Autowired
	private MemDao dao;

	@Autowired
	private Utils utils;
	
	@Override
	public MemDto login(HashMap<String, String> param) {

		log.info("======================== MemServiceImpl.login() start ========================");
		
		MemDto dto = dao.login(param);
		
		log.info("======================== MemServiceImpl.login() end ========================");
		
		return dto;
	}

	@Override
	public MemDto nickName(HashMap<String, String> param) {

		log.info("======================== MemServiceImpl.login() start ========================");

		MemDto dto = dao.nickName(param);

		log.info("======================== MemServiceImpl.login() end ========================");

		return dto;
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("======================== MemServiceImpl.write() start ========================");
		dao.write(param);
		log.info("======================== MemServiceImpl.write() end ========================");
	}

	@Override
	public int countUser() {
		return dao.countUser();
	}

	@Override
	public String getProfilePath(HashMap<String, String> param, HttpSession session) {
		log.info("UserService ===> getProfilePath ===> start");

		MemDto user = (MemDto) session.getAttribute("userDto");

		param.put("userId", String.valueOf(user.getUserId()));
		String newProfilePath = dao.getProfilePath(param);

		log.info("UserService ===> getProfilePath ===> end");
		return newProfilePath;
	}
	@Override
	public boolean writeProfileImg(HashMap<String, String> params, MultipartFile[] uploadFile, HttpSession session) {
		log.info("UserService ===> write ===> start");

		log.info("서비스까지 왔노");
		MemDto user = (MemDto) session.getAttribute("userDto");
		log.info("@# id ===> " +user.getUserId());

		// 파라미터에 세션값으로 받은 id 추가
		params.put("userId", String.valueOf(user.getUserId()));
		log.info("uploadFile ===> "+uploadFile);

		String profileIdentity = UUID.randomUUID() + "_";

		// 파일 업로드
		for(MultipartFile multipartFile : uploadFile) {
			log.info("서비스에서 파일 업로드 시작");
			log.info("업로드 되는 파일 이름 ===> " +multipartFile.getOriginalFilename());
			log.info("업로드 되는 파일 크기 ===> " +multipartFile.getSize());
			log.info("===========================================");

			try {
				//getSavePath() : "C:/upload/temp3/" 사진 업로드 경로
				File uploadFolder = new File(utils.getSavePath());
				// => 해당 경로가 없다면 하위폴더 생성
				if(uploadFolder.exists() == false) {
					uploadFolder.mkdirs();
				}

				// new File (업로드 경로, 파일명)
				File saveFile = new File(utils.getSavePath(), profileIdentity + multipartFile.getOriginalFilename());

				// 파라미터에 imgPath 이름으로 파일 경로 추가
				params.put("imgPath", utils.getSavePath() + profileIdentity + multipartFile.getOriginalFilename());

				try {
					log.info("파라미터에 뭐가 있노 " + params);
					log.info("saveFile ===>" + saveFile);
					multipartFile.transferTo(saveFile);

				} catch (Exception e) {
					e.printStackTrace();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // for 반복문 종료

		// 쿼리 실행
		dao.writeProfileImg(params);

		log.info("UserService ===> write ===> end");
		return false;
	}

	@Override
	public void modify(HashMap<String, String> params) {
		log.info("UserService ===> modify ===> start");

		dao.modify(params);

		log.info("UserService ===> modify ===> end");
	}

}
