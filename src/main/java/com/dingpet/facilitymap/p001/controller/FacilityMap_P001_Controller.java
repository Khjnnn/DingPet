package com.dingpet.facilitymap.p001.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Controller {

	// 시설지도 
	public void facilityMap(Model model);

	// 시설지도 병원 카테고리 조회 
	public void medicenterMap(@ModelAttribute("PlaceDTO") PlaceDTO dto, Model model, FacilityMap_P001_VO vo);
	
}