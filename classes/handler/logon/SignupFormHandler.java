package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.main.CommandHandler;
@Controller
public class SignupFormHandler implements CommandHandler {
	@RequestMapping("/signupForm")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email=(String) request.getParameter("email");
		if(email==null || email.equals(""))
		{
			return new ModelAndView("default");
			
			//				|
			//for test code v
			//request.setAttribute("email", "asd");
			//return new ModelAndView("logon/signupForm"); 
		}
		else
		{
			request.setAttribute("email", email);
			return new ModelAndView("logon/signupForm");
		}
	}
}
