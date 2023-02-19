package com.oti.srm.service.member;

import com.oti.srm.dto.Member;

public interface IUserRegisterService {
	public enum RegisterResult {
		SUCCESS, FAIL;
	}

	public static final int REGISTER_SUCCESS = 0;
	public static final int REGISTER_FAIL = 1;

	public int register(Member member);
	public int registerWithFile(Member member);
	
}
