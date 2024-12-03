package com.klu.project.HFMP.service;

import com.klu.project.HFMP.model.Artisan;

public interface ArtisanService {

	public Artisan checkartisanlogin(String amail,String apwd);
	public String ArtisanRegistration(Artisan a);
}
