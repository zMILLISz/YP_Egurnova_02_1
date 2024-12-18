using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
using System.Xml.Linq;

namespace YP_Egurnova_02_1.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditPage.xaml
    /// </summary>
    public partial class EditPage : Page
    {
        private Egurnova_YP01Entities _context;
        private Request _currentRequest;

        public EditPage()
        {
            InitializeComponent();
            _context = new Egurnova_YP01Entities();
            LoadStatusTypes();
            LoadTechnicians();
        }

        private void LoadStatusTypes()
        {
            cmbStatus.ItemsSource = _context.StatusType.ToList();
        }

        private void LoadTechnicians()
        {
            cmbTechnicians.ItemsSource = _context.Technicians.ToList();
        }

        private void RequestID_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(RequestID.Text))
            {
                LoadRequestData();
            }
        }

        private void LoadRequestData()
        {
            int requestId;
            if (int.TryParse(RequestID.Text, out requestId))
            {
                _currentRequest = _context.Request.FirstOrDefault(r => r.RequestID == requestId);

                if (_currentRequest != null)
                {
                    // Заполнение полей данными заявки
                    DataContext = _currentRequest;

                    // Установка значений для ComboBox
                    cmbStatus.SelectedValue = _currentRequest.StatusID;
                    cmbTechnicians.SelectedValue = _currentRequest.TechniciansID; // Исправлено

                    // Установка значений для других полей
                    PeriodExecution.Text = _currentRequest.PeriodExecution?.ToString("yyyy-MM-dd"); // Если требуется формат
                    Comment.Text = _currentRequest.Comment;
                }
                else
                {
                    MessageBox.Show("Заявка с таким номером не найдена.");
                }
            }
            else
            {
                MessageBox.Show("Введите корректный номер заявки.");
            }
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            if (_currentRequest != null)
            {
                _currentRequest.StatusID = (cmbStatus.SelectedItem as StatusType)?.StatusID;
                _currentRequest.TechniciansID = (cmbTechnicians.SelectedItem as Technicians)?.TechnicianID;

                if (DateTime.TryParse(PeriodExecution.Text, out DateTime parsedDate))
                {
                    _currentRequest.PeriodExecution = parsedDate;
                }
                else
                {
                    MessageBox.Show("Введите корректную дату в формате: ГГГГ-ММ-ДД", "Ошибка ввода даты", MessageBoxButton.OK, MessageBoxImage.Warning);
                    _currentRequest.PeriodExecution = null;
                }
                _currentRequest.Comment = Comment.Text;

                try
                {
                    _context.SaveChanges();
                    MessageBox.Show("Изменения успешно сохранены!");
                    this.NavigationService.GoBack();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при сохранении изменений: {ex.Message}");
                }
            }
            else
            {
                MessageBox.Show("Сначала выберите заявку для редактирования.");
            }
        }
    }
}
