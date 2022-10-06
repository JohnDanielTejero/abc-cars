package com.abc.cars.pte.ltd.abccars.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailService {
    @Autowired
	private JavaMailSender emailSender;
    
    public void sendVerificationCode(String to, String subject, String content) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("noreply@abcportal.com");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(content);
		emailSender.send(message);
	}
    
}
