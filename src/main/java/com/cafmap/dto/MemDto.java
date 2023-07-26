package com.cafmap.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemDto {
	private int userId;
	private String id;
	private String pwd;
	private String nickname;
	private String tel;
	private String imgPath;
}
