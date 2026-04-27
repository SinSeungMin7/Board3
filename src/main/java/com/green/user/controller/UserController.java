package com.green.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserController {

	    // /users/List
		@RequestMapping("/List")
		public String list() {
			
			return "users/list";
		}

}
