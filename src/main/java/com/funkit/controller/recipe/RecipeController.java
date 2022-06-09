package com.funkit.controller.recipe;

import com.funkit.model.*;
import com.funkit.model.recipe.Cooking;
import com.funkit.model.recipe.Ingredients;
import com.funkit.model.recipe.Favorite;
import com.funkit.model.recipe.Recipe;
import com.funkit.service.recipe.FavoriteService;
import com.funkit.service.recipe.RecipeMainImgService;
import com.funkit.service.recipe.RecipeService;
import com.funkit.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;

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

    @Autowired
    FavoriteService favoriteService;

    @GetMapping("")
    public String list(Model model){
        List<Recipe> recipe = service.list();
        List<Tag> tagList = tagService.getTagList();

        System.out.println(recipe);

        model.addAttribute("recipe", recipe);
        model.addAttribute("tagList",tagList);

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
        List<Tag> tagList = tagService.getTagList();

        model.addAttribute("tagList",tagList);

        Recipe<Image> recipe = service.getRecipeCode(recipeCode);

        model.addAttribute("recipe",recipe);

        return path + "add";
    }

    @PostMapping("/add/{recipeCode}")
    public String add(@PathVariable int recipeCode, Recipe<MultipartFile> recipe,
                      @RequestParam(value="tagCode",required = false) List<Integer> tagCode,
                      @RequestParam(value="ingreName",required = false) List<String> ingreName,
                      @RequestParam(value = "ingreQua",required = false) List<String> ingreQua,
                      @RequestParam(value = "subImage",required = false) List<MultipartFile> subImage,
                      @RequestParam(value = "cookingSeq",required = false) List<Integer> cookingSeq,
                      @RequestParam(value = "cookingProcess",required = false)List<String> cookingProcess){

        String subPath = "D:/upload/recipe/" +recipeCode + "/cookImage/";
        String subLocation = "/upload/recipe/" +recipeCode + "/cookImage/";

        //조리과정 추가
        int imgNum=1;
        int seqNum=1;
        int processNum=1;
        List<Cooking> cookingList = new ArrayList<>();
        if(subImage != null){
            for(var indexSeq : cookingSeq){
                System.out.println("seqNum:"+ seqNum);
                for(var indexProcess : cookingProcess) {
                    System.out.println("processNum:"+ processNum);
                    for (MultipartFile multipartFile : subImage) {
                        System.out.println("imgNum:"+ imgNum);
                        if (seqNum == processNum && processNum == imgNum) {
                            String subName = multipartFile.getOriginalFilename();
                            long size = multipartFile.getSize();

                            String uuid = UUID.randomUUID().toString();

                            String uploadSubName = uuid + "_" + subName;
                            File saveSubImage = new File(subPath, uploadSubName);

                            try {
                                multipartFile.transferTo(saveSubImage);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                            cookingList.add(new Cooking(indexSeq, indexProcess, uploadSubName, size, subLocation));
                            System.out.println(cookingList);
                        }
                        imgNum = imgNum+1;
                    }
                    imgNum = 1;
                    processNum = processNum + 1;
                }

                imgNum = 1;
                processNum = 1;
                seqNum = seqNum +1;
            }
            System.out.println(cookingList);
            recipe.setCookings(cookingList);
        }


        //태그 추가
        List<Tag> tagList = new ArrayList<>();
        if(tagCode != null){
            for(var index : tagCode)
                tagList.add(new Tag(index));
            recipe.setTags(tagList);
        }

        //재료 추가
        int nameNum = 1;
        int quaNum = 1;
        List<Ingredients> ingreList = new ArrayList<>();
        if(ingreName != null && ingreQua !=null){
            for(var indexName : ingreName) {
                for(var indexQua : ingreQua){
                    if (nameNum==quaNum) {
                        ingreList.add(new Ingredients(indexName, indexQua));
                    }
                    quaNum = quaNum+1;
                }
                quaNum = 1;
                nameNum = nameNum + 1;
            }
            recipe.setIngredients(ingreList);
        }


        service.getRecipeCode(recipeCode);

        service.add(recipe);

        return "redirect:./../";
    }

    @GetMapping("/delete/{recipeCode}")
    public String delete(@PathVariable int recipeCode){
        service.delete(recipeCode);

        return "redirect:../";
    }

    @GetMapping("/{recipeCode}")
    public String view(@PathVariable int recipeCode, Model model){
        Recipe<Image> recipe = service.recipeView(recipeCode);
        model.addAttribute("recipe",recipe);


        System.out.println(recipe);
        service.updateView(recipeCode);

        return path + "view";
    }

    @PostMapping("/uploadAjaxAction/{recipeCode}")
    public void uploadAjaxAction(@PathVariable int recipeCode ,MultipartFile mainImage){
        //이미지 첨부시 ajax로 해당 디렉토리에 이미지 파일 저장
        service.getRecipeCode(recipeCode);

        String uploadMainPath = "D:/upload/recipe/" +recipeCode + "/mainImage/";

        String MainPath = "/upload/recipe/" +recipeCode + "/mainImage/";

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
        map.put("name",uploadFileName);
        map.put("location",MainPath);
        map.put("size",fileSize);

        mainService.addMainImgName(map);



    }

//    @ResponseBody
//    @PostMapping("/favoriteAjaxAction")
//    public void favoriteAjaxAction(@RequestParam(value = "code") Integer code, @SessionAttribute Member member, Favorite favorite){
//        favorite.setId(member.getId());
//
//        int recipeCode = code;
//
//        favorite.setRecipeCode(recipeCode);
//        favoriteService.updateLike(favorite);
//        favoriteService.updateCnt(favorite);
//    }


    @ResponseBody
    @PostMapping("/favoriteAjaxAction")
    public int favoriteCheck(@RequestParam(value = "code") Integer code, @SessionAttribute Member member, Favorite favorite){
        favorite.setId(member.getId());

        int recipeCode = code;

        favorite.setRecipeCode(recipeCode);

        int likeCheck=favoriteService.likeCheck(favorite);
        if(likeCheck == 0){
            favoriteService.updateLike(favorite);
            favoriteService.updateCnt(favorite);
        }else if(likeCheck == 1){
            favoriteService.deleteLike(favorite);
            favoriteService.updateCnt(favorite);
        }

        return likeCheck;
    }


}
