package handler.email;
import handler.main.CommandHandler;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 

@Controller
public class emailProHandler implements CommandHandler {

    @Autowired
    private JavaMailSenderImpl mailSender;
     
    @RequestMapping( "/emailPro" )
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
    	request.setCharacterEncoding("UTF-8");
        String recipientAddress = request.getParameter("recipient");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
         
        // prints debug info
        System.out.println("From: " + recipientAddress);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
        
        MimeMessage email = mailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(email, true, "UTF-8");
            messageHelper.setSubject(subject);
            messageHelper.setTo("khpmtest@gmail.com");
            messageHelper.setFrom(recipientAddress);
            messageHelper.setText("인증번호 : "+recipientAddress+"\n"+message);
            mailSender.send(email);
        } catch (MessagingException e) {
            e.printStackTrace();
        }    
        // sends the e-mail

        
        // forwards to the view named "Result"
        return new ModelAndView( "email/emailPro");
	}
}