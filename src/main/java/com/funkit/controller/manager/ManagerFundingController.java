package com.funkit.controller.manager;


import com.funkit.model.Funding;
import com.funkit.service.manager.ManagerService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/mgr/funding")
public class ManagerFundingController {

    final ManagerService managerService;

    public ManagerFundingController(ManagerService managerService) {
        this.managerService = managerService;
    }

    @RequestMapping("")
    public String fundingManagement(Model model){

        List<Funding> list = managerService.getApprovalReqFundingList();
        model.addAttribute("list", list);

        return "/manager/funding";
    }

    @ResponseBody
    @PatchMapping("/{code}")
    public ResponseEntity fundingApproval(@PathVariable int code){
        return managerService.fundingApproval(code);
    }
}
