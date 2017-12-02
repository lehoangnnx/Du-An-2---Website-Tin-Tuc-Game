package com.javaweb.controller.administrator;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import com.javaweb.controller.ImagesManager;
import com.javaweb.model.Users;
import com.javaweb.service.GameReviewsService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import com.javaweb.model.GameCategory;
import com.javaweb.model.Games;
import com.javaweb.service.GameCategoryService;
import com.javaweb.service.GamesService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminGamesController {
    @Autowired
    ImagesManager imagesManager;
    @Autowired
    ServletContext context;
    @Autowired
    GamesService gamesService;
    @Autowired
    GameCategoryService gameCategoryService;
    @Autowired
    UsersService usersService;
    @GetMapping("/games")
    public String getAllGames(Model model, @RequestParam(name = "status", defaultValue = "active") String status,
                              Authentication authentication, HttpServletRequest request) {
        List<Games> gameList = gamesService.findAllByStatusOrderByGameIdDesc(status);

        model.addAttribute("gameList", gameList);
        return "games";
    }

    @GetMapping("/games/addgames")
    public String addGames(Model model) {
        List<GameCategory> gameCategoryList = gameCategoryService.findAllByStatus("active");
        model.addAttribute("gameCategoryList", gameCategoryList);
        return "addgames";
    }

    @GetMapping("/games/{gameId}")
    public String addGames(Model model, @PathVariable("gameId") Integer gameId) {
        Games games = gamesService.findByGameId(gameId);
        List<GameCategory> gameCategoryList = gameCategoryService.findAllByStatus("active");
        model.addAttribute("gameCategoryList", gameCategoryList);
        model.addAttribute("games", games);
        return "updategames";
    }

    @PostMapping("/games")
    public String addGames(Model model, @RequestParam("name") String name, @RequestParam("slug") String slug,
                           @RequestParam(value = "status",defaultValue = "inactive") String status, @RequestParam("gameCategories") List<Integer> gameCategories,
                           @RequestParam("releases") String releases, @RequestParam("publishers") String publishers,
                           @RequestParam("developers") String developers, @RequestParam("writers") String writers,
                           @RequestParam("composers") String composers, @RequestParam("engine") String engine,
                           @RequestParam("platforms") String platforms, @RequestParam("info") String info,
                           @RequestParam("isHot") int isHot,
                           @RequestParam("homeUrl") String homeUrl,
                           @RequestParam("downloadUrl") String downloadUrl,
                           @RequestParam("systemRequirements") String systemRequirements,
                           @RequestParam("images") MultipartFile images,

                           RedirectAttributes redirectAttributes) {
        System.out.println("Vao POST");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        String monthAndYear = imagesManager.getMonthAndYearNow();
        // Lấy đường dẫn /WEB-INF/files/images/articles/" + monthAndYear
        String photoPath = context.getRealPath("/WEB-INF/files/images/games/" + monthAndYear);
        HashSet<GameCategory> gameCategoryHashSet = new HashSet<>();
        Games games = new Games();

        try {

            if (!name.equals("")) {
                games.setName(HtmlUtils.htmlEscape(name));
            }
            if (!slug.equals("")) {
                games.setSlug(HtmlUtils.htmlEscape(slug));
            }
            if (!publishers.equals("")) {
                games.setPublishers(HtmlUtils.htmlEscape(publishers));
            }
            if (!developers.equals("")) {
                games.setDevelopers(HtmlUtils.htmlEscape(developers));
            }
            if (!writers.equals("")) {
                games.setWriters(HtmlUtils.htmlEscape(writers));
            }
            if (!composers.equals("")) {
                games.setComposers(HtmlUtils.htmlEscape(composers));
                ;
            }
            if (!engine.equals("")) {
                games.setEngine(HtmlUtils.htmlEscape(engine));
            }
            if (!platforms.equals("")) {
                games.setPlatforms(HtmlUtils.htmlEscape(platforms));
            }
            if (!info.equals("")) {
                games.setInfo(HtmlUtils.htmlEscape(info));
            }
            if (!releases.equals("")) {
                Date date = df.parse(releases);
                games.setReleases(date);

            }
            if(!info.equals("")){
                games.setInfo(HtmlUtils.htmlEscape(info));
            }
            if(!homeUrl.equals("")){
                games.setHomeUrl(HtmlUtils.htmlEscape(homeUrl));
            }
            if(!downloadUrl.equals("")){
                games.setDownloadUrl(HtmlUtils.htmlEscape(downloadUrl));
            }
            if(!systemRequirements.equals("")){
                games.setSystemRequirements(HtmlUtils.htmlEscape(systemRequirements));
            }
            games.setStatus(status);
            games.setIsHot((byte) isHot);
            gameCategories.forEach(x -> gameCategoryHashSet.add(gameCategoryService.findByGameCategoryId(x)));
            games.setGameCategories(gameCategoryHashSet);

            if (!images.isEmpty()) {
                // Kiểm tra và tạo thư mục trong đường dẫn /WEB-INF/files/images/articles/" +
                // monthAndYear nêu chưa có
                boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
                if (checkFolderExists) {
                    // Đổi tên File hiện tại
                    String newNameFile = imagesManager.renameFile(images.getOriginalFilename());
                    // Lưu File vào đường dẫn
                    byte[] bytes = images.getBytes();
                    Path path = Paths.get(photoPath + newNameFile);
                    Files.write(path, bytes);
                    games.setImages(monthAndYear + newNameFile);

                }

            }
            gamesService.saveorupdate(games);
            redirectAttributes.addFlashAttribute("msg", "Thêm  Game Thành Công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("msg", "Thêm Game Thất Bại");
            return "redirect:/admin/games/addgames";
        }

        return "redirect:/admin/games?status="+status;
    }

    @PatchMapping("/games")
    public String updateGames(Model model, @RequestParam("gameId") Integer gameId, @RequestParam("name") String name, @RequestParam("slug") String slug,
                              @RequestParam(value = "status",defaultValue = "inactive") String status, @RequestParam("gameCategories") List<Integer> gameCategories,
                              @RequestParam("releases") String releases, @RequestParam("publishers") String publishers,
                              @RequestParam("developers") String developers, @RequestParam("writers") String writers,
                              @RequestParam("composers") String composers, @RequestParam("engine") String engine,
                              @RequestParam("platforms") String platforms, @RequestParam("info") String info,
                              @RequestParam("isHot") int isHot,
                              @RequestParam("homeUrl") String homeUrl,
                              @RequestParam("downloadUrl") String downloadUrl,
                              @RequestParam("systemRequirements") String systemRequirements,
                              @RequestParam("images") MultipartFile images,
                              RedirectAttributes redirectAttributes, HttpServletRequest request) {
        System.out.println("Vao PATCH");

        String monthAndYear = imagesManager.getMonthAndYearNow();
        // Lấy đường dẫn /WEB-INF/files/images/articles/" + monthAndYear
        String photoPath = context.getRealPath("/WEB-INF/files/images/games/" + monthAndYear);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        HashSet<GameCategory> gameCategoryHashSet = new HashSet<>();
        Games games = gamesService.findByGameId(gameId);

        try {

            if (!name.equals("")) {
                games.setName(HtmlUtils.htmlEscape(name));
            }
            if (!slug.equals("")) {
                games.setSlug(HtmlUtils.htmlEscape(slug));
            }
            if (!publishers.equals("")) {
                games.setPublishers(HtmlUtils.htmlEscape(publishers));
            }
            if (!developers.equals("")) {
                games.setDevelopers(HtmlUtils.htmlEscape(developers));
            }
            if (!writers.equals("")) {
                games.setWriters(HtmlUtils.htmlEscape(writers));
            }
            if (!composers.equals("")) {
                games.setComposers(HtmlUtils.htmlEscape(composers));
                ;
            }
            if (!engine.equals("")) {
                games.setEngine(HtmlUtils.htmlEscape(engine));
            }
            if (!platforms.equals("")) {
                games.setPlatforms(HtmlUtils.htmlEscape(platforms));
            }
            if (!info.equals("")) {
                games.setInfo(HtmlUtils.htmlEscape(info));
            }
            if (!releases.equals("")) {
                Date date = df.parse(releases);
                games.setReleases(date);

            }
            if(!info.equals("")){
                games.setInfo(HtmlUtils.htmlEscape(info));
            }
            if(!homeUrl.equals("")){
                games.setHomeUrl(HtmlUtils.htmlEscape(homeUrl));
            }
            if(!downloadUrl.equals("")){
                games.setDownloadUrl(HtmlUtils.htmlEscape(downloadUrl));
            }
            if(!systemRequirements.equals("")){
                games.setSystemRequirements(HtmlUtils.htmlEscape(systemRequirements));
            }
            if(request.isUserInRole("ROLE_ADMIN")) {
                games.setStatus(status);
            }
            games.setIsHot((byte) isHot);
            gameCategories.forEach(x -> gameCategoryHashSet.add(gameCategoryService.findByGameCategoryId(x)));
            games.setGameCategories(gameCategoryHashSet);
            if (!images.isEmpty()
                    && !images.getOriginalFilename().equals(games.getImages())) {
                // Kiểm tra và tạo thư mục trong đường dẫn /WEB-INF/files/images/articles/" +
                // monthAndYear nêu chưa có
                boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
                if (checkFolderExists) {
                    // Đổi tên File hiện tại
                    String newNameFile = imagesManager.renameFile(images.getOriginalFilename());
                    // Lưu File vào đường dẫn
                    byte[] bytes = images.getBytes();
                    Path path = Paths.get(photoPath + newNameFile);
                    Files.write(path, bytes);
                    games.setImages(monthAndYear + newNameFile);

                }

            }

            gamesService.saveorupdate(games);
            redirectAttributes.addFlashAttribute("msg", "Sửa  Game Thành Công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("msg", "Sửa Game Thất Bại");
            return "redirect:/admin/games/" + gameId;
        }

        return "redirect:/admin/games?status="+games.getStatus();
    }

    @DeleteMapping("/games")
    public String deleteAllUser(@RequestParam("arrayId") List<Integer> arrayId, RedirectAttributes redirectAttributes) {

        try {
            arrayId.forEach(x -> {

                Games games = gamesService.findByGameId(x);
                games.setStatus("deleted");
                gamesService.saveorupdate(games);
                ;
            });

            redirectAttributes.addFlashAttribute("msg", "Xóa Game Thành Công");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            redirectAttributes.addFlashAttribute("msg", "Xóa Game Thất Bại");
        }

        return "redirect:/admin/games?status=active";
    }
}
