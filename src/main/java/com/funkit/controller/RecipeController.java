package com.funkit.controller;

import com.funkit.model.Member;
import com.funkit.model.Recipe;
import com.funkit.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String add(@SessionAttribute Member member,Recipe recipe){
        recipe.setId(member.getId());

        service.add(recipe);

        return "redirect:list";
    }
    @GetMapping("/view/delete/{recipeCode}")
    public String delete(@PathVariable int recipeCode){
        service.delete(recipeCode);

        return "redirect:../list";
    }
}
