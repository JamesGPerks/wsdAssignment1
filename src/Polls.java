package wsdassignment2;

import java.util.*;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="polls")
public class Polls {
	
	@XmlElement(name = "poll")
	private ArrayList<Poll> list = new ArrayList<Poll>();
	
	public ArrayList<Poll> getList(){
		return list;
	}
	
	public Poll getUserPolls(String username){
		for (Poll poll: list){
			if(poll.getUser().equalsIgnoreCase(username))
				return poll;
		}
		return null;
	}

	public Poll getStatusPolls(String status){
		for (Poll poll: list){
			if(poll.getStatus().equals(status))
				return poll;
		}
		return null;
	}
	
	public Polls() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    public Polls(ArrayList<Poll> list) {
        super();
        this.list = list;
    }

    public void addPoll(Poll poll) {
        list.add(poll);
    }

    public void removePolls(Poll poll) {
        list.remove(poll);

    }
}
