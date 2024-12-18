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

namespace YP_Egurnova_02_1.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
        }

        private void EntranceBut_Click(object sender, RoutedEventArgs e)
        {
            AuthCheck(TextBoxLogin.Text, PasswordBox.Password);
        }

        public bool AuthCheck(string TextBoxLogin, string PasswordBox)
        {
            if (string.IsNullOrWhiteSpace(TextBoxLogin) || string.IsNullOrEmpty(PasswordBox))
            {
                MessageBox.Show("Введите логин и пароль!");
                return false;
            }

            using (var db = new Egurnova_YP01Entities())
            {
                var Technicians = db.Technicians
                    .AsNoTracking()
                    .FirstOrDefault(u => u.Login == TextBoxLogin && u.Password == PasswordBox);

                if (Technicians == null)
                {
                    MessageBox.Show("Пользователь с такими данными не найден!");
                    return false;
                }
                else
                {
                    MessageBox.Show("Пользователь успешно найден!");
                    NavigationService.Navigate(new UserPage(Technicians));
                    return true;
                }
            }
        }
    }
}
