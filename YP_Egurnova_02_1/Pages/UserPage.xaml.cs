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
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        Technicians technicians;
        public UserPage(Technicians technicians)
        {
            InitializeComponent();
            this.technicians = technicians;

            if (technicians.RoleID == 1)
            {
                UserRole.Content = "Вы зашли в роли СОТРУДНИКА";
            }
            else
            {
                UserRole.Content = "Вы зашли в роли МЕНЕДЖЕРА";
            }

            Statistica();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPage());
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditPage());
        }

        private void View_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ViewPage());
        }

        private void Statistica()
        {
            try
            {
                var context = Egurnova_YP01Entities.GetContext();

                StatisticsLabel.Content = "Кол-во выполненных заявок: " + context.Request.Where(x => x.StatusID == 4).Select(x => x).ToList().Count;
            }
            catch
            {
                StatisticsLabel.Content = "Произошла ошибка при рассчетах";
            }
        }
    }
}
