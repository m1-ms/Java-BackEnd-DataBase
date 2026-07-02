import Relationship.Language;
import Relationship.Teacher;

import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {

        // Language
        Language english = new Language();
        english.id = 1L;
        english.name = "English";

        // Teachers
        Teacher teacher1 = new Teacher();
        teacher1.id = 1L;
        teacher1.name = "Ahmed";
        teacher1.salary = 5000.0;

        Teacher teacher2 = new Teacher();
        teacher2.id = 2L;
        teacher2.name = "Ali";
        teacher2.salary = 6000.0;

        // Teacher > Language
        teacher1.language = english;
        teacher2.language = english;

        // Language > Teachers
        List<Teacher> teachers = new ArrayList<>();
        teachers.add(teacher1);
        teachers.add(teacher2);

        english.teachers = teachers;

        System.out.println(teacher1.language.name);
        System.out.println(teacher2.language.name);

        System.out.println(" ---------------- ");

        System.out.println(english.teachers.get(0).name);
        System.out.println(english.teachers.get(1).name);
    }
}