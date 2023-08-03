package com.cafmap.service;

import com.cafmap.dto.BoardDto;
import com.cafmap.dto.MyPlaceDto;
import com.cafmap.dto.PlaceDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

public interface PlaceService {
    public List<PlaceDto> placeList();
    public List<MyPlaceDto> myPlaceList(int userId);
//    public List<BoardDto> boardList(int boardId);
    public void boardWrite(@RequestParam HashMap<String, String> param);
    public void boardUpdate(@RequestParam HashMap<String, String> param);
    public void boardDelete(int boardId);
    public void writePlace(@RequestParam HashMap<String, String> params, MultipartFile[] uploadFile, HttpSession session);
    public int lastMyPlaceId(int userId);
    public void placeDelete(int placeId);
}
