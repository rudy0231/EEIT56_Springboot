package sixteam.t6_21.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="member")
public class  MemberBean{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="MEMBERID")
	int memberId;
	@Column(name="MEMBERACCOUNT")
	String memberAccount;
	@Column(name="MEMBERPASSWORD")
	String memberPassword;
	public MemberBean(int memberId, String memberAccount, String memberPassword) {
		super();
		this.memberId = memberId;
		this.memberAccount = memberAccount;
		this.memberPassword = memberPassword;
	}
	public int getMemberId() {
		return memberId;
	}
	
	public MemberBean(String memberAccount, String memberPassword) {
		super();
		this.memberAccount = memberAccount;
		this.memberPassword = memberPassword;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public MemberBean() {
		super();
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberBean [memberId=");
		builder.append(memberId);
		builder.append(", memberAccount=");
		builder.append(memberAccount);
		builder.append(", memberPassword=");
		builder.append(memberPassword);
		builder.append("]");
		return builder.toString();
	}
	

}
