package com.tech.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.CommentMapper;
import com.tech.repository.mapper.ImageMapper;
import com.tech.service.interfaces.ImageService;
import com.tech.vo.ImageVO;

@Service("imageService")
public class ImageServiceImpl implements ImageService {
	String success_msg = "성공", failed_msg = "실패", notFound_comment_msg = "댓글을 찾을 수 없음";
	ImageMapper iMapper;
	
	@Autowired
	public ImageServiceImpl(ImageMapper iMapper) {
		super();
		this.iMapper = iMapper;
	}
	
	@Override
	public int insertImage(ImageVO vo) {
		// TODO Auto-generated method stub
		return iMapper.insertImage(vo);
	}

	@Override
	public List<ImageVO> getImageListById(int seq) {
		// TODO Auto-generated method stub
		return iMapper.getImageListById(seq);
	}

	@Override
	public int deleteImage(int seq) {
		// TODO Auto-generated method stub
		return iMapper.deleteImage(seq);
	}

}
