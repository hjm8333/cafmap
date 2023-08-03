package com.cafmap.controller;

import com.cafmap.dto.MemDto;
import com.cafmap.service.MemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
import java.nio.file.NoSuchFileException;
import java.util.HashMap;

@Controller
@Slf4j
public class MemController {
	
	@Autowired
	private MemService service;

	@RequestMapping("/login")
	public String login(HttpSession session) {
		log.info("@# login");
		if(session.getAttribute("userDto") != null) {
			session.setAttribute("now", 3);
			return "info";
		}else {
			session.setAttribute("now", 3);
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
	public String info(HttpSession session) {
		log.info("=============== info");

		if(session.getAttribute("userDto") != null) {
			session.setAttribute("now", 3);
			return "info";
		}else {
			session.setAttribute("now", 3);
			return "login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		log.info("=============== logout");
		session.removeAttribute("userDto");
		session.setAttribute("now", 3);
		return "redirect:login";
	}

	@RequestMapping("/duplicateCheck")
	public ResponseEntity<Integer> duplicateCheck(@RequestParam HashMap<String, String> params) {
		log.info("UserController ===> duplicateCheck ====> start");

		if(service.login(params)!=null) {
			log.info("UserController ====> 아이디 사용불가");
			return ResponseEntity.status(HttpStatus.OK).body(400);
		}else {
			log.info("UserController ====> 아이디 사용가능");
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

	@RequestMapping("/getProfileImgPath")
	public ResponseEntity<String> getProfileImgPath (@RequestParam HashMap<String, String> param, HttpSession session) {
		log.info("@# getProfileImgPath"+param);
		try {
			String imgPath = service.getProfilePath(param, session);
			return ResponseEntity.status(HttpStatus.OK).body(imgPath);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null);
		}
	}

	@RequestMapping("/uploadProfile")
	public ResponseEntity<String> uploadProfile(@RequestParam HashMap<String, String> params, MultipartFile[] uploadFile, HttpSession session) {
		log.info("UserController ===> uploadProfile ===> start");

		log.info("uploadFile ===> "+uploadFile);
		service.writeProfileImg(params, uploadFile, session);

		String newProfilePath = service.getProfilePath(params, session);
		log.info("newProfilePath ===> " +newProfilePath);

		log.info("UserController ===> uploadProfile ===> end");

		MemDto user = (MemDto) session.getAttribute("userDto");

		// 기존 이미지가 존재한다면, 해당 파일을 찾아서 삭제한다
		if ( user.getImgPath() != null ) {
			File deleteFile = new File(user.getImgPath()); // 삭제할 파일의 위치로 이동해서
			if ( deleteFile.exists() == true ) { deleteFile.delete();	} // 삭제할 파일이 존재한다면 삭-제
		}

		user.setImgPath(newProfilePath);				// 새 프로필이미지 경로+파일명을 setter 로 DTO에 설정하고
		session.setAttribute("userDto", user);			// 그걸 다시 session 에 넣어주기

		return ResponseEntity.ok().body(newProfilePath);
	}

	@ResponseBody
	@RequestMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {

		// 리턴용 객체
		ResponseEntity<byte[]> result = null;
		// 매개변수로 받은 파일 경로로 파일 객체 생성
		File file = new File(fileName);

		try {

			// 파일을 HTTP 응답으로 전송하기 위해 필요한 헤더와 데이터를 설정 (헤더 객체 생성)
			HttpHeaders header = new HttpHeaders();

			// Content-Type 헤더 설정(파일의 MIME 타입을 가져와서 Content-Type 헤더에 추가)
			header.add("Content-Type", Files.probeContentType(file.toPath()));

			// FileCopyUtils.copyToByteArray(file)를 사용하여 파일의 내용을 byte[]로 복사하여 응답 데이터로 설정
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (NoSuchFileException ne) {
			log.info("★ 해당 경로에 프로필 사진이 없노");
		} catch (InvalidPathException ipe) {
			log.info("★ 프로필 사진 요청하는 경로가 없노");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/modify")
	public ResponseEntity<String> modify(@RequestParam HashMap<String, String> params, HttpSession session) {
		log.info("UserController ===> POST modify ===> start");

		log.info("params "+params);

		if(service.nickName(params)!=null) {
			log.info("UserController ====> 닉네임 사용불가");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("nick");
		}

		// 사용자가 입력한 "현재" 비밀번호
		String strFromInput = params.get("pwd");

		// 입력받은 id값을 바탕으로 db에서 유저 조회
		MemDto user = service.login(params);

		// 데이터베이스의 비밀번호
		String strFromDatabase = user.getPwd();

		// 비교하여 true 인 경우 사용자 입력 비밀번호가 데이터베이스에 암호화되어 저장된 비밀번호와 일치
		boolean passwordMatches = strFromInput.equals(strFromDatabase);

		log.info("@@# params => " + params);

		// 현재 비밀번호와 데이터베이스 조회 비밀번호가 일치하고
		if (passwordMatches) {

			//★=> 만약, 비밀번호 변경에 체크되었다면 => 새 비밀번호와 새 비밀번호 확인
			if ( params.get("pwdChanged").equals("true") ) {
				String password = params.get("newPassword");
				String password2 = params.get("newPassword2");

				// 새 비밀번호와 새 비밀번호 확인이 일치하고, 비밀번호 란이 공백이 아닌 경우
				if(password.equals(password2) && (!password.isEmpty())) {

					// params 값을 새 비번으로 바꿔치기
					params.replace("pwd", password);

					// 새로 설정한 닉네임과 비밀번호를 setter 로 세션 재설정
					service.modify(params);

					// 변경된 정보 세션에 반영하기
					MemDto modifiedUser = service.login(params);
					session.setAttribute("userDto", modifiedUser);

					log.info("UserController ===> POST modify ===> if");

					return ResponseEntity.status(HttpStatus.OK).body("success");
				} else {
					// 비밀번호 변경하기 체크는 했지만,   새 비밀번호와  새 비밀번호 확인을 서로 다르게 입력한 경우
					log.info("UserController ===> POST modify ===> else");
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail");
				}

				//★=> 만약, 비밀번호 변경에 체크가 안되었다면 ( 닉네임만 변경, 기존 비밀번호 사용한다는 뜻 )
			} else if ( params.get("pwdChanged").equals("false") ) {

				// 비밀번호는 DB에서 가져온 암호화된 기존 비밀번호 그대로 쓰도록 함
				params.replace("pwd", strFromDatabase);
				service.modify(params);

				// 변경된 정보 세션에 반영하기
				MemDto modifiedUser = service.login(params);
				session.setAttribute("userDto", modifiedUser);

				return ResponseEntity.status(HttpStatus.OK).body("success");
			}


		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("fail");
	}
}
