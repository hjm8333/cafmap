package com.cafmap.service;

import com.cafmap.dao.MemDao;
import com.cafmap.dao.PlaceDao;
import com.cafmap.dto.BoardDto;
import com.cafmap.dto.MyPlaceDto;
import com.cafmap.dto.PlaceDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class PlaceServiceImpl implements PlaceService{

    @Autowired
    PlaceDao dao;

    @Autowired
    MemDao memDao;

    @Override
    public List<PlaceDto> placeList() {
        List<PlaceDto> list = dao.placeList();
        for (int i = 0; i < list.size(); i++) {
            String category = list.get(i).getCategory();
            StringBuilder tag = new StringBuilder();
            if(category.charAt(0) == '1') tag.append("#스페셜티 ");
            if(category.charAt(1) == '1') tag.append("#자가배전 ");
            if(category.charAt(2) == '1') tag.append("#약배전 ");
            if(category.charAt(3) == '1') tag.append("#강배전 ");
            if(category.charAt(4) == '1') tag.append("#디저트 ");
            if(category.charAt(5) == '1') tag.append("#앤틱 ");
            if(category.charAt(6) == '1') tag.append("#모던 ");
            if(category.charAt(7) == '1') tag.append("#힙 ");
            if(tag.toString().equals("")) tag.append("카페");
            list.get(i).setCategory(tag.toString());

            double avgScore = 0;

            List<BoardDto> boardDtoList = dao.boardList(list.get(i).getPlaceId());
            for (int j = 0; j < boardDtoList.size(); j++) {
                boardDtoList.get(j).setMemDto(memDao.selectUser(boardDtoList.get(j).getUserId()));
                avgScore += boardDtoList.get(j).getPlaceScore();
            }
            avgScore = Math.round((avgScore/boardDtoList.size())*10)/10.0;
            list.get(i).setAvgScore(avgScore);
            list.get(i).setCountReview(boardDtoList.size());
            list.get(i).setBoardDtoList(boardDtoList);
        }
        return list;
    }

    @Override
    public List<MyPlaceDto> myPlaceList(int userId) {
        List<MyPlaceDto> list = dao.myPlaceList(userId);
        for (int i = 0; i < list.size(); i++) {
            String category = list.get(i).getCategory();
            StringBuilder tag = new StringBuilder();
            if(category.charAt(0) == '1') tag.append("#스페셜티 ");
            if(category.charAt(1) == '1') tag.append("#자가배전 ");
            if(category.charAt(2) == '1') tag.append("#약배전 ");
            if(category.charAt(3) == '1') tag.append("#강배전 ");
            if(category.charAt(4) == '1') tag.append("#디저트 ");
            if(category.charAt(5) == '1') tag.append("#앤틱 ");
            if(category.charAt(6) == '1') tag.append("#모던 ");
            if(category.charAt(7) == '1') tag.append("#힙 ");
            if(tag.toString().equals("")) tag.append("카페");
            list.get(i).setCategory(tag.toString());
        }
        return list;
    }

//    @Override
//    public List<BoardDto> boardList(int boardId) {
//        return null;
//    }

    @Override
    public void boardWrite(HashMap<String, String> param) {
        dao.boardWrite(param);
    }

    @Override
    public void boardUpdate(HashMap<String, String> param) {
        dao.boardUpdate(param);
    }

    @Override
    public void boardDelete(int boardId) {
        dao.boardDelete(boardId);
    }
}
