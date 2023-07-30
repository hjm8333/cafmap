package com.cafmap.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardDto {
    private int boardId;
    private String content;
    private Timestamp created;
    private int userId;
    private int placeId;
    private MemDto memDto;
    private double placeScore;
}