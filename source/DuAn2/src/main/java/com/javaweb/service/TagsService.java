/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface TagsService thưc thi xử lý
* */
package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Tags;

public interface TagsService {
	List<Tags> findAll();
	Tags findTagsId(Integer tagsId);
	Tags findByName(String name);
	Tags findBySlug(String slug);
	void saveorupdate(Tags tags);
	Tags findTop1ByNameContainingOrSlugContaining(String name, String slug);
}
