package com.example.jspcrud.dao;

import com.example.jspcrud.bean.myStoreVO;
import com.example.jspcrud.utill.MariaDBUtill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class myStoreDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String myStore_INSERT = "insert into myStore(manager, floor, name, seller, ordering, price, remain) values(?,?,?,?,?,?,?)";
    private final String myStore_UPDATE = "update myStore set manager=?, floor=?, name=?, seller=?, ordering=?,price=?,remain=? where id=?";
    private final String myStore_DELETE = "delete from myStore where id=?";
    private final String myStore_GET = "select * from myStore where id=?";
    private final String myStore_LIST = "select * from myStore order by id desc";
    public int insertMyStore(myStoreVO vo){
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try{
            conn = MariaDBUtill.getConnection();
            stmt = conn.prepareStatement(myStore_INSERT);
            stmt.setString(1, vo.getManager());
            stmt.setInt(2, vo.getFloor());
            stmt.setString(3, vo.getName());
            stmt.setString(4, vo.getSeller());
            stmt.setString(5, vo.getOrdering());
            stmt.setString(6, vo.getPrice());
            stmt.setInt(7, vo.getRemain());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    // 글 삭제
    public void deleteMyStore(myStoreVO vo) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            conn = MariaDBUtill.getConnection();
            stmt = conn.prepareStatement(myStore_DELETE);
            stmt.setInt(1, vo.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateMyStore(myStoreVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            conn = MariaDBUtill.getConnection();
            stmt = conn.prepareStatement(myStore_UPDATE);
            stmt.setString(1, vo.getManager());
            stmt.setInt(2, vo.getFloor());
            stmt.setString(3, vo.getName());
            stmt.setString(4, vo.getSeller());
            stmt.setString(5, vo.getOrdering());
            stmt.setString(6, vo.getPrice());
            stmt.setInt(7, vo.getRemain());
            stmt.setInt(8, vo.getId());


            System.out.println(vo.getManager()+"-"+ vo.getFloor() + "-" + vo.getName() + "-" + vo.getSeller() + "-"
                    + vo.getOrdering()+vo.getPrice()+"-"+vo.getRemain() + "-" + vo.getId());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public myStoreVO getMyStore(int seq) {
        myStoreVO one = new myStoreVO();
        System.out.println("===> JDBC로 getBoard() 기능 처리");
        try {
            conn = MariaDBUtill.getConnection();
            stmt = conn.prepareStatement(myStore_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setId(rs.getInt("id"));
                one.setManager(rs.getString("manager"));
                one.setFloor(rs.getInt("floor"));
                one.setName(rs.getString("name"));
                one.setSeller(rs.getString("seller"));
                one.setOrdering(rs.getString("ordering"));
                one.setPrice(rs.getString("price"));
                one.setRemain(rs.getInt("remain"));
                one.setCnt(rs.getInt("cnt"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<myStoreVO> getMyStoreList(){
        List<myStoreVO> list = new ArrayList<myStoreVO>();
        System.out.println("===> JDBC로 getBoardList() 기능 처리");
        try {
            conn = MariaDBUtill.getConnection();
            stmt = conn.prepareStatement(myStore_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                myStoreVO one = new myStoreVO();
                one.setId(rs.getInt("id"));
                one.setManager(rs.getString("manager"));
                one.setFloor(rs.getInt("floor"));
                one.setName(rs.getString("name"));
                one.setSeller(rs.getString("seller"));
                one.setOrdering(rs.getString("ordering"));
                one.setPrice(rs.getString("price"));
                one.setRemain(rs.getInt("remain"));
                one.setRegdate(rs.getDate("regdate"));
                one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}