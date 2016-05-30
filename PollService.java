package wsdassignment2.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import wsdassignment2.*;

@Path("/pollApp")
public class PollService {
	@Context
	private ServletContext application;

	private PollApplication getPollApp() throws JAXBException, IOException {
		synchronized (application) {
			PollApplication pollApp = (PollApplication)application.getAttribute("pollApp");
			if (pollApp == null) {
				pollApp = new PollApplication();
				pollApp.setFilePath(application.getRealPath("WEB-INF/polls.xml"));
				application.setAttribute("pollApp", pollApp);
			}
			return pollApp;
		}
	}

	@GET
	@Path("hello")
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
	 return "Hello World";
	}
	
	@GET
	@Path("polls")
	@Produces(MediaType.APPLICATION_XML)
	public Polls getPoll() throws JAXBException, IOException {
		return getPollApp().getPolls();
	}
	

	@GET
	@Path("polls/{user}")
	@Produces(MediaType.APPLICATION_XML)
	public Poll getPoll(@PathParam("user") String user) throws JAXBException,
			IOException {
		return getPollApp().getPolls().findByUser(user); 
	}
	
}
