package handler.logon;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.Dao;
import logon.LogonDataBean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.main.CommandHandler;
@Controller
public class MyInfoHandler implements CommandHandler {
	@Resource(name="logondao")
	Dao dao;
	@RequestMapping("/myInfo")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email=(String)request.getSession().getAttribute("memId");
		if(email==null || email.equals(""))
		{
			return new ModelAndView("default");
		}
		else
		{
			LogonDataBean dto=dao.getMember( email );
			return new ModelAndView("logon/myInfo", "dto", dto);
		}
	}
}
