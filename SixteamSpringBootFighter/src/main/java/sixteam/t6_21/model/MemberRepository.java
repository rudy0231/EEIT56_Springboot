package sixteam.t6_21.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository  extends JpaRepository<MemberBean, Integer>{
	
	public MemberBean findBymemberId(int memberId);
	public MemberBean findByMemberAccountAndMemberPassword(String username,String password);
	public Optional<MemberBean> findBymemberAccount(String username);
	}
