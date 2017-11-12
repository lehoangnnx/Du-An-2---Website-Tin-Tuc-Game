package com.javaweb.configuration;

import java.util.Date;
import java.util.HashSet;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.repository.ArticleCategoryRepository;
import com.javaweb.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.repository.RolesRepository;
import com.javaweb.repository.UsersRepository;



@Component
public class DataSeedingListener implements ApplicationListener<ContextRefreshedEvent> {
	
	@Autowired
	private UsersRepository usersRepository;
	@Autowired
	ArticleRepository articleRepository;

	@Autowired
	ArticleCategoryRepository  articleCategoryRepository;
	@Autowired 
	private PasswordEncoder passwordEncoder;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {

		/*// Roles
		if (rolesRepository.findByName("ROLE_ADMIN") == null) {
			rolesRepository.save(new Roles("ROLE_ADMIN", "active"));
		}
		
		if (rolesRepository.findByName("ROLE_MEMBER") == null) {
			rolesRepository.save(new Roles("ROLE_MEMBER", "active"));
		}
		
		// Admin account
		if (usersRepository.findByUserName("admin") == null) {
			Users admin = new Users();
			admin.setUserName("admin");
			admin.setEmail("admin@gmail.com");
			admin.setPasword(passwordEncoder.encode("123456"));
			admin.setStatus("active");
			admin.setCreatedDate(new Date());
			admin.setLoggedInDate(new Date());
			admin.setIsOnline((byte) 1);
			HashSet<Roles> roles = new HashSet<>();
			roles.add(rolesRepository.findByName("ROLE_ADMIN"));
			roles.add(rolesRepository.findByName("ROLE_MEMBER"));
			admin.setRoleses(roles);
			usersRepository.save(admin);
		}
		
		// Member account
		if (usersRepository.findByUserName("nguoidung") == null) {
			Users user = new Users();
			user.setUserName("nguoidung");
			user.setEmail("nguoidung@gmail.com");
			user.setPasword(passwordEncoder.encode("123456"));
			user.setStatus("active");
			user.setCreatedDate(new Date());
			user.setLoggedInDate(new Date());
			user.setIsOnline((byte) 1);
			HashSet<Roles> roles = new HashSet<>();
			
			roles.add(rolesRepository.findByName("ROLE_MEMBER"));
			user.setRoleses(roles);
			usersRepository.save(user);
		}*/
		/*for (int i = 200; i < 300; i++) {
			Article article= new Article();
			article.setTitle("Title Article " +i);
			article.setSlug("title-article-"+i);
			article.setSubContent("Sub Content :" +i);
			article.setMainContent("Main ConTent :" +i);
			article.setAuthor("Author :" +i);
			article.setStatus("active");
			article.setViews(2);
			article.setCreatedDate(new Date());
			article.setShowDate(new Date());
			article.setUsers(usersRepository.findByUserId(3));
			HashSet<ArticleCategory> articleCategory = new HashSet<>();
			articleCategory.add(articleCategoryRepository.findByArticleCategoryId(1));
			article.setArticleCategories(articleCategory);
			
			articleRepository.save(article);

		}*/
	}

}
