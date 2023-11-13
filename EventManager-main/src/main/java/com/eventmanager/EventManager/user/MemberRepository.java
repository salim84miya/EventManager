package com.eventmanager.EventManager.user;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	public Member findByFirstname(String firstname);

}
