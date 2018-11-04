package skhu.dto;

import java.util.List;

public class Department {
	int id;
	String name;
	int collegeId;
	College college;
	List<GraduationGrade> graduationGrades;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCollegeId() {
		return collegeId;
	}
	public void setCollegeId(int collegeId) {
		this.collegeId = collegeId;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	public List<GraduationGrade> getGraduationGrades() {
		return graduationGrades;
	}
	public void setGraduations(List<GraduationGrade> graduationGrades) {
		this.graduationGrades = graduationGrades;
	}
}
