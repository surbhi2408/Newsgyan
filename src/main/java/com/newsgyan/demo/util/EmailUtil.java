package com.newsgyan.demo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.internet.MimeMessage;

@Component
public class EmailUtil {
    @Autowired
    JavaMailSender sender;

    public void sendEmail(String email,int code)
    {
        MimeMessage message = sender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message);
            helper.setTo(email);
            helper.setSubject("six digit code for your id");
            helper.setText(code+"");
            sender.send(message);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
