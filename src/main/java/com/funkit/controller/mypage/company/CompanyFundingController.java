package com.funkit.controller.mypage.company;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import com.funkit.model.Member;
import com.funkit.model.Tag;
import com.funkit.service.TagService;
import com.funkit.service.funding.FundingService;
import com.funkit.service.funding.RewardService;
import com.funkit.util.Pager;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myfunkit/company/funding")
public class CompanyFundingController {

    final FundingService fundingService;
    final RewardService rewardService;
    final TagService tagService;

    public CompanyFundingController(FundingService fundingService, RewardService rewardService, TagService tagService) {
        this.fundingService = fundingService;
        this.rewardService = rewardService;
        this.tagService = tagService;
    }

    @RequestMapping("/make")
    public String makeFunding(HttpSession session){
        Member member = (Member)session.getAttribute("member");
        var funding = new Funding();
        funding.setId(member.getId());
        int code = fundingService.makeFunding(funding);

        try{
            new File("d:/upload/funding/" + code).mkdirs();
            new File("d:/upload/funding/" + code + "/mainImage").mkdir();
            new File("d:/upload/funding/" + code + "/infoImage").mkdir();
        } catch(Exception e){
            e.getStackTrace();
        }

        return "redirect:./" + code;
    }

    @GetMapping("/{code}")
    public String moveMakeFundingPage(@PathVariable int code, Model model){
        Funding<Image> funding = fundingService.getFundingByFundingCode(code);
        List<Tag> tagList = tagService.getTagList();

        model.addAttribute("funding", funding);
        model.addAttribute("tagList", tagList);

        return "/mypage/funding/add";
    }

    @PostMapping("/{code}")
    public ResponseEntity saveFunding(@PathVariable int code, Funding<MultipartFile> funding,
                                      @RequestParam(value="tagCode", required=false) List<Integer> tagCode){
        List<Tag> tagList = new ArrayList<>();
        if(tagCode != null){
            for(var index : tagCode)
                tagList.add(new Tag(index));
            funding.setTags(tagList);
        }
        funding.setFundingCode(code);

        return fundingService.saveFunding(funding);
    }

    @DeleteMapping("/{code}")
    public ResponseEntity deleteFunding(@PathVariable int code){
        return fundingService.deleteFunding(code);
    }

    @RequestMapping("/{code}/approval")
    public String fundingApprovalReq(@PathVariable int code, @RequestParam("status") int status){
        fundingService.fundingApprovalReq(code, status);

        return "redirect:/myfunkit/company";
    }

    @ResponseBody
    @GetMapping("")
    public Map pagination(HttpSession session, Pager pager){
        System.out.println(pager);

        Member member = (Member) session.getAttribute("member");

        List<Funding<Image>> fundingList = fundingService.getFundingListById(member.getId(), pager);

        Map map = new HashMap();
        map.put("list", fundingList);
        map.put("pager", pager);

        return map;
    }


}