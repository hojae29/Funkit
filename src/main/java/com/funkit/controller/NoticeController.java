package com.funkit.controller;

import com.funkit.model.Member;
import com.funkit.model.Notice;
import com.funkit.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    final String path = "notice/";

    @Autowired
    NoticeService service;

    @GetMapping("")
    public String list(Model model) {
        List<Notice> list = service.list();

        model.addAttribute("list", list);

        return path + "notice";
    }

    @GetMapping("/add")
    public String add() {
        return path + "add";
    }

    @PostMapping("/add")
    public String add(Notice notice, HttpSession session) {
        Member user = (Member) session.getAttribute("member");
        notice.setId(user.getId());
        service.add(notice);
        return "redirect:../notice";
    }

    @GetMapping("/{noticeCode}/update")
    public String update(@PathVariable int noticeCode, Model model) {
        Notice notice = service.item(noticeCode);

        model.addAttribute("notice", notice);

        return path + "update";
    }

    @PostMapping("/{noticeCode}/update")
    public String update(@PathVariable int noticeCode, Notice notice) {
        notice.setNoticeCode(noticeCode);
        service.update(notice);

        return "redirect:./";
    }

    @GetMapping("/{noticeCode}")
    public String view(@PathVariable int noticeCode, Model model) {
        Notice notice = new Notice();
        notice = service.view(noticeCode);
        model.addAttribute("notice", notice);
        return path + "view";
    }

    @GetMapping("/{noticeCode}/delete")
    public String delete(@PathVariable int noticeCode) {
        service.delete(noticeCode);
        return "redirect:/notice";
    }
}