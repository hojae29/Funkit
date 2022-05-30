package com.funkit.controller;

import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.model.Recipe;
import com.funkit.model.Tag;
import com.funkit.service.RecipeMainImgService;
import com.funkit.service.RecipeService;
import com.funkit.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

    final String path = "recipe/";

    @Autowired
    RecipeService service;

    @Autowired
    TagService tagService;

    @Autowired
    RecipeMainImgService mainService;

    @GetMapping({"","/list"})
    public String list(Model model){
        List<Recipe> list = service.list();

        model.addAttribute("list",list);

        return path + "list";
    }

    @RequestMapping("/add")
    public String add(@SessionAttribute Member member,Recipe<MultipartFile> recipe){

        recipe.setId(member.getId());//session에서 id값 가져오기

        //레시피 코드 별 디렉토리 생성
        String uploadMain = "D:/upload/recipe";

        int recipeCode = service.getCode(recipe);

        mainService.createImg(recipeCode);

        File uploadPath = new File(uploadMain + "/" + recipeCode);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
            new File(uploadPath + "/mainImage").mkdirs();
            new File(uploadPath + "/cookImage").mkdirs();
        }
        return "redirect:add/" + recipeCode;
    }

    @GetMapping("/add/{recipeCode}")
    public String add(@PathVariable int recipeCode,Model model){
        //tag list 가져오기
        List<Tag> tag = tagService.tagList();

        model.addAttribute("tag",tag);

        Recipe<Image> recipe = service.getRecipeCode(recipeCode);

        model.addAttribute("recipe",recipe);

        return path + "add";
    }

    @PostMapping("/add/{recipeCode}")
    public String add(@PathVariable int recipeCode,Recipe<MultipartFile> recipe){
        service.getRecipeCode(recipeCode);

        service.add(recipe);

        return "redirect:../list";
    }

    @GetMapping("/view/delete/{recipeCode}")
    public String delete(@PathVariable int recipeCode){
        service.delete(recipeCode);

        return "redirect:../list";
    }

    @GetMapping("/view")
    public String view(){
        return path + "view";
    }

    @PostMapping("/uploadAjaxAction/{recipeCode}")
    public void uploadAjaxAction(@PathVariable int recipeCode ,MultipartFile mainImage){
        //이미지 첨부시 ajax로 해당 디렉토리에 이미지 파일 저장
        service.getRecipeCode(recipeCode);

        String uploadMainPath = "D:/upload/recipe/" +recipeCode + "/mainImage/";

        long fileSize = mainImage.getSize();

        String uploadFileName = mainImage.getOriginalFilename();

        String uuid = UUID.randomUUID().toString();

        uploadFileName = uuid + "_" + uploadFileName;

        File saveFile = new File(uploadMainPath,uploadFileName);

        try{
            mainImage.transferTo(saveFile);
        }catch (Exception e){
            e.printStackTrace();
        }

        Map map = new HashMap();
        map.put("recipeCode",recipeCode);
        map.put("fileName",uploadFileName);
        map.put("location",uploadMainPath);
        map.put("fileSize",fileSize);

        mainService.addMainImgName(map);



    }

}
