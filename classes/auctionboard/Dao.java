package auctionboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface Dao {
	public int getCount();
	public int insertAuction(AuctionDataBean dto);
	public List<AuctionDataBean> getAuctions(HashMap<String, Integer> map);
	public AuctionDataBean getAuction(int itemnum);
	public int countPlus(int itemnum);
	public int insertimage(AuctionImageBean imagedto);
	public List<AuctionImageBean> getImage(int itemnum);
	public int bidding(Map<String, Object> bidMap);
	public int getBid(Map<String, Object> bidMap);
	public AuctionImageBean thumnail(int itemnum);
}
