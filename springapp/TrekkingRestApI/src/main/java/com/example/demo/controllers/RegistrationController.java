package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Registration;
import com.example.demo.services.RegistrationService;

@RestController
public class RegistrationController {
	@Autowired
    RegistrationService regiService;

    @PostMapping("/register")
    public ResponseEntity<Registration> saveUser(@RequestBody Registration user) {
    	System.out.println(user);
    	Registration savedUser = regiService.saveUser(user);
        return ResponseEntity.ok(savedUser);
    }
}
