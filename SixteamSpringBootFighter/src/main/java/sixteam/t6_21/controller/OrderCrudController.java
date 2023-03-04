package sixteam.t6_21.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sixteam.t6_21.model.OrderBean;
import sixteam.t6_21.model.OrderService;



@Controller
public class OrderCrudController {
	@Autowired
	private OrderService oService;
	
	@RequestMapping(path = "/t6_21OrderMaintain.controller")
	public String processAction(Model m) {

		List<OrderBean> orderList = oService.findAll();
		m.addAttribute("orderList", orderList);
		return "t6_21/OrderMaintainList";
	}
}
