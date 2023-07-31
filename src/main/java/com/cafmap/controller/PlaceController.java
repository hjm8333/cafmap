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

import javax.servlet.http.HttpSession;
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

}