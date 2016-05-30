package wsdassignment2;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;

public class userApplication implements Serializable {

	private String filePath;
	private Users users;
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) throws IOException, JAXBException {
		this.filePath = filePath;
		
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Unmarshaller u = jc.createUnmarshaller();
		FileInputStream fin = new FileInputStream(filePath);
		users = (Users)u.unmarshal(fin); // 
		fin.close();
		
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
}