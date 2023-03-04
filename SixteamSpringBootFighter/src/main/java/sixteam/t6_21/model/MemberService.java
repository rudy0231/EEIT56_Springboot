package sixteam.t6_21.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberRepository mRepo;
	
	public boolean checkLogin(MemberBean accountManager) {
		String name = accountManager.getMemberAccount();
		String pwd = accountManager.getMemberPassword();
		MemberBean resultBean = mRepo.findByMemberAccountAndMemberPassword(name,pwd);
		if(resultBean!=null) {
			return true;
		}
		return false;
	} 
	
	public MemberBean findBymemberAccount(String username) {
		Optional<MemberBean> mb = mRepo.findBymemberAccount(username);
		MemberBean m1 = null;
		if(mb.isPresent()) {
			m1 = mb.get();
		}
		return m1;
	}
	public MemberBean findBymemberId(int memberId) {
		return mRepo.findBymemberId(memberId);
	}
}
