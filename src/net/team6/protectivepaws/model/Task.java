package net.team6.protectivepaws.model;

public class Task {
	
	private Long id;
	private String task;
	private String priority;
	
	
	public Task(Long id, String task, String priority) {
		super();
		this.id = id;
		this.task = task;
		this.priority = priority;
	}

	public Task(String task, String priority) {
		super();
		this.task = task;
		this.priority = priority;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTask() {
		return task;
	}


	public void setTask(String task) {
		this.task = task;
	}


	public String getPriority() {
		return priority;
	}


	public void setPriority(String priority) {
		this.priority = priority;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Task other = (Task) obj;
		if (id != other.id)
			return false;
		return true;
	}

}
