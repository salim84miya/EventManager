package com.eventmanager.EventManager.user;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;


/**
 * 
 */
@Entity
public class Member {
	
    public Member(int id, String firstname, String lastname, String skill, int age, String password) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.skill = skill;
        this.age = age;
        this.password = password;
    }

    public Member() {

    }

    @Id
    @GeneratedValue
    private int id;

    @NotBlank(message = "Firstname is required.")
    @Size(min = 2, message = "Firstname must be at least 2 characters.")
    @Column(unique = true) // Unique constraint at the database level
    private String firstname;

    @NotBlank(message = "Lastname is required.")
    @Size(min = 2, message = "Lastname must be at least 2 characters.")
    private String lastname;

    private String skill;

    @Min(value = 14, message = "Age must be 14 or older.")
    private int age;

    @NotBlank(message = "Password is required.")
    @Size(min = 2, message = "Password must be at least 2 characters.")
    private String password;
    

    // Getters and setters

    @Override
    public String toString() {
        return "Member [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", skill=" + skill + ", age="
                + age + ", password=" + password + "]";
    }
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getSkill() {
		return skill;
	}


	public void setSkill(String skill) {
		this.skill = skill;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	
}
