package skhu.dto;

import java.time.Year;

public class CompleteScore {
	int id;
	Year year;
	int grade;
	int score;
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
