package com.cyber.web.controller.resourceSysController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.awt.SunHints;

@Controller
public class FavoritesController {
    @RequestMapping(value = "/tofavorites")
    public String toFavorites() {
        return "user_fav";
    }
}
