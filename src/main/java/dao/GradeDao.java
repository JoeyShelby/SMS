//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dao;

import java.sql.Connection;
import java.util.List;

import pojo.Grade;
import pojo.StudentGrade;

public interface GradeDao {
    int addGrade(Connection var1, Grade var2);

    int deleteGrade(Connection var1);

    int updateGrade(Connection var1, Grade var2);

    Grade queryGrade(Connection var1);

}
