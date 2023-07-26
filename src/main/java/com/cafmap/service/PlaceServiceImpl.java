package com.cafmap.service;

import com.cafmap.dao.PlaceDao;
import com.cafmap.dto.PlaceDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceServiceImpl implements PlaceService{

    @Autowired
    PlaceDao dao;

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
        }
        return list;
    }
}
