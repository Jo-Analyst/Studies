using System;
using System.IO;
using System.Windows.Forms;

namespace SaveAndReadPDF
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnOpenFile_Click(object sender, EventArgs e)
        {
            if (DialogResult.OK == openFileDialog1.ShowDialog())
            {
                txtPath.Text = openFileDialog1.FileName;
                SaveAndViewPDF();
            }
        }

        string pathTemporary;
        private void SaveAndViewPDF()
        {
            try
            {
                FilePDF.Save(txtPath.Text.Trim(), File.ReadAllBytes(txtPath.Text.Trim()));
                pathTemporary = Path.GetTempFileName();
                File.WriteAllBytes(pathTemporary, FilePDF.GetFile(File.ReadAllBytes(txtPath.Text.Trim())));

                webBrowser1.Url = new Uri(pathTemporary);
            }catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
         }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (string.IsNullOrEmpty(pathTemporary)) return;

            DeleteFileTemporary();
        }

        private void DeleteFileTemporary()
        {
            webBrowser1.Dispose(); // Libera o controle WebBrowser
            webBrowser1 = null; // Define o controle WebBrowser como null
            
            if (File.Exists(pathTemporary))
                File.Delete(pathTemporary); // Exclui o arquivo temporário
        }
    }
}
