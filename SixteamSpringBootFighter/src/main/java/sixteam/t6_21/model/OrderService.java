package sixteam.t6_21.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class OrderService {
	@Autowired
	private OrderRepository oRepo;
//	@Autowired
//	private OrderItemRepository oiRepo;
	
	public OrderBean insert(OrderBean ob) {
		return oRepo.save(ob);
	}
	
	public OrderBean findByorderNumber(int orderNumber) {
		Optional<OrderBean> ob = oRepo.findById(orderNumber);
		
		OrderBean o1 = null;
		if(ob.isPresent()) {
			o1 = ob.get();
		}
		return o1;
	}
	
	public List<OrderBean> findMemberOrder(int memberId) {
		return oRepo.findByMemberId(memberId);
		
	}
	
	public List<OrderBean> findAll(){
		return oRepo.findAll();
	}
	
	public void deleteByorderNumber(Integer orderNumber) {
		 oRepo.deleteByorderNumber(orderNumber);
	}
	
	public int updatePaymentStatus(int orderNumber) {
		return oRepo.updatePaymentStatus(orderNumber);
	}

}
