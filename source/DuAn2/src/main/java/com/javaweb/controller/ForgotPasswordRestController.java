package com.javaweb.controller;


import com.javaweb.model.Users;
import com.javaweb.service.EmailService;

import com.javaweb.service.UsersService;

import java.nio.charset.StandardCharsets;
import java.util.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ForgotPasswordRestController {
	@Autowired
	UsersService usersService;
	@Autowired
	EmailService emailService;

	@Autowired
	public SimpleMailMessage template;
	@Autowired
	private JavaMailSender emailSender;
	@PostMapping("/user/forgotpassword")

	public String forgotPassword( @RequestBody String userName, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Users users = null;
		try {

			users = usersService.findByUserNameAndStatus(userName, "active");
			if (users == null) {
				return "error";
			} else {
				String random = randomString(20);
				String url = request.getScheme() + "://" +
						request.getServerName() +
						("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
						request.getContextPath() + "/forgotpassword/" + random;
				String uri = request.getScheme() + "://" +
						request.getServerName() + ":" + request.getServerPort() +
						request.getContextPath() + "/forgotpassword/" + random;
				MimeMessage message = emailSender.createMimeMessage();

				MimeMessageHelper helper = new MimeMessageHelper(message,
						MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
						StandardCharsets.UTF_8.name());
				helper.setTo(users.getEmail());
				helper.setSubject("Lấy Lại Mật Khẩu - Website Game24h");


				helper.setText("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
						"<html xmlns=\"http://www.w3.org/1999/xhtml\" style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\n" +
						"<head>\n" +
						"<meta name=\"viewport\" content=\"width=device-width\" />\n" +
						"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" +
						"<title>Lấy Lại Mật Khẩu | Website Games 24h</title>\n" +
						"\n" +
						"\n" +
						"<style type=\"text/css\">\n" +
						"img {\n" +
						"max-width: 100%;\n" +
						"}\n" +
						"body {\n" +
						"-webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; line-height: 1.6em;\n" +
						"}\n" +
						"body {\n" +
						"background-color: #f6f6f6;\n" +
						"}\n" +
						"@media only screen and (max-width: 640px) {\n" +
						"  body {\n" +
						"    padding: 0 !important;\n" +
						"  }\n" +
						"  h1 {\n" +
						"    font-weight: 800 !important; margin: 20px 0 5px !important;\n" +
						"  }\n" +
						"  h2 {\n" +
						"    font-weight: 800 !important; margin: 20px 0 5px !important;\n" +
						"  }\n" +
						"  h3 {\n" +
						"    font-weight: 800 !important; margin: 20px 0 5px !important;\n" +
						"  }\n" +
						"  h4 {\n" +
						"    font-weight: 800 !important; margin: 20px 0 5px !important;\n" +
						"  }\n" +
						"  h1 {\n" +
						"    font-size: 22px !important;\n" +
						"  }\n" +
						"  h2 {\n" +
						"    font-size: 18px !important;\n" +
						"  }\n" +
						"  h3 {\n" +
						"    font-size: 16px !important;\n" +
						"  }\n" +
						"  .container {\n" +
						"    padding: 0 !important; width: 100% !important;\n" +
						"  }\n" +
						"  .content {\n" +
						"    padding: 0 !important;\n" +
						"  }\n" +
						"  .content-wrap {\n" +
						"    padding: 10px !important;\n" +
						"  }\n" +
						"  .invoice {\n" +
						"    width: 100% !important;\n" +
						"  }\n" +
						"}\n" +
						"</style>\n" +
						"</head>\n" +
						"\n" +
						"<body itemscope itemtype=\"http://schema.org/EmailMessage\" style=\"font-family: " +
						"'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px;" +
						" -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; " +
						"height: 100%; line-height: 1.6em; background-color: #f6f6f6; margin: 0;\" bgcolor=\"#f6f6f6\">\n" +
						"\n" +
						"<table class=\"body-wrap\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;\" " +
						"bgcolor=\"#f6f6f6\"><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; margin: 0;\"><td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\"></td>\n" +
						"\t<td class=\"container\" width=\"600\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 600px !important;" +
						" clear: both !important; margin: 0 auto;\" valign=\"top\">\n" +
						"\t<div class=\"content\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; max-width: 600px; display: block; margin: 0 auto; padding: 20px;\">\n" +
						"\t<table class=\"main\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; " +
						"border: 1px solid #e9e9e9;\" bgcolor=\"#fff\"><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"alert alert-warning\" " +
						"style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; " +
						"font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center;" +
						" border-radius: 3px 3px 0 0; background-color: #FF9F00; margin: 0; padding: 20px;\" align=\"center\" bgcolor=\"#FF9F00\" valign=\"top\">\n" +
						"\tEmail Lấy Lại Mật Khẩu\n" +
						"\t</td>\n" +
						"\t</tr><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; " +
						"font-size: 14px; margin: 0;\"><td class=\"content-wrap\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;\" valign=\"top\">\n" +
						"\t<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; margin: 0;\"><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\n" +
						"\tXin chào :  <strong style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing:" +
						" border-box; font-size: 14px; margin: 0;\">"+userName+"</strong>.\n" +
						"\t</td>\n" +
						"\t</tr><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing:" +
						" border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\n" +
						"\tChào mừng bạn đã đến với Games24h<br/>\n" +
						"Bạn vừa yêu cầu lấy lại mật khẩu trên "+request.getScheme() + "://" +
						request.getServerName() +
						("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
						request.getContextPath()+". Nếu bạn không có yêu cầu, vui lòng bỏ qua thư này. Ngược lại, hãy bấm vào link bên dưới" +
						" để hoàn tất việc thay đổi mật khẩu.  "+
						"\t</td>\n" +
						"\t</tr><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; " +
						"font-size: 14px; margin: 0;\"><td class=\"content-block\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\n" +
						"\t<a href=\""+url+"\" class=\"btn-primary\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; " +
						"box-sizing: border-box; font-size: 14px; color: #FFF; text-decoration: none; line-height: 2em; font-weight:" +
						" bold; text-align: center; cursor: pointer; display: inline-block; border-radius: 5px; text-transform: capitalize;" +
						" background-color: #348eda; margin: 0; border-color: #348eda; border-style: solid; " +
						"border-width: 10px 20px;\">Link Lấy Lại Mật Khẩu</a>\n" +
						"\t</td>\n" +
						"\t</tr><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"content-block\" " +
						"style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px;" +
						" vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\n" +
						"\tXin chân thành cảm ơn.\n" +
						"\t</td>\n" +
						"\t</tr></table></td>\n" +
						"\t</tr></table><div class=\"footer\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;\">\n" +
						"\t<table width=\"100%\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing:" +
						" border-box; font-size: 14px; margin: 0;\"><tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; margin: 0;\"><td class=\"aligncenter content-block\" " +
						"style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; " +
						"font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;\" " +
						"align=\"center\" valign=\"top\"><a href=\""+request.getScheme() + "://" +
						request.getServerName() +
						("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort() ) +
						request.getContextPath()+"\" style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 12px; color: #999; text-decoration: " +
						"underline; margin: 0;\">Games 24h</a> Website Thông Tin Games.</td>\n" +
						"\\t</tr></table></div></div>\n" +
						"\t</td>\n" +
						"\t<td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;" +
						" box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;\" valign=\"top\"></td>\n" +
						"\t</tr></table></body>\n" +
						"</html>",true);

				emailSender.send(message);

				users.setForgotpassword(random);
				usersService.saveorupdate(users);
				String getEmail = users.getEmail();
				getEmail = getEmail.replace(getEmail.substring(3,10), "***");
				return "* Vui Lòng Kiểm Tra Email " + getEmail;
			}
		} catch (Exception e) {
			return "error";
		}
	}

	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZzxcvbnmasdfghjklqwertyuiop";
	static Random rnd = new Random();

	String randomString(int len) {
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		return sb.toString();
	}
	@Bean
	public SimpleMailMessage templateSimpleMessage() {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setText(
				"<button>ABC</button>");
		return message;
	}
}
