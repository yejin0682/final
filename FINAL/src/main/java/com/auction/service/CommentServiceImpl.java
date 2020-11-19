package com.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auction.dao.CommentDao;
import com.auction.vo.CommentVo;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDao dao;
	
	@Override
	public void writeCommentService(CommentVo vo) {
		dao.writeComment(vo);
	}

	@Override
	public List<CommentVo> selectCommentService(int qbno) {
		return dao.selectComment(qbno);
	}

	@Override
	public int selectMaxCnoService() {
		return dao.selectMaxCno();
	}

	@Override
	public void updateRefService(int cno) {
		dao.updateRef(cno);
	}

	@Override
	public CommentVo topComment(int maxCno) {
		return dao.topComment(maxCno);
	}
}
