package com.privacy.Interface;

import com.privacy.bean.Register;

public interface Interface {
	
	public int DataOwnerRegister(Register dataOwnReg);
	
	public int DataOwnerLogin(String email, String password);
	
	public int DataUserRegister(Register dataUserRegister);
	
	public int DataUserLogin(String email,String password);

}
