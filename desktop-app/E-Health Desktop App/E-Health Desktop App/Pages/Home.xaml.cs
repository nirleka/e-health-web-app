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
        }

        private void SearchPenyakit()
        {
            string q = Query.Text;

            var db = new EHealthContext();
            var penyakits = from p in db.penyakit
                            where p.nama == q
                            select p;
            GridPenyakit.ItemsSource = penyakits.ToList();                    
        }

        private void CariBTN_Click(object sender, RoutedEventArgs e)
        {
            SearchPenyakit();
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
