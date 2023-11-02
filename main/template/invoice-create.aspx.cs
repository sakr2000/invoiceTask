using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Data;

namespace invoice_task.main.template
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\invoices.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptInclude(this.GetType(),"MyScript",ResolveUrl("~/main/js/invoice.js"));

        }
        public static SqlConnection GetConnection()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }
        public static void addDataToDb(string item_name, int item_quantity, decimal item_price)
        {
            using (SqlConnection connection = WebForm1.GetConnection())
            {
                string query = "INSERT INTO pill (Item_name,Quantity,Unit_price,Total) VALUES (@name,@quantity,@price,@total)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@name", item_name);
                    command.Parameters.AddWithValue("@quantity", item_quantity);
                    command.Parameters.AddWithValue("@price", item_price);
                    command.Parameters.AddWithValue("@total", item_quantity * item_price);
                    command.ExecuteNonQuery();
                }



            }
        }
        public static void ClearTableData(string tableName)
        {
            using (SqlConnection connection = WebForm1.GetConnection())
            {
                string sqlStatement = "DELETE FROM " + tableName;
                using (SqlCommand cmd = new SqlCommand(sqlStatement, connection))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }
            }

        }

        protected void saveDbBtn_Click(object sender, EventArgs e)
        {
            // clear the table data 
            ClearTableData("pill");

            string[] deletedItems = deletedRows.Value.Split(',');
            // loop on table rows except first and last
            for (int i = 1; i < table.Rows.Count - 1; i++)
            {
                HtmlTableRow row = table.Rows[i];
                // get data
                string itemName = row.Cells[1].InnerText;

                // check if item was deleted in client side
                if (Array.IndexOf(deletedItems, itemName) >= 0) continue;

                HtmlInputGenericControl quantityInput = row.Cells[2].Controls.OfType<HtmlInputGenericControl>().FirstOrDefault(); 
                string quantity = quantityInput.Value;

                HtmlInputGenericControl priceInput = row.Cells[3].Controls.OfType<HtmlInputGenericControl>().FirstOrDefault();
                string price = priceInput.Value;
                
                // add data
                addDataToDb(itemName, Convert.ToInt32(quantity), Convert.ToDecimal(price));
            }

        }

    }
}