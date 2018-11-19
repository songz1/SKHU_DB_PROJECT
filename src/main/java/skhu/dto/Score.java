package skhu.dto;

public class Score {
	int id;
	int studentId;
	Student student;
	int subjectId;
	Subject subject;
	double score;
	boolean majorAdmit;
	String substitutionCode;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
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
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public boolean isMajorAdmit() {
		return majorAdmit;
	}
	public void setMajorAdmit(boolean majorAdmit) {
		this.majorAdmit = majorAdmit;
	}
	public String getSubstitutionCode() {
		return substitutionCode;
	}
	public void setSubstitutionCode(String substitutionCode) {
		this.substitutionCode = substitutionCode;
	}
	@Override
	public String toString() {
		return "Score [id=" + id + ", studentId=" + studentId + ", student=" + student + ", subjectId=" + subjectId
				+ ", subject=" + subject + ", score=" + score + ", majorAdmit=" + majorAdmit + ", substitutionCode="
				+ substitutionCode + "]";
	}
	
}
