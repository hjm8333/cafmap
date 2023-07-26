package com.cafmap.dao;

import com.cafmap.dto.PlaceDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlaceDao {
    public List<PlaceDto> placeList();
}
