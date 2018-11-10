package skhu.dto;

import java.util.List;

public class Student {
	int id;
	String studentNumber;
	String password;
	String name;
	int year;
	int semester;
	int departmentId;
	Department department;
	String email;
	String graduation;
	String minor;
	String doubleMajor;
	int majorEssential;
	int liberalEssential;
	List<Action> actions;
	Action action;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGraduation() {
		return graduation;
	}
	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}
	public String getMinor() {
		return minor;
	}
	public void setMinor(String minor) {
		this.minor = minor;
	}
	public String getDoubleMajor() {
		return doubleMajor;
	}
	public void setDoubleMajor(String doubleMajor) {
		this.doubleMajor = doubleMajor;
	}
	public int getMajorEssential() {
		return majorEssential;
	}
	public void setMajorEssential(int majorEssential) {
		this.majorEssential = majorEssential;
	}
	public int getLiberalEssential() {
		return liberalEssential;
	}
	public void setLiberalEssential(int liberalEssential) {
		this.liberalEssential = liberalEssential;
	}
	public List<Action> getActions() {
		return actions;
	}
	public void setActions(List<Action> actions) {
		this.actions = actions;
	}
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}

}
