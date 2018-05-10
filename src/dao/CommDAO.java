package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import util.SimpleDataSource;

public class CommDAO {

	public Connection getConn() {
		Connection conn = null;
		try {
			conn = SimpleDataSource.instance().getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public int getInt(String sql) {
		int i = 0;
		Connection conn = getConn();
		Statement st = null;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				i = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				SimpleDataSource.freeConnection(conn);
				if (null != st) {
					st.close();
				}

			} catch (Exception e) {

			}

		}
		return i;
	}

	public double getDouble(String sql) {
		double i = 0;
		Connection conn = getConn();
		Statement st = null;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				i = rs.getDouble(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != conn) {
					conn.close();
				}
				if (null != st) {
					st.close();
				}

			} catch (Exception e) {

			}

		}
		return i;
	}

	public void commOper(String sql) {
		Connection conn = getConn();
		Statement st = null;
		try {
			st = conn.createStatement();
			st.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				SimpleDataSource.freeConnection(conn);
				if (null != st) {
					st.close();
				}

			} catch (Exception e) {

			}

		}
	}

	public void commOperSqls(ArrayList<String> sql) {
		Connection conn = getConn();
		Statement st = null;
		try {
			conn.setAutoCommit(false);
			for (int i = 0; i < sql.size(); i++) {
				st = conn.createStatement();

				st.execute(sql.get(i));
				st.close();
			}
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				SimpleDataSource.freeConnection(conn);
				if (null != st) {
					st.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<HashMap> select(String sql) {
		int END = Integer.MAX_VALUE;
		int START = END - 100;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		List<HashMap> list = new ArrayList();
		Connection conn = getConn();
		Statement st = null;
		try {
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				HashMap map = new HashMap();
				int i = rsmd.getColumnCount();
				for (int j = 1; j <= i; j++) {
					if (!rsmd.getColumnName(j).equals("ID")) {

						map.put(rsmd.getColumnName(j),
								rs.getString(j) == null ? "" : rs.getString(j));
					} else {

						map.put("id", rs.getString(j));
					}
				}
				list.add(map);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("--" + sql);
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				SimpleDataSource.freeConnection(conn);
				if (null != st) {
					st.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	/**
	 * 执行一条查询sql,以 List<hashmap> 的形式返回查询的记录，记录条数，和从第几条开始，由参数决定，主要用于翻页 pageno 页码
	 * rowsize 每页的条数
	 */
	public List select(String sql, int pageno, int rowsize) {
		List<HashMap> list = new ArrayList<HashMap>();
		List<HashMap> mlist = new ArrayList<HashMap>();
		try {
			list = this.select(sql);
			int min = (pageno - 1) * rowsize;
			int max = pageno * rowsize;

			for (int i = 0; i < list.size(); i++) {

				if (!(i < min || i > (max - 1))) {
					mlist.add(list.get(i));
				}
			}
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		}

		return mlist;
	}

	// 该方法返回一个table 用于流动图片
	public String DynamicImage(String categoryid, int cut, int width, int height) {

		StringBuffer imgStr = new StringBuffer();
		StringBuffer thePics1 = new StringBuffer();
		StringBuffer theLinks1 = new StringBuffer();
		StringBuffer theTexts1 = new StringBuffer();

		imgStr.append("<div id=picViwer1 align=center></div><SCRIPT src='/databasesys/js/dynamicImage.js' type=text/javascript></SCRIPT>\n<script language=JavaScript>\n");
		thePics1.append("var thePics1=\n'");
		theLinks1.append("var theLinks1='");
		theTexts1.append("var theTexts1='");

		List<HashMap> co = this
				.select("select * from  news where title!='系统简介计算机课程管理系统' and  title!='毕业设计栏目管理' order by id desc",
						1, 6);
		int j = 0;
		int i = co.size();
		for (HashMap b : co) {
			j++;
			String id = b.get("id").toString();
			String title = b.get("title").toString();

			String url = "/databasesys/upfile/" + b.get("picurl");

			String purl = "";

			if (j != i) {
				thePics1.append(url.replaceAll("\n", "") + "|");
				theLinks1.append(purl + "|");
				theTexts1.append(title + "|");
			}
			if (j == i) {
				thePics1.append(url.replaceAll("\n", ""));
				theLinks1.append("#");
				theTexts1.append(title);
			}

		}
		thePics1.append("';");

		theLinks1.append("';");
		theTexts1.append("';");
		imgStr.append(thePics1 + "\n");
		imgStr.append(theLinks1 + "\n");
		imgStr.append(theTexts1 + "\n");
		imgStr.append("\n setPic(thePics1,theLinks1,theTexts1," + width + ","
				+ height + ",'picViwer1');</script>");
		return imgStr.toString();
	}

	public static void main(String[] args) {
		System.out.println(new CommDAO());
	}
}
