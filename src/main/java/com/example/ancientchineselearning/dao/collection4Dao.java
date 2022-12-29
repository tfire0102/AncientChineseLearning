package com.example.ancientchineselearning.dao;

import com.example.ancientchineselearning.domain.Collection;
import com.example.ancientchineselearning.domain.Poetry;
import com.example.ancientchineselearning.tools.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class collection4Dao {
    public static List<Collection> getPoemListByID(int antID) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        List<Collection> collectionList = new ArrayList<>();

        String sql = "select * from poetry, collection " +
                "where pty_rid=cln_pty and cln_acn=?";

        try {
            pstmt = cont.prepareStatement(sql);
            pstmt.setInt(1, antID);
            res = pstmt.executeQuery();
            while (res.next()) {
                Collection collection = new Collection();
                Poetry poetry = new Poetry();

                collection.setRid(res.getInt("cln_rid"));
                poetry.setRid(res.getInt("cln_pty"));
                poetry.setTitle(res.getString("pty_ttl"));
                poetry.setNumOfLike(res.getInt("pty_rec"));
                collection.setPoetry(poetry);

                collectionList.add(collection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return  collectionList;
    }
}
