package cn.edu.nyist.ajax.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 
 * @author 南阳德刚版权�?�?,企鹅�?:2855128836<br>
 *         2018�?5�?12日下�?8:00:43<br>
 *         说明:c3p0数据源工具类
 */
public class DsUtil {
	//
	private static ComboPooledDataSource cds = new ComboPooledDataSource();

	public static Connection getConn() throws SQLException {
		return cds.getConnection();
	}
 /**
  * 我们连接池不用时候，要关�?
  *  不用---->web应用停止了：1）应用被从服务器移除�? 2）服务器停止�?
  *  当XXXX,执行�?�?----->事件编程
  */
	public static void close() {
		cds.close();
	}

	public static void free(Statement stmt, Connection conn) {

		if (stmt != null) {

			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {

			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public static void free(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null) {

			try {
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		if (stmt != null) {

			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {

			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
