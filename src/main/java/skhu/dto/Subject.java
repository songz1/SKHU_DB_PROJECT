package skhu.dto;

public class Subject {
	int id;
	int year;
	int semester;
	String code;
	String class0;
	String name;
	Admin admin;
	int professorId;
	int score;
	String division;
	String establish;
	Department department;
	int departmentId;
	Subject_detail subject_detail;
	int detailId;
	String abolish;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClass0() {
		return class0;
	}
	public void setClass0(String class0) {
		this.class0 = class0;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public int getProfessorId() {
		return professorId;
	}
	public void setProfessorId(int professorId) {
		this.professorId = professorId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getEstablish() {
		return establish;
	}
	public void setEstablish(String establish) {
		this.establish = establish;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public Subject_detail getSubject_detail() {
		return subject_detail;
	}
	public void setSubject_detail(Subject_detail subject_detail) {
		this.subject_detail = subject_detail;
	}
	public int getDetailId() {
		return detailId;
	}
	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}
	public String getAbolish() {
		return abolish;
	}
	public void setAbolish(String abolish) {
		this.abolish = abolish;
	} 
	
}
