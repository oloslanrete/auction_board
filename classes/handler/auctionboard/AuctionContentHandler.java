package handler.auctionboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import auctionboard.AuctionDataBean;
import auctionboard.AuctionImageBean;
import auctionboard.Dao;
import handler.main.CommandHandler;

@Controller
public class AuctionContentHandler implements CommandHandler{
	@Resource(name="auctiondao")
	Dao dao;
	@RequestMapping("/auctionContent")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int itemnum = Integer.parseInt(request.getParameter("itemnum"));
		
		AuctionDataBean dto = dao.getAuction(itemnum);
		List<AuctionImageBean> images = dao.getImage(itemnum);
		if(!dto.getWriter().equals(request.getSession().getAttribute("memId"))){
			dao.countPlus(itemnum);
			dto = dao.getAuction(itemnum);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemnum", itemnum);
		map.put("email", request.getSession().getAttribute("memId"));
		int mybidprice = dao.getBid(map);
		request.setAttribute("mybidprice", mybidprice);
		request.setAttribute("images", images);
		request.setAttribute("dto", dto);
		return new ModelAndView("auctionboard/auctionContent");
	}
}
