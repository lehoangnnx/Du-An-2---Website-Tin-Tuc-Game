package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.Tags;

import java.util.List;

@Repository
public interface TagsRepository extends JpaRepository<Tags, Integer> {
	Tags findByTagsId(Integer tagsId);
	Tags findByName(String name);
	Tags findBySlug(String slug);


}
