package sixteam.t6_21.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderRepository extends JpaRepository<OrderBean, Integer>{
	
	public List<OrderBean> findByMemberId(int memberId);
	
	public OrderBean findByorderNumber(int orderNumber);
	public void deleteByorderNumber(Integer orderNumber);
	@Modifying
	@Query("UPDATE OrderBean o SET o.paymentStatus = '已付款' WHERE o.orderNumber = :orderNumber")
	public int updatePaymentStatus(@Param("orderNumber")int orderNumber);
}
