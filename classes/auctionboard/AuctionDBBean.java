package auctionboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import setting.SqlMapClient;

@Component("auctiondao")
public class AuctionDBBean implements Dao {
	SqlSession sqlSession = SqlMapClient.getSqlSession();
	@Override
	public int getCount() {
		return sqlSession.selectOne("auctionboard.getCount");
	}//end getCount 역할 : 글의 갯수를 샘
	@Override
	public int insertAuction(AuctionDataBean dto) {//경매를 삽입함.
		int itemnum;

		itemnum=sqlSession.selectOne("auctionboard.getItemNum");
		dto.setItemnum(itemnum);
		int result=sqlSession.insert("auctionboard.insertAuction",dto);
		if(result==1){
			return itemnum;
		}else{
			return result;
		}
	}
	@Override
	public int insertimage(AuctionImageBean imagedto) {
		return sqlSession.insert("auctionboard.insertImage",imagedto);
	}
	@Override 
	public List<AuctionDataBean> getAuctions(HashMap<String, Integer> map) {//Auctionlist에 글 제목들이랑 종료시간 등등을 띄워줄 list를 받아옴.
		return sqlSession.selectList("auctionboard.getAuctions",map);
	}
	@Override
	public AuctionDataBean getAuction(int itemnum) {//Content에서 글을 볼 내용을 받아옴..
		return sqlSession.selectOne("auctionboard.getAuction",itemnum);
	}
	@Override
	public List<AuctionImageBean> getImage(int itemnum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("auctionboard.getImage",itemnum);
	}
	@Override
	public int countPlus(int itemnum) {// 조회 수 증가 ip 개념은 안넣었기 때문에 조회수 증가 안되게하는건 id로 할 예정.
		return sqlSession.update("auctionboard.countPlus", itemnum);
	}
	@Override
	public int bidding(Map<String, Object> bidMap) {
		// TODO Auto-generated method stub
		int count=sqlSession.selectOne("selectbid", bidMap);
		if(count==0){
			sqlSession.insert("auctionboard.insertbiduser",bidMap);
		}else{
			sqlSession.update("auctionboard.updatebiduser",bidMap);
		}
		sqlSession.update("auctionboard.bid",bidMap);
		return 0;
	}
	@Override
	public int getBid(Map<String, Object> bidMap) {
		// TODO Auto-generated method stub
		int count=sqlSession.selectOne("selectbid", bidMap);
		if(count==1){
			return sqlSession.selectOne("auctionboard.getBid",bidMap);
		}else{
			return 0;
		}
	}
	@Override
	public AuctionImageBean thumnail(int itemnum) {
		return sqlSession.selectOne("auctionboard.thumnail",itemnum);
	}

}
