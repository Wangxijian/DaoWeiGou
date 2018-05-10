package util;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SimpleDataSource implements DataSource {
	private static Log log = LogFactory.getLog(SimpleDataSource.class);
	private static final String dirverClassName = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/daoweigou_db";
	private static final String user = "root";
	private static final String pswd = "123456";
	// 连接池
	private static List<Connection> pool = Collections
			.synchronizedList(new ArrayList<Connection>());
	private static SimpleDataSource instance = new SimpleDataSource();

	static {
		try {
			Class.forName(dirverClassName);
		} catch (ClassNotFoundException e) {
			log.error("找不到驱动类！", e);
		}
	}

	private SimpleDataSource() {
	}

	/**
	 * 获取数据源单例
	 * 
	 * @return 数据源单例
	 */
	public static SimpleDataSource instance() {
		if (instance == null)
			instance = new SimpleDataSource();
		return instance;
	}

	/**
	 * 获取一个数据库连接
	 * 
	 * @return 一个数据库连接
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException {
		synchronized (pool) {
			if (pool.size() > 0)
				return pool.get(0);
			else
				return makeConnection();
		}
	}

	/**
	 * 连接归池
	 * 
	 * @param conn
	 */
	public static void freeConnection(Connection conn) {
		pool.add(conn);
	}

	private Connection makeConnection() throws SQLException {
		return DriverManager.getConnection(url, user, pswd);
	}

	public Connection getConnection(String username, String password)
			throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}

	public PrintWriter getLogWriter() throws SQLException {
		return null;
	}

	public void setLogWriter(PrintWriter out) throws SQLException {

	}

	public void setLoginTimeout(int seconds) throws SQLException {

	}

	public int getLoginTimeout() throws SQLException {
		return 0;
	}

	public <T> T unwrap(Class<T> iface) throws SQLException {
		return null;
	}

	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		return false;
	}
}
