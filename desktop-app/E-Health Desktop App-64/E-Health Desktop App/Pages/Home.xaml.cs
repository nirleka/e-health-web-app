using E_Health_Desktop_App.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Linq.SqlClient;
using System.Data.Entity.Core.Objects;

namespace E_Health_Desktop_App.Pages
{
    /// <summary>
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : UserControl
    {
        public Home()
        {
            InitializeComponent();
            var db = new EHealthContext();
            this.SelectAllPenyakit(db);
        }

        private void SelectAllPenyakit(EHealthContext db)
        {
            var penyakits = from p in db.penyakit
                            select new { No = p.id, Nama = p.nama, Gejala = p.gejala, Diagnosis = p.diagnosis, Medikasi = p.medikasi };
            GridPenyakit.ItemsSource = penyakits.ToList();
        }
 
        private void SearchPenyakit()
        {
            string q = Query.Text;

            var db = new EHealthContext();
            if (q.Equals(""))
            {
                this.SelectAllPenyakit(db);
            }
            else {
                var penyakits = db.penyakit.Where(
                    x => x.nama.ToLower().Contains(q.ToLower()) || x.gejala.ToLower().Contains(q.ToLower()) || x.diagnosis.ToLower().Contains(q.ToLower()) || x.medikasi.ToLower().Contains(q.ToLower())
                );
                GridPenyakit.ItemsSource = penyakits.ToList();  
            }
        }

        private void CariBTN_Click(object sender, RoutedEventArgs e)
        {
            SearchPenyakit();
        }

        private void SemuaBTN_Click(object sender, RoutedEventArgs e)
        {
            SelectAllPenyakit(new EHealthContext());
        }

        private void enter_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                SearchPenyakit();
            }
        }
    }
}
