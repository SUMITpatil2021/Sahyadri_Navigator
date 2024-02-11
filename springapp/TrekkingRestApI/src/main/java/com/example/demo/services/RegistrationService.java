package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Registration;
import com.example.demo.repositories.LoginRepository;
import com.example.demo.repositories.RegistrationRepository;

@Service
public class RegistrationService {
		@Autowired
	    RegistrationRepository regirepo;
		
		public Registration saveUser(Registration user) {
	        return regirepo.save(user);
	    }
}
