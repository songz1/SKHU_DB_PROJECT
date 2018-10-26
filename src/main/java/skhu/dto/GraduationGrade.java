package skhu.dto;

import java.time.Year;

public class GraduationGrade {
	int id;
	Year year;
	int departmentId;
	Department department;
	int graduationId;
	Graduation graduation;
	String name;
	int score;
	String note;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Year getYear() {
		return year;
	}
	public void setYear(Year year) {
		this.year = year;
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
	public int getGraduationId() {
		return graduationId;
	}
	public void setGraduationId(int graduationId) {
		this.graduationId = graduationId;
	}
	public Graduation getGraduation() {
		return graduation;
	}
	public void setGraduation(Graduation graduation) {
		this.graduation = graduation;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
}
