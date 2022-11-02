package com.tech.service;

import java.util.Random;

import com.tech.common.Naver_Sens_V2;

public class MemberService {
	
	public static String sendRandomMessage(String tel) {
	    Naver_Sens_V2 message = new Naver_Sens_V2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    message.send_msg(tel, numStr);

	    return numStr;
	}

	public static int memberTelCount(String tel) {
		// 가입된 전화번호 확인
		return 0;
	}


}
