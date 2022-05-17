package com.funkit.controller;

import com.funkit.model.Member;
import com.funkit.model.Recipe;
import com.funkit.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
    final String path = "recipe/";

    @Autowired
    RecipeService service;

    @GetMapping({"","/list"})
    public String list(Model model){
        List<Recipe> list = service.list();

        model.addAttribute("list",list);

        return path + "list";
    }
    @GetMapping("/add")
    public String add(){

        return path+"add";
    }
    @PostMapping("/add")
    public String add(@SessionAttribute Member member, Recipe recipe, MultipartFile[] uploadFile){
        //이미지 저장할 폴더 생성 및 경로 지정
        String uploadFolder = "D:\\upload\\recipe";



        String recipePath = ;

        File uploadPath = new File(uploadFolder,recipePath);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }

        //폴더에 이미지 저장하기
        for(MultipartFile multipartFile : uploadFile){
            String uploadFileName = multipartFile.getOriginalFilename();

            File saveFile = new File(uploadPath,uploadFileName);

            try{
                multipartFile.transferTo(saveFile);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        recipe.setId(member.getId());//session에서 id값 가져오기

        service.add(recipe);

        return "redirect:list";
    }
    @GetMapping("/view/delete/{recipeCode}")
    public String delete(@PathVariable int recipeCode){
        service.delete(recipeCode);

        return "redirect:../list";
    }
}
