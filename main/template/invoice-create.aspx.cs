using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace invoice_task.main.template
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\invoices.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public static SqlConnection GetConnection()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }
        public static void addDataToDb(int i, int item_quantity, decimal item_price)
        {
            using (SqlConnection connection = WebForm1.GetConnection())
            {
                string query = "INSERT INTO pill (Item_name,Quantity,Unit_price,Total) VALUES (@name,@quantity,@price,@total)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@name", $"item{i}");
                    command.Parameters.AddWithValue("@quantity", item_quantity);
                    command.Parameters.AddWithValue("@price", item_price);
                    command.Parameters.AddWithValue("@total", item_quantity * item_price);
                    command.ExecuteNonQuery();
                }



            }
        }

        protected void saveDbBtn_Click(object sender, EventArgs e)
        {
            addDataToDb(1, Convert.ToInt32(quantity1.Value), Convert.ToDecimal(price1.Value));
            addDataToDb(2, Convert.ToInt32(quantity2.Value), Convert.ToDecimal(price2.Value));
            addDataToDb(3, Convert.ToInt32(quantity3.Value), Convert.ToDecimal(price3.Value));
        }
    }
}