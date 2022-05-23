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
    public String add(@SessionAttribute Member member,Recipe<MultipartFile> recipe){
        recipe.setId(member.getId());//session에서 id값 가져오기



        /*String uploadMain = "D:\\upload\\recipe";

        var recipeMain = new Recipe();

        int recipeCode = service.addImg(recipeMain);

       try{
           new File(uploadMain + recipeCode).mkdirs();
           new File(uploadMain + recipeCode + "\\cooking").mkdir();
       }catch (Exception e){
           e.getStackTrace();
       }*/


        /*if(imgPath.exists() == false){
            imgPath.mkdirs();
        }*/

        service.add(recipe);



        return "redirect:list";
    }
    @GetMapping("/view/delete/{recipeCode}")
    public String delete(@PathVariable int recipeCode){
        service.delete(recipeCode);

        return "redirect:../list";
    }
}
