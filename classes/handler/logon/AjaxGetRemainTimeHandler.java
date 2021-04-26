package handler.logon;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import auctionboard.AuctionDataBean;
import auctionboard.Dao;
import handler.main.CommandHandler;
@Controller
public class AjaxGetRemainTimeHandler implements CommandHandler {
	@Resource(name="auctiondao")
	Dao dao;
	@RequestMapping("getRemainTime")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int itemnum=Integer.parseInt(request.getParameter("itemnum"));
		//System.out.println("helljax");
		AuctionDataBean dto=dao.getAuction(itemnum);
		Timestamp end = dto.getEndDate();
		Timestamp now = new Timestamp(System.currentTimeMillis());
		int remainTime=(int)((end.getTime()/1000)-(now.getTime()/1000));
		return new ModelAndView("logon/AjaxRemainTime", "result", remainTime);
	}

}
