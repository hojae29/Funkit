package com.funkit.controller.manager;


import com.funkit.service.funding.FundingService;
import com.funkit.service.funding.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/mgr/funding")
public class ManagerFundingController {

    final FundingService fundingService;
    final OrderService orderService;

    public ManagerFundingController(FundingService fundingService, OrderService orderService) {
        this.fundingService = fundingService;
        this.orderService = orderService;
    }

    @GetMapping("/approval")
    public String moveFundingApprovalPage(Model model){

        var list = fundingService.findFundingByStatusCode(20);
        model.addAttribute("list", list);

        return "/manager/funding";
    }

    @GetMapping("/payment")
    public String moveFundingPaymentMgrPage(Model model){

        var list = fundingService.findFundingByStatusCode(50);
        model.addAttribute("list", list);

        return "/manager/fundingPay";
    }

    @GetMapping("/{fundingCode}/order")
    public String moveFundingOrderMgrPage(@PathVariable int fundingCode, Model model){
        var list = orderService.findOrderListByFundingCode(fundingCode);
        model.addAttribute("list", list);

        return "manager/fundingOrder";
    }

    @ResponseBody
    @PatchMapping("/{fundingCode}/approval")
    public ResponseEntity fundingApproval(@PathVariable int fundingCode){
        return fundingService.updateFundingStatusCode(fundingCode, 30);
    }
}
