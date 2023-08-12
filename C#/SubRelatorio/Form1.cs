using Microsoft.Reporting.WinForms;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace SubRelatorio
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        void localReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {

            var dataSource = new ReportDataSource("dtItensVenda", GetItensVenda(Convert.ToInt32(e.Parameters["codVenda"].Values[0])));
            e.DataSources.Add(dataSource);
            e.DataSources.Add(dataSource);
        }


        private DataTable GetItensVenda(int codVenda)
        {
            DataTable venda = new DataTable();
            using(SqlConnection conn = new SqlConnection("Data Source=LOCALHOST\\LAS;Initial Catalog=DbControleVenda;Integrated Security=True"))
            {
                try
                {
                    SqlDataAdapter sda = new SqlDataAdapter($"SELECT *  FROM ItensVenda WHERE id_Venda = {codVenda}", conn);
                    sda.Fill(venda);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }

            return venda;
        }

        void LocalReport_SubreportProcessing(object sender, SubreportProcessingEventArgs e)
        {
            if (e.ReportPath == "ReportItensVenda")
            {
                // Defina o dataset do subrelatório para exibir os detalhes de cada venda
                e.DataSources.Clear();
                e.DataSources.Add(new ReportDataSource("dtItensVenda", GetItensVenda(Convert.ToInt32(e.Parameters["codVenda"].Values[0]))));
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            reportViewer1.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessing);
            //reportViewer1.LocalReport.SubreportProcessing += localReport_SubreportProcessing;
            // TODO: esta linha de código carrega dados na tabela 'dataSet1.Venda'. Você pode movê-la ou removê-la conforme necessário.
            this.vendaTableAdapter.Fill(this.dataSet1.Venda);

            this.reportViewer1.RefreshReport();
        }
    }
}
