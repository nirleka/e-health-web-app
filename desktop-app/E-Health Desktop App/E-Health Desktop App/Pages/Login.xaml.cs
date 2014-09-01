using FirstFloor.ModernUI.Windows.Controls;
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

namespace E_Health_Desktop_App.Pages
{
    /// <summary>
    /// Interaction logic for ModernWindow1.xaml
    /// </summary>
    public partial class ModernWindow1 : ModernWindow
    {
        public ModernWindow1()
        {
            InitializeComponent();
        }

        private void LoginBTN_Click(object sender, RoutedEventArgs e)
        {
            if (!username.Text.Equals("") && !password.Password.Equals(""))
            {
                if (username.Text.Equals("admin") && password.Password.Equals("admin") )
                {
                    MessageBox.Show("Login sukses");
                } else 
                {
                    MessageBox.Show("Username atau Password salah");
                }
            } else 
            {
                MessageBox.Show("Username dan Password tidak boleh kosong");
            }
        }
    }
}
