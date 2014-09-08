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
    public partial class Login : UserControl
    {
        public Login()
        {
            InitializeComponent();
        }

        private void LoginProcess()
        {
            if (!username.Text.Equals("") && !password.Password.Equals(""))
            {
                if (username.Text.Equals("admin") && password.Password.Equals("admin"))
                {
                    //MainWindow main = new MainWindow();
                    //App.Current.MainWindow = main;
                    //this.Close();
                    //main.Show();
                    BBCodeBlock bs = new BBCodeBlock();
                    try
                    {
                        bs.LinkNavigator.Navigate(new Uri("/Pages/Home.xaml", UriKind.Relative), this);
                    }
                    catch (Exception error)
                    {
                        ModernDialog.ShowMessage(error.Message, FirstFloor.ModernUI.Resources.NavigationFailed, MessageBoxButton.OK);
                    }
                    //string url = "/MainWindow.xaml";
                    //BBCodeBlock bbBlock = new BBCodeBlock();
                    //bbBlock.LinkNavigator.Navigate(new Uri(url, UriKind.Relative), null);
                }
                else
                {
                    MessageBox.Show("Username atau Password salah");
                }
            }
            else
            {
                MessageBox.Show("Username dan Password tidak boleh kosong");
            }
        }

        private void LoginBTN_Click(object sender, RoutedEventArgs e)
        {
            LoginProcess();
        }

        private void enter_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                LoginProcess();
            }
        }
    }
}
