package com.tech.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tech.vo.ImageVO;

@Mapper
public interface ImageMapper {
	
	/* 이미지등록  썸네일등록아님 */
	int insertImage(ImageVO vo);
	
	/* 게시글 번호로 이미지리스트 전부 삭제 */
	int deleteImage(int seq);
	
	/* 게시글 번호로 이미지리스트 가져오기 */
	List<ImageVO> getImageListById(int seq);

}
