package com.javaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.model.Tags;
import com.javaweb.repository.TagsRepository;

@Service
public class TagsServiceImpl implements TagsService {
	@Autowired
	TagsRepository tagsRepository;
	@Override
	public List<Tags> findAll() {
	
		return tagsRepository.findAll();
	}
	@Override
	public Tags findTagsId(Integer tagsId) {
		
		return tagsRepository.findByTagsId(tagsId);
	}
	@Override
	public Tags findByName(String name) {
		
		return tagsRepository.findByName(name);
	}
	@Override
	public void saveorupdate(Tags tags) {
		tagsRepository.save(tags);
		
	}
	@Override
	public Tags findBySlug(String slug) {
	
		return tagsRepository.findBySlug(slug);
	}

}
