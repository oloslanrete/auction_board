package handler.logon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.Dao;
import logon.MyAuctionDataBean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import auctionboard.AuctionDataBean;
import handler.main.CommandHandler;
@Controller
public class MyAuctionListHandler implements CommandHandler {
	@Resource(name="logondao")
	Dao dao;
	
	@RequestMapping("/myAuctionList")
	@Override
	public ModelAndView process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String email=(String)request.getSession().getAttribute("memId");
		//System.out.println(email);
		if(email==null || email.equals(""))
		{
			return new ModelAndView("default");
		}
		else
		{
			int count = 0;
			String pageNum = null;
			int currentPage = 0;
			int start = 0;
			int end = 0;
			int number = 0;
			int pageCount = 0;
			int startPage = 0;
			int endPage = 0;
			
			int pageSize = 5;
			int pageBlock = 10;
			
			String mode=request.getParameter("mode");
			if(mode==null || mode.equals("") || mode.equals("sell"))
			{
				count=dao.getMyAuctionCount(email);
				pageNum=request.getParameter("pageNum");
				if(pageNum==null || pageNum.equals(""))
				{
					pageNum="1";
				}
				try{
				currentPage=Integer.parseInt(pageNum);
				}catch(NumberFormatException e)
				{
					return new ModelAndView("default");
				}
				start=(currentPage-1)*pageSize+1;
				end=start+pageSize-1;
				number=count-(currentPage-1)*pageSize;
				if(count > 0)
				{
					pageCount=(count/pageSize)+(count%pageSize>0? 1:0);
					if(currentPage>pageCount)
					{
						currentPage=pageCount;
					}
					startPage=(currentPage/pageBlock)*pageBlock+1;
					if(currentPage%pageBlock==0)
					{
						startPage-=pageBlock;
					}
					endPage=startPage+pageBlock-1;
					if(endPage>pageCount) endPage=pageCount;
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("start", start);
					map.put("end", end);
					map.put("email", email);
					List<AuctionDataBean> myAuctions=dao.getMyAuctions(map);
					request.setAttribute("myAuctions", myAuctions);
					System.out.println("list:"+myAuctions.size());
				}
				Map<String, Object> model=new HashMap<String, Object>();
				model.put("count", count);
				model.put("pageNum", pageNum);
				model.put("currentPage", currentPage);
				model.put("number", number);
				model.put("pageCount", pageCount);
				model.put("startPage", startPage);
				model.put("endPage", endPage);
				model.put("pageBlock", pageBlock);
				model.put("pageSize", pageSize);
				
				return new ModelAndView("logon/myAuctionList", model);
			}
			else if(mode.equals("bid"))	//mode=="bid"
			{
				count=dao.getMyBidCount(email);
				pageNum=request.getParameter("pageNum");
				if(pageNum==null || pageNum.equals(""))
				{
					pageNum="1";
				}
				try{
				currentPage=Integer.parseInt(pageNum);
				}catch(NumberFormatException e)
				{
					return new ModelAndView("default");
				}
				start=(currentPage-1)*pageSize+1;
				end=start+pageSize-1;
				number=count-(currentPage-1)*pageSize;
				if(count > 0)
				{
					pageCount=(count/pageSize)+(count%pageSize>0? 1:0);
					if(currentPage>pageCount)
					{
						currentPage=pageCount;
					}
					startPage=(currentPage/pageBlock)*pageBlock+1;
					if(currentPage%pageBlock==0)
					{
						startPage-=pageBlock;
					}
					endPage=startPage+pageBlock-1;
					if(endPage>pageCount) endPage=pageCount;
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("start", start);
					map.put("end", end);
					map.put("email", email);
					List<MyAuctionDataBean> myBidAuctions=dao.getMyBidAuctions(map);
					request.setAttribute("myAuctions", myBidAuctions);
					//System.out.println("bid list:"+myBidAuctions.size());
				}
				Map<String, Object> model=new HashMap<String, Object>();
				model.put("count", count);
				model.put("pageNum", pageNum);
				model.put("currentPage", currentPage);
				model.put("number", number);
				model.put("pageCount", pageCount);
				model.put("startPage", startPage);
				model.put("endPage", endPage);
				model.put("pageBlock", pageBlock);
				model.put("pageSize", pageSize);
				return new ModelAndView("logon/myBidList",model);
			}
			else
			{
				return new ModelAndView("default");
			}
		}
		
		
	}
}
