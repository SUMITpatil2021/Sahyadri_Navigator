package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Login;
import com.example.demo.services.LoginServices;

@RestController
public class LoginController {
	
	@Autowired
    LoginServices lservice;

	@GetMapping("/login")
    public ResponseEntity<Login> login(@RequestParam("uname") String uname, @RequestParam("passwd") String passwd) {
		Login authenticatedUser = lservice.checkUser(uname, passwd);
		
        if (authenticatedUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
        // Return a 200 OK status with the authenticated user
        return ResponseEntity.ok(authenticatedUser);
    }

}
