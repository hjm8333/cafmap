package com.cafmap.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PlaceDto {
    private int placeId;
    private double widthCoordinate;
    private double heightCoordinate;
    private String address;
    private String jibunAddress;
    private double avgScore;
    private String category;
    private String name;
    private String placeInfo;
    private String imgPath;
    private String homepage;
    private int countReview;

    private List<BoardDto> boardDtoList;
}