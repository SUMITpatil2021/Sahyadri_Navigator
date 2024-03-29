package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Login;

import jakarta.transaction.Transactional;

@Repository
@Transactional
public interface LoginRepository extends JpaRepository<Login, Integer> {

	@Query("select l from Login l where username like :uname and password like :passwd")
	public Login validateUser(String uname, String passwd); 
}
 