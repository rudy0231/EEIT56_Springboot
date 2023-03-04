package sixteam.t6_21.controller;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.RegistDate;
import sixteam.t6_10.securitymodel.RegistDateService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_14.model.Actives;
import sixteam.t6_14.model.ActivesServiceImpl;
import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;

@Controller
public class t6indexController {
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private MyUserDetailsService uService;
	
	@Autowired
	private RegistDateService rService;
	@Autowired
	private ActivesServiceImpl activesService;
	
	@RequestMapping("/welcomeToIndex")
	public String processAction(Model m) {
		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		List<Actives> actives=activesService.findAll();
		Collections.shuffle(actives);
		m.addAttribute("actives",actives.subList(0, 4));
		return "front_index";
	}
	
	@Secured({"ROLE_ADMIN","ROLE_USER"})//先開都可登 之後刪
	@RequestMapping("/toBackIndex")
	public String toBackIndex(Model m) {
		return "redirect:/index-background.jsp";
	}
	
	@RequestMapping("/loginToIndex")
	public String loginToIndex(Principal pc1,Model m, HttpServletRequest request, HttpSession session) {
		System.out.println("======== 1 =======");
		User user = uService.showUser(pc1.getName());
		System.out.println("======== 2 =======");
		RegistDate registDate = rService.addUser(user.getId());
		System.out.println("======== 3 =======");
		System.out.println(registDate);
		session.setAttribute("LoginOK", user);
		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		return "front_index";
	}
	
	@Secured({"ROLE_ADMIN","ROLE_USER"})
	@RequestMapping("/loginToProfile")
	public String loginToProfile(Principal pc1,Model m, HttpServletRequest request, HttpSession session) {
		User user = uService.showUser(pc1.getName());
		RegistDate registDate = rService.addUser(user.getId());
		m.addAttribute("registDate",registDate);
		session.setAttribute("LoginOK", user);
		m.addAttribute("user",user);
		return "t6_10/profile";
	}

}
