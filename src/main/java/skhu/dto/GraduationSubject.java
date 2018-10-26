package skhu.dto;

import java.time.Year;

public class GraduationSubject {
	int id;
	Year year;
	int departmentId;
	Department department;
	int graduationId;
	Graduation graduation;
	int subjectId;
	Subject subject;
	int semester;
	String note;
	boolean essential;
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
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public boolean isEssential() {
		return essential;
	}
	public void setEssential(boolean essential) {
		this.essential = essential;
	}
}
