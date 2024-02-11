package com.example.demo.entities;

import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="Login")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Login {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		int ID;
		
		int LOGIN_ID;
		
	    String username;
		
	    String password;
	    
	    int ROLL_ID;
}
