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
        return "redirect:./";
    }

    @GetMapping("/update")
    public String update() {
        return path + "update";
    }

    @PostMapping("/update")
    public String update(Notice notice, HttpSession session) {

        Member user = (Member) session.getAttribute("member");
        notice.setId(user.getId());
        service.update(notice);
        return "redirect:./";
    }

    @GetMapping("/view/{noticeCode}")
    public String view(@PathVariable int noticeCode, Model model) {
        Notice notice = new Notice();
        notice = service.view(noticeCode);
        model.addAttribute("notice", notice);
        return path + "view";
    }

    @GetMapping("/view/{noticeCode}/delete")
    public String delete(@PathVariable int noticeCode) {
        service.delete(noticeCode);
        return "redirect:/notice";
    }
}