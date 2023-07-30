package com.cafmap.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafmap.dto.MemDto;
import com.cafmap.service.MemService;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class MemController {
	
	@Autowired
	private MemService service;

	@RequestMapping("/login")
	public String login(HttpSession session) {
		log.info("@# login");

		if(session.getAttribute("userDto") != null) {
			return "info";
		}else {
			return "login";
		}
	}

	@RequestMapping("/login_yn")
	public ResponseEntity<Integer> login_yn(@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("@# login_yn");

		MemDto dto = service.login(param);
		String pwd = param.get("pwd");

		if(dto == null) {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else if(pwd.equals(dto.getPwd())){
			session.setAttribute("userDto", dto);
			session.setMaxInactiveInterval(1800);
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}else {
			return ResponseEntity.status(HttpStatus.OK).body(404);
		}
	}
	
	@RequestMapping("/info")
	public String info() {
		log.info("=============== info");
		return "info";
	}
	
	@RequestMapping("/register")
	public String register() {
		log.info("=============== 회원가입");
		
		return "register";
	}

	@RequestMapping("/duplicateCheck")
	public ResponseEntity<Integer> duplicateCheck(@RequestParam HashMap<String, String> params) {
		log.info("UserController ===> duplicateCheck ====> start");

		if(service.login(params)!=null) {
			log.info("UserController ====> 이메일 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 이메일 사용가능");
			return ResponseEntity.status(HttpStatus.OK).body(200);
		}
	}

	@RequestMapping("/write")
	public ResponseEntity<Integer> write (@RequestParam HashMap<String, String> param) {
		log.info("@# write"+param);
		param.put("nickname", String.valueOf("유저"+service.countUser()+1));
		try {
			service.write(param);
			return ResponseEntity.status(HttpStatus.OK).body(200);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}
	}
}
