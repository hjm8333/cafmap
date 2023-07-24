package com.cafmap.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafmap.dto.MemDto;
import com.cafmap.service.MemService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
	
	@Autowired
	private MemService service;
		
	@RequestMapping("/home")
	public String home() {
		log.info("@# home");
		
		return "home";
	}

	@RequestMapping("/login")
	public String login() {
		log.info("@# login");

		return "login";
	}

	@RequestMapping("/login_yn")
	public String login_yn(@RequestParam HashMap<String, String> param) {
		log.info("@# login_yn");
		
		
		MemDto dto = service.login(param);
		String pwd = param.get("pwd");

		if(dto == null) {
			return "redirect:login";
		}else if(pwd.equals(dto.getPwd())){
			return "redirect:login_ok";
		}else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("=============== 로그인_ok");
		
		return "login_ok";
	}
	
	@RequestMapping("/register")
	public String register() {
		log.info("=============== 회원가입");
		
		return "register";
	}
	
	@RequestMapping("/write")
	public String write(@RequestParam HashMap<String, String> param) {
		log.info("@# write");

		service.write(param);
		
		return "redirect:login";
	}
	
}
