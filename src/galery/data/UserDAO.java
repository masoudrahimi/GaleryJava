package galery.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by masaoud on 17/11/2017.
 */
public class UserDAO {
    public UserDAO()
    {}
    public boolean isExist(String userName,String password) throws Exception
    {

        DataBase dataBase = new DataBase();
        Connection connection =dataBase.connection;
        String sql = "SELECT * FROM user WHERE UserName=? AND  Password=?";
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2,password);
            preparedStatement.execute();
            ResultSet result = preparedStatement.getResultSet();
            if(result.next())
            {
                return true;
            }
            else
                return (false);
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return false;
    }
}
