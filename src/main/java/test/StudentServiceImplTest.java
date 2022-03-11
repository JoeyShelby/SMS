//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package test;

import org.junit.Test;
import pojo.Student;
import service.impl.StudentServiceImpl;

import java.util.List;

public class StudentServiceImplTest extends StudentServiceImpl {
    public StudentServiceImplTest() {
    }

    @Test
    public void testAddStudent() {
    }

    @Test
    public void testQueryStudentByNum() {
        System.out.println(this.queryStudentByNum(100));
    }

    @Test
    public void testDeleteStudent() {
    }

    @Test
    public void testQueryStudentsByName() {
       Student students = queryStudentsByName("乔义");
        System.out.println(students);
    }

    @Test
    public void testUpdateStudent() {
    }
}
