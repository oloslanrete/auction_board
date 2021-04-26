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
public class ModifyMemberProHandler implements CommandHandler {
	@Resource(name="logondao")
	Dao dao;
	@RequestMapping("/myInfoPro")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String email=(String)request.getSession().getAttribute("memId");
		System.out.println("이메일" + email);
		if(email==null || email.equals(""))
		{
			return new ModelAndView("default");
		}
		else
		{
			LogonDataBean dto=new LogonDataBean();
			dto.setEmail( email );
			dto.setAddress(request.getParameter("my_address"));
			dto.setHp(request.getParameter("my_hp1")+"-"+request.getParameter("my_hp2")+"-"+request.getParameter("my_hp3"));
			dto.setPasswd(request.getParameter("my_passwd"));
			dto.setZipcode(request.getParameter("my_zip1")+"-"+request.getParameter("my_zip2"));
			
			int result=dao.updateMember(dto);
			request.getSession().removeAttribute("memId");
			return new ModelAndView("main/main","result", result);
		}
	}
}
