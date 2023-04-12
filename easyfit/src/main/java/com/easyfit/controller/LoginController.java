package com.easyfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
public class LoginController {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	
	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호를 잘못 입력했습니다.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
	}
	
	@GetMapping("/logout")
	public void logoutGet() {}
	@PostMapping("/logout")
	public void logoutPost() {}
	

	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("message", "접근 불가.");
	}
	
	@GetMapping("/adminPage")
	public void loginAdmin() {
	}
	
	@GetMapping("/trainerPage")
	public void loginTrainer() {
		
	}
	
	
	
}
	
	
	
