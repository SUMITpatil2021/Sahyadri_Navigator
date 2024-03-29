package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Login;
import com.example.demo.entities.Registration;

import jakarta.transaction.Transactional;

@Repository
@Transactional
public interface RegistrationRepository extends JpaRepository<Registration, Integer> {
	
}
