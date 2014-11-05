using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
   
    [WebMethod]
    public static List<Data> GetData()
    {
        Data data1 = new Data("X", 1);
        Data data2 = new Data("Y", 2);

        Data data3 = new Data("X", 1);
        Data data4 = new Data("Y", 2);

        List<Data> dataList = new List<Data>();

        dataList.Add(data1);
        dataList.Add(data2);
        dataList.Add(data3);
        dataList.Add(data4);

        return dataList;
    }
}
public class Data
{
    public string ColumnName = "";
    public int Value = 0;

    public Data(string columnName, int value)
    {
        ColumnName = columnName;
        Value = value;
    }
}    
  