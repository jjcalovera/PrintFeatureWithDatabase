using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;
using Microsoft.Reporting.WinForms;

namespace PrintFeature.Functions
{
    class Print
    {
        Components.Connection con = new Components.Connection();

        public void printData (ReportViewer report)
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(con.conString()))
                {
                    string sql = @"SELECT CONCAT(c.lastName, ', ', c.firstName, ' ', COALESCE(LEFT(c.middleName, 1), ''), '') AS fullName, p.name AS name, FORMAT(p.price, 2) AS price
                                    FROM customers AS c
                                    INNER JOIN products AS p ON c.id = p.customerId
                                    ORDER BY c.lastName ASC;";

                    using (MySqlCommand cmd = new MySqlCommand(sql, connection))
                    {
                        connection.Open();

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();

                        dt.Clear();
                        da.Fill(dt);

                        ReportDataSource source = new ReportDataSource("dsProducts", dt);
                        report.LocalReport.DataSources.Clear();
                        report.LocalReport.DataSources.Add(source);
                        report.RefreshReport();

                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error loading print preview of products: " + ex.ToString());
            }
        }
    }
}
