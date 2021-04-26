package handler.logon;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.Dao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.main.CommandHandler;
@Controller
public class CashProHandler implements CommandHandler {
	@Resource(name="logondao")
	Dao dao;
	
	@RequestMapping("/cashPro")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int result = 0;
		String email = request.getParameter("email");
		String type = request.getParameter("cash_type");		
		
		
		System.out.println("타입 : " + type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email",email);
		
		if(type.equals("1")||type==null){ // 셀렉트 값 돈
			int select = Integer.parseInt(request.getParameter("cash_select"));
			map.put("gold",select);
			result = dao.inputGold(map);
			return new ModelAndView("logon/cashPro", "result",result);
		}else{	// 직접 입력 값 돈
			int gold = Integer.parseInt(request.getParameter("cash_money"));
			map.put("gold", gold);
			result = dao.inputGold(map);
			return new ModelAndView("logon/cashPro", "result",result);
		}
	}
}