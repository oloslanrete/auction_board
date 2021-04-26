package handler.logon;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.main.CommandHandler;
@Controller
public class EmailConfirmCheckHandler implements CommandHandler {
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name="logondao")
	private Dao dao;
	private Random rand=new Random();
	private String code=new String();
	private Map<String, Object> map=new HashMap<String, Object>();
	@RequestMapping("emailConfirmCheck")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String email=request.getParameter("email");
		int result=dao.checkMember(email);
		map.put("result", result);
		if(result>0)
		{
			
			return new ModelAndView("logon/emailConfirmCheck","result", result);
		}
		else if(result==0)
		{
			code="";
			code+=rand.nextInt(10);
			code+=rand.nextInt(10);
			code+=rand.nextInt(10);
			code+=rand.nextInt(10);
			
			map.put("code", code);
			//send email contain code;
			 MimeMessage mailer = mailSender.createMimeMessage();
		        try {
		            MimeMessageHelper messageHelper = new MimeMessageHelper(mailer, true, "UTF-8");
		            messageHelper.setSubject("장물나라 인증번호");
		            messageHelper.setTo(email);
		            messageHelper.setFrom("khpmtest@gmail.com");
		            messageHelper.setText("인증번호 : " + code);
		            mailSender.send(mailer);
		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }    
			
			return new ModelAndView("logon/emailConfirmCheck",map);
		}
		return new ModelAndView("default");
	}

}
