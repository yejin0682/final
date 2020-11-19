package com.auction.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

public class KakaoApi {
	private final static String K_CLIENT_ID = "f39b69e28f5123ba3e2579bd141bc7bc"; //이런식으로 REDIRECT_URI를 써넣는다. // // 
	private final static String K_REDIRECT_URI = "http://192.168.6.154:9090/final/kakaoResult"; 
	
	public static String getAuthorizationUrl(HttpSession session) { 
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" 
	+ K_CLIENT_ID + "&redirect_uri=" + K_REDIRECT_URI + "&response_type=code"; 
		return kakaoUrl; 
	}

	 public static JsonNode getKakaoAccessToken(String code) {
	        final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
	        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	 
	        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	        postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); // REST API KEY
	        postParams.add(new BasicNameValuePair("redirect_uri",  K_REDIRECT_URI)); // 리다이렉트 URI
	        postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
	 
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	 
	        JsonNode returnNode = null;
	 
	        try {
	            post.setEntity(new UrlEncodedFormEntity(postParams));
	 
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	 
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Post parameters : " + postParams);
	            System.out.println("Response Code : " + responseCode);
	 
	            // JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	 
	            returnNode = mapper.readTree(response.getEntity().getContent());
	 
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	        }
	 
	        return returnNode;
	    }
	 
	 public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		 
	        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	        final HttpClient client = HttpClientBuilder.create().build();
	        final HttpPost post = new HttpPost(RequestUrl);
	        // add header
	        post.addHeader("Authorization", "Bearer " + accessToken);
	        JsonNode returnNode = null;
	 
	        try {
	            final HttpResponse response = client.execute(post);
	            final int responseCode = response.getStatusLine().getStatusCode();
	 
	            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	            System.out.println("Response Code : " + responseCode);
	 
	            // JSON 형태 반환값 처리
	            ObjectMapper mapper = new ObjectMapper();
	            returnNode = mapper.readTree(response.getEntity().getContent());
	 
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            // clear resources
	        }
	 
	        return returnNode;
	    }
	 public static void kakaoLogout(String access_Token) {
		    String reqURL = "https://kapi.kakao.com/v1/user/logout";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String result = "";
		        String line = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("결과:"+result);
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}
}
