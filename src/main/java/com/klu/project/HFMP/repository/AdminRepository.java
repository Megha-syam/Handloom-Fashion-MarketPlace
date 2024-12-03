package com.klu.project.HFMP.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klu.project.HFMP.model.Admin;

public interface AdminRepository  extends JpaRepository<Admin, String>{
	
	@Query("select a from Admin a where a.username=?1 and a.password=?2")
	public Admin checkadminlogin(String username,String pwd);
	
	

}
