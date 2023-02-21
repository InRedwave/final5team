package com.oti.srm.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.srm.dao.notice.INoticeDao;
import com.oti.srm.dto.Notice;
import com.oti.srm.dto.NoticeFile;
import com.oti.srm.dto.Pager;
import com.oti.srm.dto.System;

@Service
public class NoticeService implements INoticeService {
	@Autowired
	INoticeDao noticeDao;

	@Override
	public List<Notice> getNoticeList(String searchType, String searchWord, String mtype, Pager pager, int sno) {
		return noticeDao.selectNoticeList(searchType, searchWord, mtype, sno, pager);
	}

	@Override
	public int getNoticeListCount(String searchType, String searchWord, String mtype, int sno) {
		return noticeDao.selectNoticeListCount(searchType, searchWord, mtype, sno);
	}

	@Override
	@Transactional
	public Notice getNotice(int nno) {
		Notice notice = noticeDao.selectNotice(nno);
		notice.setFileList(noticeDao.selectNoticeFiles(nno));
		return notice;
	}

	@Override
	public List<System> getSystemList() {
		return noticeDao.selectSystemList();
	}

	@Override
	@Transactional
	public void noticeWrite(Notice notice) {
		noticeDao.insertNotice(notice);
		for(NoticeFile noticeFile : notice.getFileList()) {
			noticeFile.setNno(notice.getNno());
			noticeDao.insertNoticeFile(noticeFile);
		}
	}

}