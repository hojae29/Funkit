package com.funkit.controller.manager;

import com.funkit.model.Funding;
import com.funkit.service.manager.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/mgr")
public class ManagerController {

    final ManagerService managerService;

    public ManagerController(ManagerService managerService) {
        this.managerService = managerService;
    }

    @RequestMapping("")
    public String manager(){
        return "/manager/manager";
    }

    @RequestMapping("/funding")
    public String fundingManagement(Model model){

        List<Funding> list = managerService.getApprovalReqFundingList();
        model.addAttribute("list", list);

        return "/manager/funding";
    }
}
