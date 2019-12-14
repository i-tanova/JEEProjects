package tanovai.mvc.model;

import java.util.ArrayList;
import java.util.List;

public class StudentUtil {

	public static List<Student> getStudents(){
		List<Student> result = new ArrayList<Student>();
		result.add(new Student("Ivana", "Tanova"));
		result.add(new Student("Min4o", "Praznikov"));
		return result;
		
		
	}
}
