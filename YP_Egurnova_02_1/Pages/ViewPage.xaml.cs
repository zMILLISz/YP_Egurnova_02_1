using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
    /// Логика взаимодействия для ViewPage.xaml
    /// </summary>
    public partial class ViewPage : Page
    {
        public ViewPage()
        {
            InitializeComponent();

            LoadData();
            //SetDefaultComboBoxValues();
        }

        private void LoadData()
        {
            using (var context = new Egurnova_YP01Entities())
            {
                ListRequests.ItemsSource = context.Request.ToList();
                CmbStatus.ItemsSource = context.StatusType.ToList();
                CmbClient.ItemsSource = context.Clients.ToList();
                CmbTechnician.ItemsSource = context.Technicians.ToList();
            }
        }

        private void SetDefaultComboBoxValues()
        {
            CmbStatus.SelectedIndex = 0;
            CmbClient.SelectedIndex = 0;
            CmbTechnician.SelectedIndex = 0;
        }

        private void UpdateUsers()
        {
            //using (var context = new Egurnova_YP01Entities())
            //{
            //    var currentRequests = context.Request.ToList();

            //    if (CmbStatus.SelectedIndex > 0)
            //    {
            //        var selectedStatus = (StatusType)CmbStatus.SelectedItem;
            //        currentRequests = currentRequests.Where(x => x.StatusID == selectedStatus.StatusID).ToList();
            //    }

            //    if (CmbClient.SelectedIndex > 0)
            //    {
            //        var selectedClient = (Clients)CmbClient.SelectedItem;
            //        currentRequests = currentRequests.Where(x => x.ClientID == selectedClient.ClientID).ToList();
            //    }

            //    if (CmbTechnician.SelectedIndex > 0)
            //    {
            //        var selectedTechnician = (Technicians)CmbTechnician.SelectedItem;
            //        currentRequests = currentRequests.Where(x => x.TechniciansID == selectedTechnician.TechnicianID).ToList();
            //    }

            //    ListRequests.ItemsSource = currentRequests;
            //}
        }

        private void FilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //UpdateUsers();
        }

        private void ClearFilterButton_Click(object sender, RoutedEventArgs e)
        {
            //SetDefaultComboBoxValues();
            //UpdateUsers();
        }
    }
}
