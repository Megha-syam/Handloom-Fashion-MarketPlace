package com.klu.project.HFMP.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.klu.project.HFMP.model.Admin;
import com.klu.project.HFMP.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@RestController

public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");
		Admin admin = adminService.checkadminlogin(auname, apwd);
		if(admin!=null)
		{
			
			mv.setViewName("admin");
		}
		else
		{
//			return "Admin Login Fail";
			mv.setViewName("adminloginfail");
			mv.addObject("message","Login Failed");
		}
		return mv;
	}
	

	
	
}
