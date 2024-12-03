package com.klu.project.HFMP.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.project.HFMP.model.Admin;
import com.klu.project.HFMP.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminRepo;
	@Override
	public Admin checkadminlogin(String username, String pwd) {
		return adminRepo.checkadminlogin(username, pwd);
	}

}
