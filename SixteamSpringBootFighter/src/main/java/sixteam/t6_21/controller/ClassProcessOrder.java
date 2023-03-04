package sixteam.t6_21.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import sixteam.t6_10.securitymodel.MyUserDetailsService;
import sixteam.t6_10.securitymodel.User;
import sixteam.t6_21.model.ClassService;
import sixteam.t6_21.model.MailService;
import sixteam.t6_21.model.OrderBean;
import sixteam.t6_21.model.OrderItemBean;
import sixteam.t6_21.model.OrderItemService;
import sixteam.t6_21.model.OrderService;
import sixteam.t6_21.model.ShoppingCart;

@Controller
@SessionAttributes(names = {"LoginOK","ShoppingCart"})
public class ClassProcessOrder {

	@Autowired
	private OrderService oService;
	@Autowired
	private MyUserDetailsService mService;
	@Autowired
	private OrderItemService orService;
	@Autowired
	private MailService mailService;
	@Autowired
	private ClassService cService;
	
	AllInOne all = new AllInOne("");
	AioCheckOutALL obj = new AioCheckOutALL();
	
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //身分驗證
	@PostMapping("/orderConfirm.controller")
	public String processAction(Principal pc1,HttpServletRequest request, SessionStatus sessionStatus, Model m,HttpSession session) {

		
		String id = obj.getMerchantTradeNo();
		id = id.replace("testsixteam", "");
		int orderNumber = Integer.parseInt(id);
		System.out.println(orderNumber);
		OrderBean obBean = oService.findByorderNumber(orderNumber);
		oService.updatePaymentStatus(orderNumber);
		m.addAttribute("bean", obBean);
		
		int memberId =obBean.getMemberId();
		System.out.println(memberId);
		
		User mbBean = mService.showUser(pc1.getName());

		
		System.out.println(mbBean.toString());		
		
		ShoppingCart sc= (ShoppingCart)session.getAttribute("ShoppingCart");
		User memberBean =  (User) session.getAttribute("LoginOK");
		
		System.out.println("session到底有沒有啦!!!!!");
		System.out.println(sc);
		System.out.println(memberBean);
		
		if (sc != null) {
			session.removeAttribute("ShoppingCart");
			sessionStatus.setComplete();
		}
//		if (memberBean == null) {
//			session.setAttribute("LoginOK", mbBean);
//		}
		List<OrderItemBean> oib = orService.findByorderNumber(orderNumber);
		m.addAttribute("orderItem", oib);
		
		return "t6_21/OrderSuccess";
	}

	
	@Secured({"ROLE_USER","ROLE_ADMIN"}) //身分驗證
	@PostMapping("/payment/checkout")
	@ResponseBody
	public String checkout(Principal pc1,HttpServletRequest request, HttpServletResponse response,@RequestParam("memberAccount") String memberAccount,
			@RequestParam("memberEmail") String memberEmail, @RequestParam("memberPhone") String memberPhone,HttpSession session) throws Exception {
		
		//先insert進資料庫(訂單跟訂單細項)
		User memberBean = (User) session.getAttribute("LoginOK");
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("ShoppingCart");
		Double orderPrice = shoppingCart.getSubtotal();
	
		User mb = mService.showUser(pc1.getName());
		int memberId = mb.getId();
		Date today = new Date();

		// insert進單筆訂單
		OrderBean orderBean = new OrderBean(memberId, memberAccount, memberEmail, memberPhone, today, orderPrice);
		System.out.println(orderBean);
		oService.insert(orderBean);

		int OrderNumber = orderBean.getOrderNumber();
		System.out.println(OrderNumber);
		// 取得到訂單號碼

		// insert進訂單細項的資料表
		Map<Integer, OrderItemBean> content = shoppingCart.getContent();
		// insert進訂單細項
		Collection<OrderItemBean> values = content.values();
		
		for (OrderItemBean oib : values) {
			oib.setOrderNumber(OrderNumber);
			orService.insert(oib);
//			int applicant = oib.getQuantity();
//			int classId = oib.getClassNumber();
//			cService.updateclassApplicant(applicant, classId);
		}
		
		System.out.println("=======================");
		System.out.println(orderBean);
		System.out.println(content);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowTime = sdf.format(today);

		String text="<body>\r\n"
				+ "\r\n"
				+ "<p>非常感謝您使用神明便利店進行購物!</br>\r\n"
				+ "    請確認訂單內容如下:\r\n"
				+ "</p></br>\r\n"
				+ "<p>訂單編號"+"sixteamOrder"+OrderNumber+"</p></br>\r\n"
				+ "<p>訂單時間"+nowTime+"</p></br>\r\n"
				+ "<p>訂購人"+memberAccount+"</p></br>\r\n"
				+ "<p>E-mail:"+memberEmail+"</p></br>\r\n"
				+ "<p>手機號碼:"+memberPhone+"</p></br>\r\n"
				+ "<p>您訂購的課程如下:</p>\r\n";
		
		
		for (OrderItemBean oib : values) {
			text += "<p>"+oib.getDescription()+"x"+oib.getQuantity()+"</p>"
					+ "<p>小計:"+oib.getUnitPrice()+"</p></br>\r\n";
		}
		text += "<p>總金額為:"+shoppingCart.getSubtotal()+"</p>"
				+"<p>謝謝您的購買!</p></br>\r\n"
				+"</body>";
		
//		System.out.println(text);
		
		mailService.prepareAndSend(memberEmail,text);
		System.out.println("寄信成功");
		
		
		obj.setMerchantTradeNo("testsixteam"+OrderNumber);
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount(String.valueOf(Math.round(shoppingCart.getSubtotal())));
		obj.setTradeDesc("test Description");
		obj.setItemName("神明便利店課程");
		obj.setReturnURL("http://localhost:8081/test/checkout");
		obj.setChoosePayment("Credit");
		obj.setOrderResultURL("http://localhost:8081/orderConfirm.controller");
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
}
