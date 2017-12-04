/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface RolesRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
package com.javaweb.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.Roles;

import javax.management.relation.Role;
import java.util.List;


@Repository("rolesRepository")
public interface RolesRepository extends JpaRepository<Roles, Integer> {
	 Roles findByName(String name);
	Roles findByRoleId(Integer roleId);
	List<Roles> findAllByStatusOrderByRoleIdDesc(String status);

}
