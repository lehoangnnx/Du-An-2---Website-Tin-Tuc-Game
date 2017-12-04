/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface TagsRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
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
	Tags findTop1ByNameContainingOrSlugContaining(String name, String slug);

}
