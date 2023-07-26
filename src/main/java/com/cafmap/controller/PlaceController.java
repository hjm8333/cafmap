package com.cafmap.controller;

import com.cafmap.dto.PlaceDto;
import com.cafmap.service.PlaceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
