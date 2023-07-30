package com.cafmap.service;

import com.cafmap.dto.BoardDto;
import com.cafmap.dto.MyPlaceDto;
import com.cafmap.dto.PlaceDto;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

public interface PlaceService {
    public List<PlaceDto> placeList();
    public List<MyPlaceDto> myPlaceList(int userId);
//    public List<BoardDto> boardList(int boardId);
    public void boardWrite(@RequestParam HashMap<String, String> param);
    public void boardUpdate(@RequestParam HashMap<String, String> param);
    public void boardDelete(int boardId);
}
