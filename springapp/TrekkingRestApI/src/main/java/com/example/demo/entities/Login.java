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
		int LOGIN_ID;
//		int ID;
		
		
		@Column
	    String username;
		@Column
	    String password;
		@Column
	    int ROLL_ID;
}
