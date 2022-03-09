/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Rect;

/**
 *
 * @author Sap-lap
 */
public class RectDBContext extends DBContext {
    public ArrayList<Rect> getRects()
    {
        ArrayList<Rect> rects = new ArrayList<>();
        try {
            String sql = "SELECT id,x,y,w,h FROM Rect";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Rect r = new Rect();
                r.setX(rs.getInt("x"));
                r.setY(rs.getInt("y"));
                r.setW(rs.getInt("w"));
                r.setH(rs.getInt("h"));
                rects.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rects;
    }
}
