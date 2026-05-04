package com.green.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		mv.setViewName("redirect:/Users/List"); // 작업을 마치고 어떤화면으로 이동할지
		
		return mv;
	}
	
	// 수정 폼 요청 : 수정 버튼 클릭시 기존 데이터를 가지고 수정페이지로 이동합니다
	// /Users/UpdateForm
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(UserDto userDto) {
		// 넘어온 userDto 정보
		System.out.println( "넘어온 userDto : " + userDto );
		
		// 수정을 위해 db에서 조회한 정보
		UserDto user = userMapper.getUser(userDto);
		// 조회된 정보
		System.out.println( "조회된 userDto : " + user );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/update");
		mv.addObject("user", user);
		return mv;
	}
	
	// 수정 받기
	// /Users/Update
	// 아이디 패스워드등 다 들어있는 함수 가 userDto이다
	@RequestMapping("/Update")
	public ModelAndView update(UserDto userDto) {
		
		userMapper.updateUser( userDto );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
	}
	
	// 아이디 중복확인 - 결과문자열을 리턴 :
	// <b class = "green">사용가능한 아이디입니다</b>
	// <b class = "red">사용가능할 수 없는 아이디입니다</b>
	// /Users/IdDupCheck2?userid=sky
	@GetMapping("/IdDupCheck2")
	@ResponseBody //return 되는 글자는 jsp가 아니다
	public UserDto idDupCheck2( UserDto userDto ) {
		
		String userid    = userDto.getUserid();  // 넘어온 userid
		UserDto user = userMapper.getIdDupCheck(userDto);  // 조회한 userid
		
		if(user == null)
			user = new UserDto();
		
		return user;
	}
	
}













































