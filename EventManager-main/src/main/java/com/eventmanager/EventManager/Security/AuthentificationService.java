package com.eventmanager.EventManager.Security;

import org.springframework.stereotype.Service;

import com.eventmanager.EventManager.user.Member;
import com.eventmanager.EventManager.user.MemberRepository;

import jakarta.transaction.Transactional;

@Service
public class AuthentificationService {
	
	public boolean authenticateAdmin(String username,String password) {
		boolean isValidUsername= username.equalsIgnoreCase("admin");
		boolean isValidPassword = password.equalsIgnoreCase("abcd");
		
		return isValidUsername && isValidPassword;
	}

	private MemberRepository memberRepository;

    public AuthentificationService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @Transactional
    public boolean authenticateUser(String username, String password) {
        // Step 1: Find a member by username
        Member member = memberRepository.findByFirstname(username);

        // Step 2: Check if a member with the given username exists
        if (member == null) {
            return false; // User with this username doesn't exist
        }

        // Step 3: Compare the stored password with the provided password
        boolean passwordMatches = member.getPassword().equals(password);

        return passwordMatches;
    }
}
