package com.klu.project.HFMP.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.project.HFMP.model.Artisan;
import com.klu.project.HFMP.repository.ArtisanRepository;

@Service
public class ArtisanServiceImpl implements ArtisanService {
	
	@Autowired
	private ArtisanRepository artisanrepo;
	@Override
	public Artisan checkartisanlogin(String amail, String apwd) {
		
		return artisanrepo.checkartisanlogin(amail, apwd) ;
	}

	@Override
	public String ArtisanRegistration(Artisan a) {
		artisanrepo.save(a);
		
		return "Artisan Registered Sucessfully";
	}

}
