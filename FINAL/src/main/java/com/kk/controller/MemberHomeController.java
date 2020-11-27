package com.kk.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.auction.api.KakaoApi;
import com.auction.api.NaverLoginBo;
import com.auction.service.MemberService;
import com.auction.service.ProductService;
import com.auction.service.QnaBoardService;
import com.auction.sha256.SHA256Util;
import com.auction.vo.AuctionVo;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;
import com.auction.vo.QnaBoardVo;


@Controller
public class MemberHomeController {
	@Autowired
	MemberService service;
	@Autowired
	ProductService pService;
	@Autowired
	QnaBoardService qnaService;
	@Autowired
	GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	OAuth2Parameters googleOAuth2Parameters;
	
	private NaverLoginBo naverLoginBo;
	private String apiResult= null;
	
	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//
//		
//		return "home";
//	}
	
	@RequestMapping(value = "/login")	//로그인
	public String login(Locale locale, Model model,HttpSession session) {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googleUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		System.out.println("/member/googleSignIn, url : " + googleUrl);
		String googleUrl2 = "https://accounts.google.com/o/oauth2/v2/auth?" 
                + "scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile" 
                + "&response_type=code" 
                + "&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oauth2.example.com/token" 
                + "&client_id=" + "1001790183901-cb9d2bt84dqu3v7e0gfsg6rtjrpapdd7.apps.googleusercontent.com"
                + "&redirect_uri=" + "http://yejin0682.cafe24.com/oauth2callback"
                + "&access_type=offline";
		
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		String kakaoAuthUrl = KakaoApi.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		model.addAttribute("googleUrl",googleUrl2);
		model.addAttribute("kakaoUrl", kakaoAuthUrl);
		return "login";
	}
	

	
	@RequestMapping(value = "/login/loginaction")
	public String LoginCheck(MemberVo vo, HttpServletRequest req, HttpSession session, RedirectAttributes redirectattributes) throws Exception {
	//	PrintWriter out=response.getWriter();
		session = req.getSession();
		//System.out.println(dto.getID());
		vo.setPw(util(vo.getPw()));
		MemberVo memberdto = service.loginCheck(vo);
		if(memberdto == null) {
			session.setAttribute("member", null);
			redirectattributes.addFlashAttribute("msg", memberdto);
//			out.print("<script> alert('dd'); location.href='/final/login';</script>");
//			out.flush();
		}else {
			session.setAttribute("member", memberdto);
			return "loginaction";
		}
		return "failurelogin";
	}
	
	@RequestMapping(value = "/logout")		//로그아웃
	public String logout(HttpSession session) {
		if(session.getAttribute("accessToken")!=null) {
			KakaoApi.kakaoLogout(session.getAttribute("accessToken").toString());
		}
		session.removeAttribute("accessToken");
		session.invalidate();
		return "logout";
	}
	
	@RequestMapping(value = "/singup", method = RequestMethod.GET)	//회원가입
	public String singup(Locale locale, Model model) {
		return "singup";
	}
	
	public String util(String pw) {
		String str = pw;
		String sha256_en = SHA256Util.encrypt(str);
//		System.out.println("SHA256 암호화 : "+sha256_en);
		return sha256_en;
	}
	
	@RequestMapping(value = "/signupaction")	//등록처리
	public String insertPost(RedirectAttributes redirectattributes, MemberVo vo) throws Exception{
	//	model.addAttribute("mvo", vo);
	//	redirectattributes.addFlashAttribute("msg", "regSuccess");
		vo.setPw(util(vo.getPw()));
//		System.out.println(vo.getName()+", "+vo.getZonecode()+", "+vo.getAddrdetail());
		service.writeSignUp(vo);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/memberupdate")
	public String memberupdate() {
		return "memberupdate";
	}
	@RequestMapping(value = "/memberaction")
	public String UpdateAction(MemberVo vo, HttpSession session) {
		vo.setPw(util(vo.getPw()));
		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/main";
	}

	public void setImg(List<ProductVo> list) {
		for(ProductVo vo : list) {
			if(vo.getFilenames()==null || vo.getFilenames().equals("")) {
				vo.setImg1(null);
				vo.setImg2(null);
			} else {
				vo.setImg1(vo.getFilenames().split("_!_")[0]);
				vo.setImg2(vo.getFilenames().split("_!_")[1]);
				vo.setImage(null);
			}
		}
	}
	@RequestMapping(value="/myPage")
	public String myPage(HttpSession session, Model model) {
		MemberVo member = (MemberVo) session.getAttribute("member");
		List<ProductVo> list1 = new ArrayList<ProductVo>();
		String likeProduct = pService.selectLike(member.getID());
		String[] pno = likeProduct.split("_!_"); // 1016 1022
		for(int i=0; i<=pno.length-1; i++) { //2
			if(!(pno[i].equals(""))) {
				ProductVo vo = pService.selectOne(Integer.parseInt(pno[i]));
//				System.out.println(vo);
				list1.add(vo);
			}
	      }
		setImg(list1);
		String id = member.getID();
		List<QnaBoardVo> list2 =qnaService.selectFromId(id);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
//		System.out.println("list1: "+list1.isEmpty());
		return "myPage";
	}
	
	@RequestMapping(value="/deallist")
	public String deallist(HttpSession session,Model model) {
		MemberVo vo =(MemberVo) session.getAttribute("member");
		String id =vo.getID();
		List<Integer> pnoList=pService.auctionPno(id);
		List<AuctionVo> auctionList = new ArrayList<AuctionVo>();
		for(Integer pno : pnoList) {
			auctionList.add(pService.maxPrice(pno,id));
		}
		List<ProductVo> salesList = pService.selectSales(id);
		model.addAttribute("sales", salesList);
		model.addAttribute("purchase", auctionList);
		model.addAttribute("id", id);
		return "deallist";
	}
	
//	@RequestMapping(value="/result/naverLogin")
//	public String naverLogin(String id,String name, String email,String birthday,String api,HttpSession session) {
//		MemberVo vo = new MemberVo(id, "111", name, "주소", "11111", email, birthday, "c");
//		vo.setApi(api);
//		int apiCheck=service.apiLogin(id, api);
//		System.out.println("api중복체크:"+apiCheck);
//		System.out.println(id);
//		System.out.println(api);
//		if(apiCheck==0) {
//			service.insertApi(vo);
//		}
//		session.setAttribute("member", vo);
//		return "loginaction";
//	}
	
	@RequestMapping(value = "/idcheck")
	public String idfind(){
		return "idcheck";
	}
	
	@RequestMapping(value = "/IDfind")
	public String IDfing(MemberVo vo, Model model, HttpSession session) throws Exception {
		MemberVo result = service.IdCheck(vo);
		if(result==null) {
			model.addAttribute("msg", "회원정보가 틀립니다.");
			session.setAttribute("member", result);
			return "idcheck";
		}else {
			session.setAttribute("member", result);
			return "IDfind";
		}
	}
	
	@RequestMapping(value = "/pwcheck")
	public String pwcheck() {
		
		return "pwcheck";
	}
	
	@RequestMapping(value = "/PWfind")
	public String PWfind(MemberVo vo, Model model, HttpSession session)throws Exception {
		MemberVo result = service.PwCheck(vo);
		if(result==null) {
			model.addAttribute("msg", "회원정보가 틀립니다.");
			session.setAttribute("member", result);
			return "pwcheck";
		}else {
			session.setAttribute("member", result);
			return "PWfind";
		}
	}	
	
	@RequestMapping(value = "/newPWaction")
	public String PWaction(MemberVo vo, HttpSession session) {
//		System.out.println(vo.getID());
//		System.out.println(vo.getPw());
		vo.setPw(util(vo.getPw()));
		service.newPW(vo);
		session.invalidate();
		return "redirect:/main";
	}
	
	
}





