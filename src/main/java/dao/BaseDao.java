package dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


public abstract class BaseDao {
    private QueryRunner queryRunner = new QueryRunner();

    public BaseDao() {
    }

    public int update(Connection connection, String sql, Object... args) {
        try {
            int var4 = this.queryRunner.update(connection, sql, args);
            return var4;
        } catch (SQLException var8) {
            var8.printStackTrace();
        } finally {
            JDBCUtils.closeResource(connection);
        }

        return -1;
    }

    public <T> T queryForOne(Connection connection, Class<T> type, String sql, Object... args) {
        try {
            return (T) this.queryRunner.query(connection, sql, new BeanHandler(type), args);
        } catch (SQLException var6) {
            var6.printStackTrace();
            return null;
        }
    }

    public <T> List<T> queryForList(Connection connection, Class<T> type, String sql, Object... args) {
        try {
            return (List)this.queryRunner.query(connection, sql, new BeanListHandler(type), args);
        } catch (SQLException var6) {
            var6.printStackTrace();
            return null;
        }
    }

    public Object queryForSingleValue(Connection connection, String sql, Object... args) {
        try {
            return this.queryRunner.query(connection, sql, new ScalarHandler(), args);
        } catch (SQLException var5) {
            var5.printStackTrace();
            return null;
        }
    }
}
