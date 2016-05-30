package wsdassignment2;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class PollApplication implements Serializable {

	private String filePath;
	private Polls polls;
	
	
public PollApplication() {
		super();
		// TODO Auto-generated constructor stub
	}


public PollApplication(String filePath, Polls polls) {
	super();
	this.filePath = filePath;
	this.polls = polls;
}


public String getFilePath() {
	return filePath;
}


public void setFilePath(String filePath) throws JAXBException, IOException {
	this.filePath = filePath;
	
	//Load the polls from poll.xml
	JAXBContext jc = JAXBContext.newInstance(Polls.class);
	Unmarshaller u = jc.createUnmarshaller();
	FileInputStream fin = new FileInputStream(filePath);
	polls = (Polls)u.unmarshal(fin);
	fin.close();
}


public Polls getPolls() {
	return polls;
}


public void setPolls(Polls polls) {
	this.polls = polls;
}
	
public void savePolls() throws JAXBException, FileNotFoundException {
	JAXBContext jc = JAXBContext.newInstance(Polls.class);
	  Marshaller m = jc.createMarshaller();
	  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	  m.marshal(polls, new FileOutputStream("polls.xml"));
}
	
}
