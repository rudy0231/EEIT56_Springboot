package sixteam.t6_21.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderItemService {
	@Autowired
	private OrderItemRepository oRepo;
	
	public OrderItemBean insert(OrderItemBean ob) {
		return oRepo.save(ob);
	}
	
	public List<OrderItemBean> findByorderNumber(int orderNumber) {
		
		return oRepo.findByorderNumber(orderNumber);
	}
	
	//檢查訂單庫存量

	
}
