package com.oti.srm.dto;

import java.util.Date;

import lombok.Data;
@Data
public class ListFilter{
	private String reqType;
	private String dateFirst;
	private String dateLast;
	private int sno;
	private int statusNo;
	
	
	private String dateValue;
	private String statusValue;
	
	
	//날짜 변환
	private Date date_first;
	private Date date_last;
	
}
