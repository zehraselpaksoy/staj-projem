using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EntitiyFrameworkDemoü
{
    public partial class Form1: Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        ProductDal _productDal = new ProductDal();
        private void Form1_Load(object sender, EventArgs e)
        {
            LoadProducts();

        }

        private void LoadProducts()
        {
            dataGridView1.DataSource = _productDal.GetAll(); } 
        private void SearchProducts(string key)
        {
            dataGridView1.DataSource = _productDal.GetAll().Where(p => p.Name.ToLower().Contains(key.ToLower())).ToList();
        }
        
        private void button2_Click(object sender, EventArgs e)
        {
            _productDal.Add(new Product 
            {
                Name = textBox1.Text,
                Fiyat = Convert.ToDecimal(textBox2.Text),
                StockAmount = Convert.ToInt32(textBox2.Text)
            });
            LoadProducts();
            MessageBox.Show("Product added!");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            _productDal.Delete(new Product
            { 
                Id = Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value)
            });
            LoadProducts();
            MessageBox.Show("Product added!");
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox4.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            textBox5.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            textBox6.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            _productDal.Update(new Product
            {
                Id = Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value),
                Name = textBox4.Text,
                Fiyat = Convert.ToDecimal(textBox5.Text),
                StockAmount = Convert.ToInt32(textBox6.Text)
            });
            LoadProducts();
            MessageBox.Show("Product deleted!");    
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
            SearchProducts(textBox7.Text);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            _productDal.GetById(2);
        }
    }
    
}
