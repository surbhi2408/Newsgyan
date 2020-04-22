package com.newsgyan.demo.controller;

import com.newsgyan.demo.entity.Admin_login;
import com.newsgyan.demo.entity.Category;
import com.newsgyan.demo.entity.News;
import com.newsgyan.demo.entity.User_login;
import com.newsgyan.demo.repository.*;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {
    @Autowired
    AdminRepos arep;
    @Autowired
    loginRepos lr;
    @Autowired
    user_detailsRepos ud;
    @Autowired
    newsRepos nr;
    @Autowired
    CategoryRepos cr;

    @RequestMapping("/cpanel")
    public String adminLogin() {
        //if(arep.findByUsernameAndPassword())
        return "admin";
    }

    @RequestMapping("/adminlogin")
    public String login(@ModelAttribute("Admin_login") Admin_login al, HttpSession ses, Model md) {
        if (arep.findByUsernameAndPassword(al.getUsername(), al.getPassword()) != null) {
            ses.setAttribute("username", al.getUsername());
            ses.setAttribute("password", al.getPassword());
            md.addAttribute("username", ses.getAttribute("username").toString());
            return "adminhome";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/blockuser")
    public String blockuser(Model md, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            List<User_login> li = lr.findBlock(1);
            md.addAttribute("list", li);
            return "list";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/accept")
    public String Accept(@RequestParam("username") String username, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            User_login ul = lr.findByUsername(username);
            ul.setStatus(0);
            lr.save(ul);
            return "redirect:/blockuser";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            lr.deleteById(id);
            ud.deleteById(id);
            return "redirect:/blockuser";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/news")
    public String news(HttpSession ses, Model md) {
        if (ses.getAttribute("username") != null) {
            List<Category> li = cr.findAll();
            md.addAttribute("cat", li);
            return "news";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/postNews")
    public String postNews(@ModelAttribute("News") News n, @RequestParam("cate") int id, @RequestParam("files") MultipartFile file, HttpSession ses, Model md) throws IOException {
        if (ses.getAttribute("username") != null) {
            ServletContext con = ses.getServletContext();
            String path = con.getRealPath("") + "/images/news";
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            String filename = UUID.randomUUID().toString();
            File f1 = new File(path + "/" + filename + "." + ext);
            file.transferTo(f1);
            n.setPhotos(filename + "." + ext);
            n.setStatus(0);
            Category cate = cr.findById(id).get();
            n.setCategory(cate);
            nr.save(n);
            md.addAttribute("msg", "file uploaded successfully");
            md.addAttribute("cat", n.getCategory());
            return "redirect:/news";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/manage")
    public String manage(Model md, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            List<News> ns = nr.findAll();
            md.addAttribute("list", ns);
            return "newsList";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/accepting")
    public String accept(@RequestParam("id") int id, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            News ne = nr.getById(id);
            ne.setStatus(1);
            nr.save(ne);
            return "redirect:/manage";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/deleting")
    public String deleting(@RequestParam("id") int id, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            nr.deleteById(id);
            return "redirect:/manage";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/view")
    public String view(@RequestParam("id") int id, Model md, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            News n = nr.findById(id).get();
            md.addAttribute("a", n);
            return "NewsView";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/edit")
    public String edit(@RequestParam("id") int id, Model md, HttpSession ses) {
        if (ses.getAttribute("username") != null) {
            News n = nr.findById(id).get();
            List<Category> li = cr.findAll();
            md.addAttribute("v", n);
            md.addAttribute("cate", li);
            return "NewsEdit";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/editnews")
    public String editnews(@ModelAttribute("News") News n, @RequestParam("cate") int id, @RequestParam("file") MultipartFile file, HttpSession ses) throws IOException {
        if (ses.getAttribute("username") != null) {
            News ne = nr.findById(n.getId()).get();
            ne.setTitle(n.getTitle());
            ne.setDescription(n.getDescription());
            if (file != null && file.getSize() > 0) {
                ServletContext con = ses.getServletContext();
                String path = con.getRealPath("") + "/images/news";
                String ext = FilenameUtils.getExtension(file.getOriginalFilename());
                String filename = UUID.randomUUID().toString();
                File f1 = new File(path + "/" + filename + "." + ext);
                file.transferTo(f1);
                ne.setPhotos(filename + "." + ext);
            }
            Category category = cr.findById(id).get();
            ne.setCategory(category);
            nr.save(ne);
            return "redirect:/manage";
        } else {
            return "redirect:/cpanel";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession ses) {
        ses.invalidate();
        return "redirect:/cpanel";
    }

    @RequestMapping("/addcategory")
    public String category() {
        return "addcategory";
    }

    @RequestMapping("/_addcategory")
    public String registercategory(@ModelAttribute("Category") Category cate, Model md,HttpSession ses) {
        if(ses.getAttribute("username")!=null) {
            cr.save(cate);
            return "redirect:/addcategory";
        }
        else
        {
            return "redirect:/cpanel";
        }
    }
}
