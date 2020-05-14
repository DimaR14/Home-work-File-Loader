package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MyController {
    static final int ITEMS_PER_PAGE = 5;

    private final FileService fileService;

    public MyController(FileService fileService) {
        this.fileService = fileService;
    }

    @RequestMapping("/")
    public String index(Model model,
                        @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;

        List<File> files = fileService.findAll(PageRequest.of(page,
                ITEMS_PER_PAGE,
                Sort.Direction.DESC, "id"));

        model.addAttribute("files", files);
        model.addAttribute("allPages", getPageCount());
        return "index";
    }

    private long getPageCount() {
        long totalCount = fileService.count();
        return (totalCount / ITEMS_PER_PAGE) + ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);
    }

}
