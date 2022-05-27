package com.funkit.controller;

import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.model.Recipe;
import com.funkit.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
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

    @RequestMapping("/add")
    public String add(@SessionAttribute Member member,Recipe<MultipartFile> recipe){
        recipe.setId(member.getId());//session에서 id값 가져오기

        String uploadMain = "D:/upload/recipe";

        int recipeCode = service.add(recipe);

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
        Recipe<Image> recipe = service.getRecipeCode(recipeCode);
        model.addAttribute("recipe",recipe);

        return path + "add";
    }
    @PostMapping("/add/{recipeCode}")
    public String add(@PathVariable int recipeCode,Recipe<MultipartFile> recipe){

        return "redirect:list";
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
    public void uploadAjaxAction(@PathVariable int recipeCode,MultipartFile mainImage,Recipe<MultipartFile> recipe){

        recipe.setRecipeCode(recipeCode);

        String uploadMainPath = "D:/upload/recipe/" +  "/mainImage";

        String uploadFileName = mainImage.getOriginalFilename();

        File saveFile = new File(uploadMainPath,uploadFileName);

        try{
            mainImage.transferTo(saveFile);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
