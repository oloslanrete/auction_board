package handler.logon;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import auctionboard.AuctionDataBean;
import handler.main.CommandHandler;
@Controller
public class AjaxGetOtherValueHandler implements CommandHandler {
	@Resource(name="auctiondao")
	auctionboard.Dao auctiondao;
	@Resource(name="logondao")
	logon.Dao logondao;
	
	@RequestMapping("getOtherValue")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if(request.getParameter("itemnum")==null || request.getParameter("itemnum").equals(""))
		{
			return new ModelAndView("AjaxOtherValue","result","   ");
		}
		int itemnum=Integer.parseInt(request.getParameter("itemnum"));
		AuctionDataBean aucdto = new AuctionDataBean();
		aucdto=auctiondao.getAuction(itemnum);
		String kingBidder=logondao.getMaxbidder(itemnum);
		String result=kingBidder+" "+aucdto.getStartprice()+" "+aucdto.getCount()+" "+aucdto.getBidCount();
		return new ModelAndView("logon/AjaxOtherValue", "result", result);
	}

}
