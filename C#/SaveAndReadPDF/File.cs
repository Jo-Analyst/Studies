using System.Data.SqlClient;

namespace SaveAndReadPDF
{
    internal class FilePDF
    {
        static public void Save(string path, byte[] bytePDF)
        {
            try
            {
                using (var connection = new SqlConnection("Data Source=LOCALHOST\\SQLEXPRESS;Initial Catalog=TESTE;Integrated Security=True"))
                {
                    connection.Open();
                    var command = new SqlCommand($"INSERT INTO tbFiles (colNameFile, colFile) VALUES (@path, @bytePDF)", connection);
                    command.Parameters.AddWithValue("@path", path);
                    command.Parameters.AddWithValue("@bytePDF", bytePDF);
                    command.ExecuteNonQuery();
                }
            }
            catch 
            {
                throw;
            }
        }

        static public byte[] GetFile(byte[] bytePDF)
        {
            byte[] colFile = null;
            try
            {
                using (var connection = new SqlConnection("Data Source=LOCALHOST\\SQLEXPRESS;Initial Catalog=TESTE;Integrated Security=True"))
                {
                    connection.Open();
                    var command = new SqlCommand("SELECT colFile FROM tbFiles WHERE colFile = @bytePDF", connection);
                    command.Parameters.AddWithValue("@bytePDF", bytePDF);
                    colFile = (byte[])command.ExecuteScalar();
                }
            }
            catch (SqlException ex)
            {
                throw;
            }
            return colFile;
        }
    }
}
