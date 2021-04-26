package handler.logon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.main.CommandHandler;
@Controller
public class CashHandler implements CommandHandler {
	@RequestMapping("/cash")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		return new ModelAndView("logon/cash");
	}
}
