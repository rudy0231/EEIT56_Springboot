package sixteam.t6_21.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import sixteam.t6_21.model.ClassBean;
import sixteam.t6_21.model.ClassService;

@Controller
public class ClassShowController {
	
	@Autowired
	private ClassService classService;
	
	@GetMapping("/showClassDetail.controller/{classId}")
	public String processAction(@PathVariable("classId") int classId, Model m) {

		ClassBean cb = classService.findById(classId);
		m.addAttribute("bean", cb);
		return "t6_21/ClassDetail";
	}
	
	@GetMapping("/showAllClass.controller")
	public String processAction(Model m) {

		List<ClassBean> classlist = classService.findAll();
		m.addAttribute("classList", classlist);
		return "t6_21/ClassList";
	}


}
