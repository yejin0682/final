package com.kk.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.api.KakaoApi;
import com.auction.api.NaverLoginBo;
import com.auction.api.PaymentCheck;
import com.auction.service.MemberService;
import com.auction.service.ProductService;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class ApiController {
	private NaverLoginBo naverLoginBo;
	private String apiResult= null;
	@Autowired
	PaymentCheck paymentCheck;
	@Autowired
	ProductService pService;
	@Autowired
	MemberService mService;
	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
//	@RequestMapping(value="/result")
//	public String login(Model model,HttpSession session) {
//		System.out.println("로그인확인");
//		return "login";
//	}
	
	@RequestMapping(value="kakaoResult")
	public String kakaoResult(String code,HttpSession session) {
		JsonNode jsonToken = KakaoApi.getKakaoAccessToken(code);
	    // JsonNode트리형태로 토큰받아온다
		JsonNode accessToken;
	    // 여러 json객체 중 access_token을 가져온다
	    accessToken = jsonToken.get("access_token");
	    System.out.println("액세스토큰:"+accessToken);
	    System.out.println("리프레시토큰:"+jsonToken.get("refresh_token"));
        JsonNode userInfo = KakaoApi.getKakaoUserInfo(accessToken);
        // Get id
        String id = userInfo.path("id").getValueAsText();
//        유저정보:{"id":1519352021,"connected_at":"2020-11-01T08:07:57Z","properties":{"nickname":"진영웅"},"kakao_account":{"profile_needs_agreement":false,"profile":{"nickname":"진영웅"},"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"ljk8003@naver.com","has_birthday":true,"birthday_needs_agreement":false,"birthday":"0921","birthday_type":"SOLAR"}}
//        정보:{"nickname":"진영웅"}
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
        String name = properties.path("nickname").getValueAsText();
        String email = kakao_account.path("email").getValueAsText();
        String birthday = kakao_account.path("birthday").getValueAsText();
        MemberVo vo  = new MemberVo(id, "312fdqwd", name, "", "", email, birthday, "e");
        vo.setApi("kakao");
        int apiCheck=mService.apiLogin(id, "kakao");
		if(apiCheck==0) {
			mService.insertApi(vo);
		}
		session.setAttribute("member", vo);
		session.setAttribute("accessToken", accessToken);

		return "loginaction";
	}
	
	@RequestMapping(value="result")
	public String callback(Model model, String code,String state,HttpSession session ) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		apiResult = naverLoginBo.getUserProfile(oauthToken);
		JSONParser jsonParse = new JSONParser(); //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다. 
		JSONObject jsonObj = (JSONObject) jsonParse.parse(apiResult);
		JSONObject jsonResponse = (JSONObject)jsonObj.get("response");
		System.out.println("1:"+jsonObj);
		System.out.println("2:"+jsonResponse);
		String id = (String) jsonResponse.get("id");
		String name=(String) jsonResponse.get("name");
		String email =(String) jsonResponse.get("email");
		String birthday =(String) jsonResponse.get("birthday");
		MemberVo vo  = new MemberVo(id, "312fdqwd", name, "", "", email, birthday, "e");
		vo.setApi("naver");
		int apiCheck=mService.apiLogin(id, "naver");
		if(apiCheck==0) {
			mService.insertApi(vo);
		}
		session.setAttribute("member", vo);
		model.addAttribute("result", apiResult);
		return "loginaction";
	}
	
	@RequestMapping(value="paymentResult")
	public String paymentResult(String imp_uid,String mid,Model model,int pno,HttpSession session) {
		String token =paymentCheck.getImportToken();
		String amount=paymentCheck.getAmount(token, mid);
		paymentCheck.setHackCheck(amount, mid, token);
		Map<String,String> map = paymentCheck.paymentInformation(token, mid); 
		
		MemberVo member =  (MemberVo) session.getAttribute("member");
		String ID = member.getID();
		ProductVo vo =pService.selectOne(pno);
		pService.payment(pno);
		if(vo.getFilenames()==null || vo.getFilenames().equals("")) {
			vo.setImg1(null);
			vo.setImg2(null);
		} else {
			vo.setImg1(vo.getFilenames().split("_!_")[0]);
			vo.setImg2(vo.getFilenames().split("_!_")[1]);
			vo.setImage(null);
		}
		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		return "paymentAction";
	}
}
