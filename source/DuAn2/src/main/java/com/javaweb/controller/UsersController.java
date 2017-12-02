package com.javaweb.controller;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
@Controller
public class UsersController {
    @Autowired
    UsersService usersService;
    @Autowired
    ImagesManager imagesManager;
    @Autowired
    ServletContext context;


    @PatchMapping("/users")
    public String updateUsers(Model model,
                              @RequestParam("email") String email, @RequestParam("phoneNumber") String phoneNumber,
                              @RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
                               @RequestParam("avatar") MultipartFile avatar,Authentication authentication,
                              RedirectAttributes redirectAttributes, HttpSession session

    ) {

        String monthAndYear = imagesManager.getMonthAndYearNow();
        Users user = usersService.findByUserName(authentication.getName());
        HashSet<Roles> roles = new HashSet<>();
        String photoPath = context.getRealPath("/WEB-INF/files/images/avatar/" + monthAndYear);

        try {

            if(email != ""  ) {
                user.setEmail(HtmlUtils.htmlEscape(email));
            }
            user.setFirstName(HtmlUtils.htmlEscape(firstName));
            user.setLastName(HtmlUtils.htmlEscape(lastName));
            user.setPhoneNumber(HtmlUtils.htmlEscape(phoneNumber));

            if (!avatar.isEmpty() && !avatar.getOriginalFilename().equals(user.getAvatar())) {
                boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
                if (checkFolderExists) {
                    String newNameFile = imagesManager.renameFile(avatar.getOriginalFilename());
                    byte[] bytes = avatar.getBytes();
                    Path path = Paths.get(photoPath + newNameFile);
                    Files.write(path, bytes);
                    user.setAvatar(monthAndYear + newNameFile);

                }

            }

            usersService.saveorupdate(user);
            session.setAttribute("user", user);
            // model.addAttribute("success", "Sửa Người Dùng Thành Công");

        } catch (Exception e) {
            // model.addAttribute("error", "Sửa Người Dùng Thất Bại");

            return "redirect:/403.html" ;

        }
        return "redirect:/profile.html";

    }
}
