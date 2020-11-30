package com.auction.job;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Job {
	@Autowired
	SqlSession sqlSession;
	@Scheduled(cron="* * * * * *")
	public void run() {
		sqlSession.update("com.auction.mapper.JobMapper.timeout");
		sqlSession.update("com.auction.mapper.JobMapper.dealNormal");
		sqlSession.update("com.auction.mapper.JobMapper.dealBlind");
	}
}
