package com.cafmap.service;

import com.cafmap.Utils;
import com.cafmap.dao.MemDao;
import com.cafmap.dao.PlaceDao;
import com.cafmap.dto.BoardDto;
import com.cafmap.dto.MemDto;
import com.cafmap.dto.MyPlaceDto;
import com.cafmap.dto.PlaceDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
public class PlaceServiceImpl implements PlaceService{

    @Autowired
    PlaceDao dao;

    @Autowired
    MemDao memDao;

    @Autowired
    Utils utils;

    @Override
    public List<PlaceDto> placeList() {
        List<PlaceDto> list = dao.placeList();
        for (int i = 0; i < list.size(); i++) {
            String category = list.get(i).getCategory();
            StringBuilder tag = new StringBuilder();
            if(category.charAt(8) == '1') tag.append("#스페셜티 ");
            if(category.charAt(7) == '1') tag.append("#자가배전 ");
            if(category.charAt(6) == '1') tag.append("#약배전 ");
            if(category.charAt(5) == '1') tag.append("#강배전 ");
            if(category.charAt(4) == '1') tag.append("#베이커리 ");
            if(category.charAt(3) == '1') tag.append("#앤틱 ");
            if(category.charAt(2) == '1') tag.append("#모던 ");
            if(category.charAt(1) == '1') tag.append("#힙 ");
            if(tag.toString().equals("100000000")) tag.append("카페");
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
            if(category.charAt(8) == '1') tag.append("#스페셜티 ");
            if(category.charAt(7) == '1') tag.append("#자가배전 ");
            if(category.charAt(6) == '1') tag.append("#약배전 ");
            if(category.charAt(5) == '1') tag.append("#강배전 ");
            if(category.charAt(4) == '1') tag.append("#베이커리 ");
            if(category.charAt(3) == '1') tag.append("#앤틱 ");
            if(category.charAt(2) == '1') tag.append("#모던 ");
            if(category.charAt(1) == '1') tag.append("#힙 ");
            if(tag.toString().equals("100000000")) tag.append("카페");
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

    @Override
    public void writePlace(HashMap<String, String> params, MultipartFile[] uploadFile, HttpSession session) {
        log.info("PlaceService ===> write ===> start");

        log.info("서비스까지 왔노");

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
        dao.writePlace(params);

        log.info("UserService ===> write ===> end");
    }
}
