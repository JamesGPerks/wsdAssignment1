package wsdassignment2;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;


@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable {
	
	private String title;
	private String user;
	private String date;
	private String location;
	private String description;
	private String time;
	private String responses;
	private String status;
	
	public Poll() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Poll(String title, String user, String date, String location, String description, String time, String status, String responses) {
		super();
		this.title = title;
		this.user = user;
		this.date = date;
		this.location = location;
		this.description = description;
		this.time = time;
		this.status = status;
		this.responses= responses;
	}

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getResponses() {
		return responses;
	}
	
	public void setResponses(String responses) {
		this.responses = responses;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
