package com.oti.srm.service.srm;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.srm.dao.srm.IRequestDao;
import com.oti.srm.dto.Pager;
import com.oti.srm.dto.Request;
import com.oti.srm.dto.SelectPM;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RequestRegisterServiceImpl implements IRequestRegisterService {
	
	@Autowired
	private IRequestDao requestDao;
	
	
	@Override
	public int writeRequest(Request request) {
	log.info("가입 실행");
	System.out.println(request.toString());
	try {
		int rows = requestDao.insertRequest(request);
		return REQUEST_SUCCESS;
	} catch(Exception e) {
		log.error(e.toString());
		return REQUEST_FAIL;
	}
	}

	@Override
	public List<Request> getRequestList(Request request, Pager pager) {
		List<Request> requestList = requestDao.getRequestList();
		return requestList;
	}

	@Override
	public int getPresentStep(int rno) {
		int result = requestDao.getPresentStep(rno);
		log.info("서비스" + result);
		return result;
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// PM 조회
	
	@Override
	public int getPmTotalRows() {
		int rows = requestDao.countPm();
		return rows;
	}
	
	@Override
	public List<SelectPM> getPmRequestList(Request request, Pager pager) {
		request.setStartRowNo(pager.getStartRowIndex());
		request.setEndRowNo(pager.getEndPageNo());
		List<SelectPM> result = requestDao.selectAll(request);
	
				
		return result;
	}

	
	
	
	

}
