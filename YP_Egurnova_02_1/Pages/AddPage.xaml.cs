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
using System.Xml.Linq;

namespace YP_Egurnova_02_1
{
    /// <summary>
    /// Логика взаимодействия для AddPage.xaml
    /// </summary>
    public partial class AddPage : Page
    {
        private Request _currentRequest = new Request();

        public AddPage()
        {
            InitializeComponent();

            using (var context = new Egurnova_YP01Entities())
            {
                cmbStatus.ItemsSource = context.StatusType.ToList();
                cmbClient.ItemsSource = context.Clients.ToList();
                cmbEquipment.ItemsSource = context.Equipment.ToList();
                cmbFaultType.ItemsSource = context.FaultType.ToList();
                cmbTechnicians.ItemsSource = context.Technicians.ToList();
            }

            DataContext = _currentRequest;
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {

            if (string.IsNullOrEmpty(Convert.ToString(_currentRequest.RequestID)) ||
                cmbClient.SelectedItem == null ||
                cmbEquipment.SelectedItem == null ||
                cmbFaultType.SelectedItem == null ||
                cmbTechnicians.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, заполните все обязательные поля.");
                return;
            }

            _currentRequest.StatusID = (cmbStatus.SelectedItem as StatusType)?.StatusID;
            _currentRequest.ClientID = (cmbClient.SelectedItem as Clients)?.ClientID;
            _currentRequest.EquipmentID = (cmbEquipment.SelectedItem as Equipment)?.EquipmentID;
            _currentRequest.FaultTypeID = (cmbFaultType.SelectedItem as FaultType)?.FaultTypeID;
            _currentRequest.TechniciansID = (cmbTechnicians.SelectedItem as Technicians)?.TechnicianID;

            using (var context = Egurnova_YP01Entities.GetContext())
            {
                context.Request.Add(_currentRequest);

                try
                {
                    context.SaveChanges();
                    MessageBox.Show("Данные успешно сохранены!");
                    this.NavigationService.GoBack();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при сохранении данных: {ex.Message}");
                }
            }
        }
    }
}
