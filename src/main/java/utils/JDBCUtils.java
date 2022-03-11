package utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbutils.DbUtils;

public class JDBCUtils {
    private static DataSource dataSource = null;

    public JDBCUtils() {
    }

    public static Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException var1) {
            var1.printStackTrace();
            return null;
        }
    }

    public static void closeResource(Connection connection) {
        DbUtils.closeQuietly(connection);
    }

    static {
        try {
            Properties properties = new Properties();
            InputStream resource = JDBCUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            properties.load(resource);
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException var2) {
            var2.printStackTrace();
        } catch (Exception var3) {
            var3.printStackTrace();
        }

    }
}
