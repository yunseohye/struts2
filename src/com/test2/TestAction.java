package com.test2;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class TestAction extends ActionSupport
	implements Preparable,ModelDriven<UserDTO>{

	private UserDTO dto;

	public UserDTO getDto() {
		return dto;
	}

	@Override
	public void prepare() throws Exception {
		dto = new UserDTO();
	}

	@Override
	public UserDTO getModel() {
		return dto;
	}
	
	public String created() throws Exception {
		
		//getMode의 위치가 바뀌면 안된다.
		if(dto==null||dto.getMode()==null||dto.getMode().equals("")) {
			return INPUT;
		}
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		request.setAttribute("message", "struts2입니다.");
		
		return SUCCESS;
		
	}

	
}
