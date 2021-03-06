package com.dingpet.facilitymap.p001.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.dingpet.facilitymap.p001.dto.ReplyPageDTO;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_ReplyMapper;
import com.dingpet.facilitymap.p001.vo.Criteria;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class FacilityMap_Reply_ServiceImpl implements FacilityMap_Reply_Service {

	private FacilityMap_P001_ReplyMapper mapper;
	
	
	@Override
	public int write(FacilityMap_P001_ReplyVO reply_vo) {
		log.info("writing reply");
		return mapper.write(reply_vo);
	}

	@Override
	public FacilityMap_P001_ReplyVO view(String review_id) {
		log.info("viewing reply");
		return mapper.view(review_id);
	}

	@Override
	public int delete(String reply_id) {
		log.info("deleting reply");
		return mapper.delete(reply_id);
	}

	@Override
	public int modify(FacilityMap_P001_ReplyVO reply_vo) {
		log.info("modifying reply");
		return mapper.modify(reply_vo);
	}

	@Override
	public List<FacilityMap_P001_ReplyVO> list(Criteria cri, String site_id) {
		log.info("listing replies");
		return mapper.list(cri, site_id);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, String site_id) {

		return new ReplyPageDTO(mapper.getCountByRno(site_id), mapper.list(cri, site_id));
	}


}
