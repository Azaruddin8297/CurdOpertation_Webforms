using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Xml.Linq;

namespace CurdOperations.Employee
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        public void DataLoad()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        public void ClearData()
        {
            if (Page.IsPostBack)
            {
                Name.Text = "";
                City.Text = "";
                Country.Text= "";
                Salary.Text = "";
                Department.Text = "";
            }
        }
        protected void Save_Btn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    string query = "INSERT INTO Employees (Name, City, Country, Salary, Department) VALUES (@Value1, @Value2,@Value3, @Value4,@Value5)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Value1", Name.Text);
                        cmd.Parameters.AddWithValue("@Value2", City.Text);
                        cmd.Parameters.AddWithValue("@Value3", Country.Text);
                        cmd.Parameters.AddWithValue("@Value4", Salary.Text); 
                        cmd.Parameters.AddWithValue("@Value5", Department.Text);
                        cmd.ExecuteNonQuery();

                        Label1.Text = "Data inserted successfully!";
                        DataLoad();
                        ClearData();

                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors
                    Label1.Text = "An error occurred: " + ex.Message;
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Id.Text = GridView1.SelectedRow.Cells[1].Text;
            Name.Text = GridView1.SelectedRow.Cells[2].Text;
            City.Text = GridView1.SelectedRow.Cells[3].Text;
            Country.Text = GridView1.SelectedRow.Cells[4].Text;
            Salary.Text = GridView1.SelectedRow.Cells[5].Text;
            Department.Text = GridView1.SelectedRow.Cells[6].Text;
        }

        protected void Clear_btn_Click(object sender, EventArgs e)
        {
            ClearData();
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            Id.Text = GridView1.SelectedRow.Cells[1].Text;
            using (SqlConnection con = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd = new SqlCommand("delete from Employees where Id = '" + Id.Text + "' ", con);
                cmd.ExecuteNonQuery();
                DataLoad();
                ClearData();
                Label1.Text = "data deleted successfully";
            }

        }

        protected void Edit_btn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                string updateQuery = "UPDATE Employees SET Name = @Name, City = @City, Country = @Country, Salary = @Salary, Department = @Department WHERE Id = @Id";

                using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                {
                    // Convert the Salary and Id to appropriate types
                    cmd.Parameters.AddWithValue("@Name", Name.Text);
                    cmd.Parameters.AddWithValue("@City", City.Text);
                    cmd.Parameters.AddWithValue("@Country", Country.Text);

                    // Ensure Salary and Id are converted to the appropriate data types
                    cmd.Parameters.AddWithValue("@Salary", Convert.ToDecimal(Salary.Text));
                    cmd.Parameters.AddWithValue("@Department", Department.Text);
                    cmd.Parameters.AddWithValue("@Id", Id.Text);

                    // Open the connection
                    con.Open();

                    // Execute the query
                    cmd.ExecuteNonQuery();
                }

                // Reload the data and clear the input fields
                DataLoad();
                ClearData();

                // Display success message
                Label1.Text = "Employee updated successfully";
            }

        }
    }
}