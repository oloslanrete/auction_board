package handler.auctionboard;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import auctionboard.AuctionDataBean;
import auctionboard.AuctionImageBean;
import auctionboard.Dao;
import handler.main.CommandHandler;

@Controller
public class AuctionwriteProHandler implements CommandHandler {
	@Resource(name="auctiondao")
	Dao dao;
	
	@RequestMapping(value="/auctionwritePro", method=RequestMethod.GET)
	@Override 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//글을 insert 해서 넣고 Pro가 main으로 돌아가게 해줌.
		/*
		MultipartHttpServletRequest multi= (MultipartHttpServletRequest)request;
		int itemnum= Integer.parseInt(multi.getParameter("itemnum"));
		int result=0;
		
		AuctionDataBean dto = new AuctionDataBean();
		dto.setTitle(multi.getParameter("title")); //제목
		dto.setContent(multi.getParameter("content")); // 내용
		dto.setStartprice(Integer.parseInt(multi.getParameter("startprice"))); // 시작가
		dto.setPrice(Integer.parseInt(multi.getParameter("price"))); //즉구가
		String year = multi.getParameter("year");
		String month = multi.getParameter("month");
		String day = multi.getParameter("day");
		String date=new SimpleDateFormat("hh:mm:ss").format(new Date(System.currentTimeMillis()));
		System.out.println(year+"-"+month+"-"+day+" "+date);
		dto.setEndDate(Timestamp.valueOf(year+"-"+month+"-"+day+" "+date)); // 끝나는날
		System.out.println(dto.getEndDate());
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));
		dto.setWriter((String)multi.getSession().getAttribute("memId")); // 작성자
		result = dao.insertAuction(dto);
		
		//이미지 파일 db 저장
		AuctionImageBean imagedto = new AuctionImageBean();
		Map<String, MultipartFile> fileMap = multi.getFileMap();
		if(fileMap.get("upload1")==null){
				
			String originalName1 = fileMap.get("upliad1").getName();
			String systemName1 = itemnum+"'s"+originalName1;
			imagedto.setItemnum(itemnum);
			imagedto.setOriginalName(originalName1);
			imagedto.setSystemName(systemName1);
			result= dao.insertimage(imagedto);
		}
		return new ModelAndView("auctionboard/auctionwritePro","result", result);
		*/
		return null;
	}
	
	@RequestMapping(value="/auctionwritePro", method=RequestMethod.POST)
	public ModelAndView process(MultipartHttpServletRequest request,@RequestParam("upload")LinkedList<MultipartFile> file) throws Exception {
		
		int result=1;
		int itemnum;
		AuctionDataBean dto = new AuctionDataBean();
		dto.setTitle(request.getParameter("title")); //제목
		dto.setContent(request.getParameter("content")); // 내용
		dto.setStartprice(Integer.parseInt(request.getParameter("startprice"))); // 시작가
		if(!request.getParameter("price").equals("")){
			dto.setPrice(Integer.parseInt(request.getParameter("price"))); //즉구가
		}
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String date=new SimpleDateFormat("hh:mm:ss").format(new Date(System.currentTimeMillis()));
		System.out.println(year+"-"+month+"-"+day+" "+date);
		dto.setEndDate(Timestamp.valueOf(year+"-"+month+"-"+day+" "+date)); // 끝나는날
		System.out.println(dto.getEndDate());
		dto.setRegDate(new Timestamp(System.currentTimeMillis()));
		dto.setWriter((String)request.getSession().getAttribute("memId")); // 작성자
		itemnum = dao.insertAuction(dto);
		System.out.println(itemnum);
		if(itemnum!=0){
			AuctionImageBean imagedto = new AuctionImageBean();
			for(int i = 0 ; i < file.size() ; i++){
				
				MultipartFile mp = file.get(i);
				System.out.println(mp.getOriginalFilename());
				String originalName = mp.getOriginalFilename();
				String systemName = itemnum+"'s"+i+"bun"+mp.getOriginalFilename();
				if(!originalName.equals("")){
					File folder = new File(request.getSession().getServletContext().getRealPath("/file"));
		            if(!folder.exists()){
		                 //없다면 생성
		               folder.mkdirs(); 
		            }
					File fi2 = new File(request.getSession().getServletContext().getRealPath("/file/"+systemName));
					mp.transferTo(fi2);
					imagedto.setItemnum(itemnum);
					imagedto.setOriginalName(originalName);
					imagedto.setSystemName(systemName);
					result= dao.insertimage(imagedto);
				}
			}			
		}
		return new ModelAndView("auctionboard/auctionwritePro","result", result);
	}
	
}
