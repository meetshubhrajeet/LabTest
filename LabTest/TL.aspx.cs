using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabTest
{
    public partial class TL : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["TestLabConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVbind();
            }
            

        }
        protected void GVbind()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select Ct.CategoryName,Sub.EmployeeName,Ti.Sunday,Ti.Monday,Ti.Tuesday,Ti.Wednesday,Ti.Thursday,Ti.Friday,Ti.Saturday\r\nFrom TimeSpent Ti\r\nJoin Category Ct\r\non Ti.CategoryId=Ct.CategoryId\r\ninner join SubCategory Sub\r\non Ti.SubCategoryId=Sub.SubCategoryId;\r\n\r\n", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows == true)
                {
                    //GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void ChkEmpty_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkstatus=(CheckBox)sender;
            GridViewRow row = (GridViewRow)chkstatus.NamingContainer;
        }

        protected void ChkHeader_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkheader = (CheckBox)GridView1.HeaderRow.FindControl("ChkHeader");
            foreach(GridViewRow row in GridView1.Rows)
            {
                CheckBox chkrow = (CheckBox)row.FindControl("ChkEmpty");
                if(chkheader.Checked==true)
                {
                    chkrow.Checked = true;
                }
                else
                {
                    chkrow.Checked=false;
                }
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].ToString());
            using(SqlConnection con=new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from dbo.Category Where CategoryId='" + id + "'", con);
                int t = cmd.ExecuteNonQuery();
                if(t > 0)
                {
                    Response.Write("<Script>alert('Data has Deleted')</script>");
                    GridView1.EditIndex = -1;
                    GVbind();

                }
                    
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}