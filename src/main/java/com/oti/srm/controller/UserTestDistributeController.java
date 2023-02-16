package com.oti.srm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oti.srm.dto.Member;
import com.oti.srm.dto.StatusHistory;
import com.oti.srm.service.IUserTestService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class UserTestDistributeController {
	@Autowired
	IUserTestService userTestService;

	// 고객테스트 단계(고객테스트 요청, 고객테스트 중)상세보기
	@GetMapping("/usertestdetail")
	public String userTestDetail(int rno, HttpSession session, Model model) {
		log.info("요청번호" + rno);
		// 요청정보
		model.addAttribute("request", userTestService.getRequest(rno));
		// Validation(내 담당건 맞는지)
		// 요청 처리정보
		model.addAttribute("requestProcess", userTestService.getRequestProcess(rno));
		List<StatusHistory> devToTesterHistories = userTestService.getDevToTesterHistories(rno);
		Member member = new Member();
		member.setMid("thddudgns79");
		member.setMname("송영훈");
		member.setMtype("pm");
		member.setOrgan("서울시청");
		member.setPosition("주임");
		session.setAttribute("userInfo", member);
		// 개발자 -> 테스터
		model.addAttribute("devToTesterHistories", devToTesterHistories);
		return "younghun/userTester";
	}

	@GetMapping("/distributedetail")
	public String distributeDetail(int rno, HttpSession session, Model model) {
		log.info("요청번호" + rno);
		// 요청정보
		model.addAttribute("request", userTestService.getRequest(rno));
		// Validation(내 담당건 맞는지)
		// 요청 처리정보
		model.addAttribute("requestProcess", userTestService.getRequestProcess(rno));
		List<StatusHistory> devToTesterHistories = userTestService.getDevToTesterHistories(rno);
		Member member = new Member();
		member.setMid("thddudgns79");
		member.setMname("송영훈");
		member.setMtype("pm");
		member.setOrgan("서울시청");
		member.setPosition("주임");
		session.setAttribute("userInfo", member);
		// 개발자 -> 테스터
		model.addAttribute("devToTesterHistories", devToTesterHistories);
		return "younghun/distributor";
	}

	// 작업 시작(고객테스터 / 배포자 공용)
	// => requests테이블(현재단계 최신화 + 완료예정일 기입) + status_histories테이블(단계 변경 이력 추가)
	@PostMapping("/startwork")
	public String startWork(StatusHistory statusHistory, Date expectDate, String mtype) {
		userTestService.startWork(statusHistory, expectDate, mtype);
		if(mtype.equals("userTester")) {
			return "redirect:/usertestdetail";
		}
		else {
			return "redirect:/distributedetail";
		}

	}

	// 작업 완료(고객테스터 / 배포자 공용)
	// => requests테이블(현재단계 최신화) + status_histories테이블(단계 변경 이력 추가) 
	// + status_histories_files테이블(단계 변경 이력에 첨부파일 등록)
	@PostMapping("/endwork")
	public String endWork(StatusHistory statusHistory, String mtype) {
		userTestService.endWork(statusHistory);
		if(mtype.equals("userTester")) {
			return "redirect:/usertestdetail";
		}
		else {
			return "redirect:/distributedetail";
		}
	}

}