package com.example.demo.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter; 

@Entity
@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
@Table(name="user_registration")
public class Registration {
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    int USER_ID;
	    
	    @Column
	    String NAME;
	    @Column
	    String EMAILID;
	    @Column
	    String CONTACT;
	    @Column
	    String USERNAME;
	    @Column
	    String PASSWORD;
	    @Column
	    int ROLL_ID;
	    
		@Override
		public String toString() {
			return "Registration [USER_ID=" + USER_ID + ", NAME=" + NAME + ", EMAILID=" + EMAILID + ", CONTACT="
					+ CONTACT + ", USERNAME=" + USERNAME + ", PASSWORD=" + PASSWORD + ", ROLL_ID=" + ROLL_ID + "]";
		} 
	 
}
