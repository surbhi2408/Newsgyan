package com.newsgyan.demo.controller;

import com.newsgyan.demo.entity.AllData;
import com.newsgyan.demo.entity.News;
import com.newsgyan.demo.entity.User_details;
import com.newsgyan.demo.entity.User_login;
import com.newsgyan.demo.repository.CategoryRepos;
import com.newsgyan.demo.repository.loginRepos;
import com.newsgyan.demo.repository.newsRepos;
import com.newsgyan.demo.repository.user_detailsRepos;
import com.newsgyan.demo.util.EmailUtil;
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
public class UserController {
    @Autowired
    user_detailsRepos urep;

    @Autowired
    EmailUtil em;

    @Autowired
    loginRepos lr;

    @Autowired
    newsRepos nnr;

    @Autowired
    CategoryRepos cr;

    @RequestMapping("/show")
    public String show()
    {
        return "login";
    }

    @RequestMapping("/reg")
    public String reg()
    {
        return "register";
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute("AllData")AllData ad, Model md, HttpSession ses, @RequestParam("file")MultipartFile file) throws IOException {
        if(urep.findByEmail(ad.getEmail())==null)
        {
            if(lr.findByUsername(ad.getUsername())==null)
            {
                ServletContext servlet = ses.getServletContext();
                String path = servlet.getRealPath("")+"/images/user";
                String ext = FilenameUtils.getExtension(file.getOriginalFilename());
                String filename = UUID.randomUUID().toString();
                File f1 = new File(path+"/"+filename+"."+ext);
                file.transferTo(f1);
                User_details ud = new User_details(0,ad.getName(),ad.getAddress(),ad.getPhone(),ad.getGender(),ad.getEmail(),filename+"."+ext);
                User_login ul = new User_login(0,ad.getUsername(),ad.getPassword(),0,0);
                urep.save(ud);
                lr.save(ul);
                return "redirect:/show";
            }
            else
            {
                md.addAttribute("msg","username is already taken");
                return "register";
            }
        }
        else
        {
            md.addAttribute("msg","email is already taken");
            return "register";
        }
    }

    @RequestMapping("/login")
    public String loging(@ModelAttribute("User_login")User_login ul,Model md,HttpSession ses)
    {
        User_login aa = lr.findByUsername(ul.getUsername());
        User_login us = lr.findByUsernameAndPassword(ul.getUsername(),ul.getPassword());
        if(us!=null)
        {
            ses.setAttribute("username",ul.getUsername());
            ses.setAttribute("password",ul.getPassword());
            if(us.getStatus()==1)
            {
                md.addAttribute("msg","your id is blocked.please contact admin panel");
                return "login";
            }
            else
            {
                ul.setId(aa.getId());
                ul.setAttempt(0);
                lr.save(ul);
                User_details ud = urep.findById(us.getId());
                md.addAttribute("ud",ud);
                md.addAttribute("cat",cr.findAll());
                return "home";
            }
        }
        else
        {
            if(aa.getAttempt()>=3)
            {
                ul.setPassword(aa.getPassword());
                ul.setUsername(aa.getUsername());
                ul.setId(aa.getId());
                ul.setStatus(1);
                ul.setAttempt(0);
                lr.save(ul);
                md.addAttribute("msg","your id has been blocked");
                return "login";
            }
            else
            {
                ul.setPassword(aa.getPassword());
                ul.setUsername(aa.getUsername());
                ul.setId(aa.getId());
                ul.setAttempt(aa.getAttempt()+1);
                lr.save(ul);
            }
            md.addAttribute("msg","login failed");
            return "login";
        }
    }

    @RequestMapping("/forget")
    public String forget(HttpSession ses)
    {
        if(ses.getAttribute("username")!=null) {
            return "email";
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("emsend")
    public String emsend(@RequestParam("email") String email, HttpSession ses,Model md)
    {
        if(ses.getAttribute("username")!=null) {
            int code = (int) (Math.random() * 1000000);
            ses.setAttribute("email", email);
            ses.setAttribute("code", code);
            if (urep.findByEmail(email) == null) {
                md.addAttribute("msg", "this email doesnot exist or invalid email");
                return "email";
            } else {
                em.sendEmail(email, code);
                return "code";
            }
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("submitcode")
    public String submitcode(@RequestParam("code")int code,Model md,HttpSession ses)
    {
        if(ses.getAttribute("username")!=null) {
            int code1 = Integer.parseInt(ses.getAttribute("code").toString());
            if (code == code1) {
                return "reset";
            } else {
                md.addAttribute("msg", "wrong verification code");
                return "code";
            }
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("/resetpass")
    public String reset(@RequestParam("pass")String pass,@RequestParam("pass1")String pass1,HttpSession ses,Model md)
    {
        if(ses.getAttribute("username")!=null) {
            if (pass.equals(pass1)) {
                String email = ses.getAttribute("email").toString();
                User_details ud = urep.findByEmail(email);
                User_login ul = lr.findById(ud.getId()).get();
                ul.setPassword(pass);
                lr.save(ul);
                return "login";
            } else {
                md.addAttribute("msg", "password doesnot match");
                return "reset";
            }
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("/home")
    public String home(Model md,HttpSession ses)
    {
        if(ses.getAttribute("username")!=null)
        {
            String username = ses.getAttribute("username").toString();
            User_login us = lr.findByUsername(username);
            User_details ud = urep.findById(us.getId());
            md.addAttribute("ud",ud);
            md.addAttribute("cat",cr.findAll());
            return "home";
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("/log")
    public String log(HttpSession ses)
    {
        ses.invalidate();
        return "redirect:/show";
    }

    @RequestMapping("/profile")
    public String profile(Model md,HttpSession ses)
    {
        if(ses.getAttribute("username")!=null)
        {
            String username = ses.getAttribute("username").toString();
            User_login us = lr.findByUsername(username);
            User_details ud = urep.findById(us.getId());
            md.addAttribute("ud",ud);
            md.addAttribute("cat",cr.findAll());
            return "profile";
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("/shownew")
    public String shownew(@RequestParam("id") int id,Model md,HttpSession ses)
    {
        if(ses.getAttribute("username")!=null)
        {
            String username = ses.getAttribute("username").toString();
            User_login us = lr.findByUsername(username);
            User_details ud = urep.findById(us.getId());
            List<News> getAll =nnr.getAll(id,1);
            md.addAttribute("list",getAll);
            md.addAttribute("ud",ud);
            md.addAttribute("cat",cr.findAll());
            return "showNews";
        }
        else
        {
            return "redirect:/show";
        }
    }

    @RequestMapping("/finalnews")
    public String finalnews(@RequestParam("id") int id,Model md,HttpSession ses)
    {
        if(ses.getAttribute("username")!=null)
        {
            String username = ses.getAttribute("username").toString();
            User_login us = lr.findByUsername(username);
            User_details ud = urep.findById(us.getId());
            News n = nnr.findById(id).get();
            md.addAttribute("ud",ud);
            md.addAttribute("cat",cr.findAll());
            md.addAttribute("news",n);
            return "final";
        }
        else
        {
            return "redirect:/show";
        }
    }
}
