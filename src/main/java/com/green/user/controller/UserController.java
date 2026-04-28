package com.green.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.user.dto.UserDto;
import com.green.user.mapper.UserMapper;


@Controller
@RequestMapping("/Users")
public class UserController {

	@Autowired // 스프링이 미리 만들어둔 UserMapper 객체를 자동으로 연걸 해줌 
	private UserMapper userMapper; // 전역변수로 만듦
	
	// 새 글 쓰기
	// /Users/WriteForm
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm() { // 값을 넘겨줄때 ModelAndView 사용
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/write");
		mv.addObject("msg", "승민이");
		
		return mv;
	}
	
	// /Users/Write
	@RequestMapping("/Write")
	public ModelAndView wirte( UserDto userDto){
		
		System.out.println( "UserController write() userDto" + userDto); // 뭐가 넘어왓는지 확인용
		// 넘어온 data 로 db 에 저장
		userMapper.insertUser( userDto );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		
		return mv;
	}
	
	// db 에서 사용자 목록을 조회
	// /Users/List
	@RequestMapping("/List")
	public ModelAndView list() {
		
		List<UserDto> userList = userMapper.getUserList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/list");
		mv.addObject( "userList", userList );
		
		return mv;
	}
	

	// /Users/Delete 
	@RequestMapping("/Delete")
	public ModelAndView delete(UserDto userDto) {
		
		// 넘겨받은 자료를 출력
		System.out.println( "userDto2: " + userDto);
		
		//db 의 자료를 삭제
		userMapper.deleteUser(userDto);
		
		// 목록으로 이동
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		
		return mv;
	}
	
	// 수정
	// /Users/Update
	
}