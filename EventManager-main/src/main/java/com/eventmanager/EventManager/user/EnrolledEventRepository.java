package com.eventmanager.EventManager.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EnrolledEventRepository extends JpaRepository<EnrolledEvent, Integer> {
	public EnrolledEvent findByTaskName(String taskName);
	public List<EnrolledEvent> findByMemberName(String memberName);
}
