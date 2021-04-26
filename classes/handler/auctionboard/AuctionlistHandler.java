package handler.auctionboard;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auctionboard.AuctionDataBean;
import auctionboard.AuctionImageBean;
import auctionboard.Dao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;








import handler.main.CommandHandler;


@Controller
public class AuctionlistHandler implements CommandHandler{
	@Resource(name="auctiondao")
	Dao dao;
	@RequestMapping("/auctionlist")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize  = 7;		// 한페이지에 들어가는 글 갯수 
		int pageBlock = 3; 

		int count = 0;															//글의 갯수	
		String pageNum = null;													//현재 페이지
		int currentPage= 0;														//연산용 현재 페이지
		
		int start = 0;															//현재 페이지의 시작 글 번호
		int end = 0;															//현재 페이지의 끝 글 번호
		int number = 0;															//글번호 재계산
		
		int pageCount = 0;														//페이지 개수
		int startPage= 0;														//시작 페이지 번호
		int endPage = 0;														//끝 페이지 번호



		count = dao.getCount();													//count 불러오는 함수.
		
		pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")){
			pageNum="1";
		}
		
		currentPage = Integer.parseInt( pageNum );
		pageCount = (count/pageSize)+( count % pageSize > 0 ? 1 : 0);
		if(currentPage>pageCount) currentPage = pageCount;
		start = (currentPage -1 ) * pageSize + 1;		// (5-1) * 10+1
		end = start + pageSize - 1;						// (41+10) -1
		
		number = count-(currentPage-1) * pageSize;		//50 - (5-1)* 10 = 10
		if(count>0){
			
			startPage = (currentPage/pageBlock) * pageBlock + 1 ;
						//(5        / 5)        * 5         + 1
			if(currentPage % pageBlock == 0){
				startPage -= pageBlock;
			}
			endPage = (startPage+pageBlock)-1;
						//11    +  5       -1
			if(endPage > pageCount){
				endPage=pageCount;
			}
			HashMap<String, Integer> map = new HashMap<String,Integer>();
			map.put("start",start);
			map.put("end",end);
			List<AuctionDataBean> articles = dao.getAuctions(map);
			List<AuctionImageBean> images = new ArrayList<AuctionImageBean>();
			for(int i =0; i<articles.size(); i++){
				AuctionDataBean dto = articles.get(i);
				System.out.println(dto.getItemnum());
				images.add(dao.thumnail(dto.getItemnum()));
			}
			request.setAttribute("articles", articles);
			request.setAttribute("images", images);
		}//end if(count>0)

		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		
		return new ModelAndView("auctionboard/auctionlist","count",count);
	}
}
