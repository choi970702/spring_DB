package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class DAO 
{
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	private static DAO dao = new DAO();
	
	public static DAO getInstance()
	{
		return dao;
	}
	
	// DB 접속
	public Connection getConnection()
	{
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.0.9:1521:xe";
			String user = "c##choi970702";
			String password = "chl147258";
			conn = DriverManager.getConnection(url,user, password);
		} catch (Exception e) 
		{
			System.out.println(e+"1");
		}
		return conn;
	}
	
	
	// list 가져오기
	public List<VO> getList()
	{
		List<VO> list = null;
		try 
		{
			conn = getConnection();
			String sql = "select * from members order by idx";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) 
			{
				VO vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setReg(rs.getString("reg").substring(0, 10));
				list.add(vo);
			}
			
		} catch (Exception e) 
		{
			System.out.println(e+"2");
		}finally
		{
			try 
			{
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) 
			{
				System.out.println(e2+"3");
			}
		}
		return list;
	}
	
	
	
	
}




