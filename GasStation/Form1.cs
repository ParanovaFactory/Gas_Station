using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GasStation
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection(@"Data Source=predator;Initial Catalog=Db_GasStation;Integrated Security=True;TrustServerCertificate=True");

        void listCash()
        {
            SqlCommand cmd = new SqlCommand("select * from TblCashReg", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dgvCash.DataSource = dt;
        }

        void listStock()
        {
            SqlCommand cmd = new SqlCommand("select * from TblGas", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dgvStck.DataSource = dt;
        }

        void listSales()
        {
            SqlCommand cmd = new SqlCommand("select * from TblOperation", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dgvSales.DataSource = dt;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            listCash();
            listSales();
            listStock();
        }

        string id, type;
        decimal price;

        private void btnBuy_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("update TblGas set stock += @p1 where Id = @p2", conn);
            cmd.Parameters.AddWithValue("@p1", decimal.Parse(txtLiter.Text));
            cmd.Parameters.AddWithValue("@p2", id);
            cmd.ExecuteNonQuery();
            conn.Close();
            listStock();

        }

        private void btnSell_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into TblOperation (carPlate, type, liter, bill) values (@p1, @p2, @p3, @p4)", conn);
            cmd.Parameters.AddWithValue("@p1", txtPlate.Text);
            cmd.Parameters.AddWithValue("@p2", type);
            cmd.Parameters.AddWithValue("@p3", decimal.Parse(txtSellLiter.Text));
            cmd.Parameters.AddWithValue("@p4", decimal.Parse(txtSellLiter.Text) * price);
            cmd.ExecuteNonQuery();
            conn.Close();

            conn.Open();
            SqlCommand command = new SqlCommand("update TblCashReg set CashRegister += @p5", conn);
            command.Parameters.AddWithValue("@p5", decimal.Parse(txtSellLiter.Text) * price);
            command.ExecuteNonQuery();
            conn.Close();

            conn.Open();
            SqlCommand sqlCommand = new SqlCommand("update TblGas set stock -= @p1 where Id = @p2", conn);
            sqlCommand.Parameters.AddWithValue("@p1", decimal.Parse(txtSellLiter.Text));
            sqlCommand.Parameters.AddWithValue("@p2", id);
            sqlCommand.ExecuteNonQuery();
            conn.Close();

            listCash();
            listSales();
            listStock();
        }

        private void dgvStck_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            id = dgvStck.Rows[e.RowIndex].Cells[0].Value.ToString();
            conn.Open();

            SqlCommand cmd = new SqlCommand("select gasType, salePrice from TblGas where Id = @p1", conn);
            cmd.Parameters.AddWithValue("@p1", id);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                type = dr.GetString(0);
                price = dr.GetDecimal(1);
            }
            conn.Close();
        }
    }
}
