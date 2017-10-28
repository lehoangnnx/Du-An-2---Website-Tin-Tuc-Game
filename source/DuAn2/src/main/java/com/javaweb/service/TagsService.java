package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Tags;

public interface TagsService {
	List<Tags> findAll();
	Tags findTagsId(Integer tagsId);
}
