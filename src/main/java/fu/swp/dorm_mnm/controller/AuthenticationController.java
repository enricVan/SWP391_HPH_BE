package fu.swp.dorm_mnm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.User;
import fu.swp.dorm_mnm.repository.UserRepository;
import fu.swp.dorm_mnm.exception.ResourceNotFoundException;


@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/v1/")
public class AuthenticationController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/")
    public String loginPage() {
        return "redirect: login";
    }

    // -- authentication ---
    @GetMapping("/login")
    public String login() {
        return "authentication/login";
    }

    @PostMapping("/login")
    public String submitLogin(HttpServletRequest req, Model model) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Account account = accountService.accountAuthentication(username, password);
        req.getSession().setAttribute("account", account);
        if (account != null) {
            String role = account.getRoles().get(0).getRoleName().toLowerCase(); // student -- teacher
            return "redirect: " + role + "/home";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "authentication/login";
        }
    }

    @RequestMapping("/login_fail")
    public String loginFail() {
        return "authentication/login_fail";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest req) {
        // do something to logout
        req.getSession().removeAttribute("account");
        return "redirect: login";
    }

}