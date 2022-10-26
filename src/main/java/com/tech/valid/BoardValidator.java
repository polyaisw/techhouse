package com.tech.valid;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tech.vo.BoardVO;

public class BoardValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		//이 validator가 제공된 Class의 인스턴스 clazz를 유효성 검사를 할 수 있는지 여부판단
		System.out.println("supports("+clazz.getName()+")");
		return BoardVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		//주어진 객체에 대한 유효성 검사를 하고
		//유효성 검사에 대해 오류가 있는 경우, 주어진 객체에 이 오류들을 errors에 등록한다.
		
		//1번 방법
		/*
		 * System.out.println("validate()"); BoardVO vo = (BoardVO)target; //유효성검사 받는
		 * 객체를 사용하기위해 다운캐스팅을 하였음
		 * 
		 * String b_text = vo.getB_text(); if(b_text == null || b_text.trim().isEmpty())
		 * { //해당 텍스트에 문자열이 ""이거나, 아예 입력이 안됐을 경우 errors.rejectValue("b_text",
		 * "emptyB_text");//에러로 등록 }
		 */
		
		//2번 방법
		// *단순히 빈 폼 데이터를 처리할 때는 다음과 같이 사용할 수 있다.
		// ValidationUtils?
		// 두번째 매개변수는 반드시 target클래스의 필드명과 같아야한다
		// Errors에 등록될 때도 동일한 필드명으로 등록된다.
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "b_text", "emptyB_text");	//오류 시 에러를등록,필드명,오류이름
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "b_title", "emptyB_title");
	}

}
