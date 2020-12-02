package com.auction.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insertProduct(ProductVo vo) {
		String date1 = vo.getDeadlinedate();
	    Date date2 = new Date();
	    long calDateDays=0;
	    
	    try{ // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
	        Date FirstDate = format.parse(date1);
	        String time1 = format.format(date2);
	        Date SecondDate = format.parse(time1);
	        
	        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
	        // 연산결과 -950400000. long type 으로 return 된다.
	        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
	        
	        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
	        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
	        calDateDays = calDate / (24*60*60*1000); 
	        calDateDays = Math.abs(calDateDays);
	        
	        } catch(ParseException e) {
	        	e.printStackTrace();
	        }
	    
		vo.setTimeout((int)calDateDays);
		vo.setStartmoney((int) (vo.getPrice()*0.6));
		vo.setLastmoney((int) (vo.getPrice()*1.4));
		int result =  sqlSession.insert("com.auction.mapper.ProductMapper.insertProduct", vo);
		return result;
	}

	@Override
	public ProductVo selectOne(int pno) {
		sqlSession.update("com.auction.mapper.ProductMapper.timeout");
		return sqlSession.selectOne("com.auction.mapper.ProductMapper.selectOne", pno);
	}

	@Override
	public List<ProductVo> selectAuction() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectAuction");
	}

	@Override
	public List<ProductVo> selectPop() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectPop");
	}

	@Override
	public List<ProductVo> selectHurry() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectHurry");
	}

	@Override
	public List<ProductVo> selectAuctionBlind() {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectAuctionBlind");
	}

	@Override
	public List<ProductVo> showNormalCategory(String category) {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.normalCategory", category);
	}

	@Override
	public int insertAuction(AuctionVo vo,String auctionmenu,int diff, int myDiff) {
		int result=0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("getcustomer", vo.getID());
		map.put("pno", vo.getPno());
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("getcustomer", vo.getID());
		map2.put("pno", vo.getPno());
		map2.put("bestmoney", vo.getMyprice());
		int select = sqlSession.selectOne("com.auction.mapper.ProductMapper.showAuction", vo.getPno());
//		if(select>0) {
//			if(auctionmenu.equals("일반")) {
//				result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
//				result += sqlSession.update("com.auction.mapper.ProductMapper.updateMoney", map);
//			}else {
//				result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
//				if(myDiff<diff) {
//					sqlSession.update("com.auction.mapper.ProductMapper.updateCustomer", map2);
//				}
//			}
//		}else if(auctionmenu.equals("일반")){
//			result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
//			result += sqlSession.update("com.auction.mapper.ProductMapper.updateMoneyFirst", map);
//		}
		
		if(auctionmenu.equals("일반")) {
			if(select>0) {
				result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
				result += sqlSession.update("com.auction.mapper.ProductMapper.updateMoney", map);
			}else {
				result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
				result += sqlSession.update("com.auction.mapper.ProductMapper.updateMoneyFirst", map);
				
			}
		}else {
			result = sqlSession.insert("com.auction.mapper.ProductMapper.insertAuction", vo);
			sqlSession.update("com.auction.mapper.ProductMapper.updateCount", vo.getPno());
			if(myDiff<diff || select==0) {
				sqlSession.update("com.auction.mapper.ProductMapper.updateCustomer", map2);
			}
			
		}
		
		return result;
	}

	
	@Override
	public List<ProductVo> showBlindCategory(String category) {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.blindCategory", category);
	}

	@Override
	public int dealChage(int pno) {
		return sqlSession.update("com.auction.mapper.ProductMapper.dealChange", pno);
		
	}

	@Override
	public AuctionVo blindCharge(int pno) {
		return sqlSession.selectOne("com.auction.mapper.ProductMapper.blindCharge", pno);
	}

	@Override
	public int addLike(String str, String ID) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("likeproduct", str);
		map.put("ID", ID);
		return sqlSession.update("com.auction.mapper.ProductMapper.addLike", map); 
	}

	@Override
	public int hitcountUp(int pno) {
		return sqlSession.update("com.auction.mapper.ProductMapper.hitcountUp", pno);
	}

	@Override
	public String selectLike(String ID) {
		return sqlSession.selectOne("com.auction.mapper.ProductMapper.selectLike", ID);
	}
	
	@Override		//검색 기능
	public List<ProductVo> searchProduct(String keyword){
		return sqlSession.selectList("com.auction.mapper.ProductMapper.searchProduct", keyword);
	}

	@Override
	public List<Integer> auctionPno(String id) {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.auctionPno", id);
	}

	@Override
	public AuctionVo maxPrice(int pno,String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("id", id);
		return sqlSession.selectOne("com.auction.mapper.ProductMapper.maxPrice", map);
	}

	@Override
	public int rejectBlind(String id, int pno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ID", id);
		map.put("pno", pno);
		return sqlSession.selectOne("com.auction.mapper.ProductMapper.rejectBlind", map);
	}

	@Override
	public void payment(int pno) {
		sqlSession.update("com.auction.mapper.ProductMapper.payment",pno);
	}

	@Override
	public List<ProductVo> selectSales(String ID) {
		return sqlSession.selectList("com.auction.mapper.ProductMapper.selectSales", ID);
	}
}
