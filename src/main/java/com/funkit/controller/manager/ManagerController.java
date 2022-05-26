package com.funkit.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mgr")
public class ManagerController {

    @RequestMapping("")
    public String manager(){
        return "/manager/manager";
    }
}
