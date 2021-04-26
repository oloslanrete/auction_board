package handler.logon;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.Dao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.main.CommandHandler;
@Controller
public class LoginProHandler implements CommandHandler {
	@Resource(name="logondao")
	Dao dao;
	@RequestMapping("/loginPro")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");	
		
		int result = dao.check(email, passwd);
		
		if(result==1){
			request.getSession().setAttribute("memId", email);
		}
		return new ModelAndView("logon/loginPro", "result", result);
	}
}
