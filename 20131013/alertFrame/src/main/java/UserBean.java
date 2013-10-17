
public class UserBean {
	private long userId;
	private String name;
	private UserBean manager;
	
	public UserBean(long id, String name, UserBean manager) {
		this.userId = id;
		this.name = name;
		this.manager = manager;
	}
	
	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", name=" + name + "]";
	}

	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public UserBean getManager() {
		return manager;
	}
	public void setManager(UserBean manager) {
		this.manager = manager;
	}
}