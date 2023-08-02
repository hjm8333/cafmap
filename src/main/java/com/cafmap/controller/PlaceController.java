package com.cafmap.controller;

import com.cafmap.dto.MemDto;
import com.cafmap.dto.MyPlaceDto;
import com.cafmap.dto.PlaceDto;
import com.cafmap.service.PlaceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;

@Controller
@Slf4j
public class PlaceController {

    @Autowired
    private PlaceService service;

    @RequestMapping("/home")
    public String home(Model model) {

        log.info("@# home");

        List<PlaceDto> list = service.placeList();
        log.info(""+list);
        model.addAttribute("list", list);

        return "home";
    }
    @RequestMapping("/myMap")
    public String myMap(Model model, HttpSession session) {

        log.info("@# myMap");

        MemDto userDto = (MemDto) session.getAttribute("userDto");
        if(userDto != null) {
            List<MyPlaceDto> list = service.myPlaceList(userDto.getUserId());
            log.info(""+list);
            model.addAttribute("list", list);
            return "myMap";
        }else {
            return "login";
        }
    }

    @RequestMapping("/boardWrite")
    public ResponseEntity<Integer> boardWrite(@RequestParam HashMap<String, String> param, HttpSession session) {

        param.replace("placeScore",String.valueOf(Double.parseDouble(param.get("placeScore"))/2));
        MemDto userDto = (MemDto) session.getAttribute("userDto");
        log.info("@# boardWrite"+param);

        if(userDto != null) {
            param.put("userId", String.valueOf(userDto.getUserId()));
            service.boardWrite(param);
            return ResponseEntity.status(HttpStatus.OK).body(200);
        }else {
            return ResponseEntity.status(HttpStatus.OK).body(400);
        }
    }

    @RequestMapping("/boardDelete")
    public ResponseEntity<Integer> boardDelete(@RequestParam int boardId) {
        log.info("@# boardDelete "+boardId);
        try {
            service.boardDelete(boardId);
            return ResponseEntity.status(HttpStatus.OK).body(200);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.OK).body(400);
        }
    }

    @RequestMapping("/writePlace")
    public ResponseEntity<Integer> uploadProfile(@RequestParam HashMap<String, String> params, MultipartFile[] uploadFile, HttpSession session) {
        log.info("PlaceController ===> writePlace ===> start");

        log.info("uploadFile ===> "+uploadFile);
        service.writePlace(params, uploadFile, session);

        MemDto user = (MemDto) session.getAttribute("userDto");

        // 기존 이미지가 존재한다면, 해당 파일을 찾아서 삭제한다
        if ( user.getImgPath() != null ) {
            File deleteFile = new File(user.getImgPath()); // 삭제할 파일의 위치로 이동해서
            if ( deleteFile.exists() == true ) { deleteFile.delete();	} // 삭제할 파일이 존재한다면 삭-제
        }

        return ResponseEntity.ok().body(200);
    }
}