using System;
using System.Collections.Generic;
using System.Data;
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


namespace Wpf_EF_Mvvm_sample
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        // 2018-03-11 MainWindowViewModel vm;

        public MainWindow()
        {
            // 2018-03-11 InitializeComponent();

            /* 2018-03-11
            vm = (MainWindowViewModel)this.TryFindResource("vm");  // wird HIER nicht gefunden und nicht initialisiert
            if (vm != null)
            {
                this.CommandBindings.Add(vm.CloseAppCommandBinding);

                this.CommandBindings.Add(vm.NewBookCommandBinding);
                this.CommandBindings.Add(vm.DeleteBookCommandBinding);
                this.CommandBindings.Add(vm.SaveBookCommandBinding);
                
            }
           */
            // später ToDo this.Closing += MainWindow_Closing;
            // später ToDo vm.ConfirmDeleting += vm_ConfirmDeleting;
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        // funzt nicht
        public void RefreshDatagridBooks()
        {
            CollectionViewSource.GetDefaultView(dataGridBooks.ItemsSource).Refresh();
        }

        // 2018-03-14 - funzt - aber es ist nicht das was ich will
        private void dataGridBooks_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            /*
            if (tbxBookTitel != null)
            {
                Book book = new Book();
                book = (Book)dataGridBooks.SelectedItem;
                tbxBookTitel.Text = book.Title;
            }*/
        }

        private void btnBooksRefresh_Click(object sender, RoutedEventArgs e)
        {
            // funzt nicht            RefreshDatagridBooks();
            //   CollectionViewSource.GetDefaultView(dataGridBooks.ItemsSource).Refresh();
            ItemsControl saveItemSource = new ItemsControl();
            saveItemSource.ItemsSource = dataGridBooks.ItemsSource;
            dataGridBooks.ItemsSource = null;
            dataGridBooks.ItemsSource = saveItemSource.ItemsSource;
           //dataGridBooks.ItemsSource = BooksAll;
        }

        private void btnOpenBookEdit_Click(object sender, RoutedEventArgs e)
        {
            WindowBookEdit windowBookEdit = new WindowBookEdit();
            windowBookEdit.Owner = this;
            windowBookEdit.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            if (windowBookEdit.ShowDialog() == true)
            {
                // do save or insert book
            }
        }

        /* 2018-03-27
        private void Row_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;
            if (row == null) return;
            WindowBookEdit windowBookEdit = new WindowBookEdit();
            windowBookEdit.Owner = this;
        
            //
            //// Binding hier erstellen, da das Binding aus XAML hier noch nicht aktiv ist
            //Binding b = new Binding("Title");
            //b.UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged;
            //// Vorname ist per default leer. Gleich hier mit einem Error markieren
            //BindingExpressionBase be = tbxBookTitel.SetBinding(TextBox.TextProperty, b);

            //tbxBookTitel.Focus();
            //

            // wewnn nächste Zeile aktiv ist, dann wird der Titel in BooksDetail nicht mehr gezeigt
            //      windowBookEdit.tbxBookTitel.Text = "mein Titel";

          
            if (windowBookEdit.ShowDialog() == true)
            {
                // do save or insert book
            }
        }
    */
       

        private void Author_Row_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;
            if (row == null) return;
            WindowAuthorEdit windowAuthorEdit = new WindowAuthorEdit();
            windowAuthorEdit.Owner = this;
/*
            string test = row.DataContext.ToString();

            DataRow dr = (DataRow)row.DataContext;
            string value = dr[0].ToString();
         

            string author = row. ToString();
            */
           //  string name =   ((string)dataGridAuthor.Items[0].);

            if (windowAuthorEdit.ShowDialog() == true)
            {
                // do save or insert book
            }
        }
    }
}
