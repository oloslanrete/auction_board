package handler.auctionboard;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.main.CommandHandler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import auctionboard.Dao;


@Controller
public class BiddingHandler implements CommandHandler {
	@Resource(name="auctiondao")
	Dao dao;
	@RequestMapping("/bidding")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int bidprice = 0;
		int itemnum = Integer.parseInt(request.getParameter( "itemnum" ));
		bidprice=Integer.parseInt(request.getParameter( "startprice" ));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("itemnum", itemnum);
		map.put("bidprice", bidprice);
		map.put("email", (String)request.getSession().getAttribute("memId"));
		System.out.println(map.get("itemnum"));
		System.out.println(map.get("bidprice"));
		System.out.println(map.get("email"));
		dao.bidding(map);
		
		return new ModelAndView("auctionboard/bidding","startprice",bidprice);
	}
}
