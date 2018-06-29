using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using System.Runtime.CompilerServices;
// 2018-03-09
using System.Windows.Input;
using System.Windows;
using Wpf_EF_Mvvm_sample.Command;
using System.Windows.Data;
using System.Collections.ObjectModel;
using System.Windows.Controls;
using System.Windows.Interactivity;


// xmlns:local="clr-namespace:MVVM_Sample.ViewModel"  Beispiel
// xmlns:local="clr-namespace:Wpf_EF_Mvvm_sample"
namespace Wpf_EF_Mvvm_sample
{
    /// <summary>
    /// 
    /// Before running this proejct please create the required tables from the CreateAuthorBook.sql file
    /// and then update the connection string in app.config
    /// note:  if the following error message comes up after compiling the project
    /// 
    /// >>Error 1 No connection string named 'AuthorBookEntities' could be found in the application config file.<<
    ///
    /// this error message can be ignored.  The project should run fine.
    /// </summary>
    class MainWindowViewModel : INotifyPropertyChanged
    {
        AuthorBookEntities context = new AuthorBookEntities();
       // MainWindowViewModel vm;

            // Konstruktur
        public MainWindowViewModel()
        {

            /*
            vm = (MainWindowViewModel)this.TryFindResource("vm");
            if (vm != null)
            {
                this.CommandBindings.Add(vm.NewBookCommandBinding);
                this.CommandBindings.Add(vm.DeleteBookCommandBinding);
                this.CommandBindings.Add(vm.SaveBookCommandBinding);
               
            }
            */

            // 2018-03-11
            // Commands initialisieren
            FirstCommand = new RelayCommand(FirstExecute, BackCanExecute);
            // 2018-03-12
            AuthorNewCommand = new RelayCommand(AuthorNewExecute, AuthorNewCanExecute);
            AuthorSaveCommand = new RelayCommand(AuthorSaveExecute, AuthorSaveCanExecute);
            AuthorDeleteCommand = new RelayCommand(AuthorDeleteExecute, AuthorDeleteCanExecute);

            BookEditCommand = new RelayCommand(BookEditExecute, BookSaveCanExecute);
            BookNewCommand = new RelayCommand(BookNewExecute, BookNewCanExecute);
            BookDeleteCommand = new RelayCommand(BookDeleteExecute, BookDeleteCanExecute);

            // 2018-03-27
            BookMouseDoubleClickCommand = new RelayCommand(BookMouseDoubleClickExecute, BookMouseDoubleClickCanExecute);


            // CommandBindings erzeugen

            _closeAppCommandBinding = new CommandBinding(ApplicationCommands.Save, CloseAppExecuted, CloseAppCanExecute);

            

            FillAuthors();
            FillBooksAll();
        }

        // 2018-03-09
       
        // 2018-03-09
        #region private Felder
        private CommandBinding _closeAppCommandBinding; // Noch nicht in Benutzung

      
        #endregion

        #region Buttons ICommand
        // 2018-03-11
        public ICommand FirstCommand { get; private set; }
        private void FirstExecute(object obj)
        {
            // _personsView.MoveCurrentToFirst();
            MessageBox.Show("FirstExecute");
        }

        private bool BackCanExecute(object obj)
        {
            //return _personsView.CurrentPosition > 0;
            return true;
        }

        // 2018-03-12
        public ICommand AuthorNewCommand { get; private set; }
        private void AuthorNewExecute(object obj)
        {
            MessageBox.Show("AuthorNewExecute");
        }

        private bool AuthorNewCanExecute(object obj)
        {
             return true;
        }
        public ICommand AuthorSaveCommand { get; private set; }
        private void AuthorSaveExecute(object obj)
        {
            MessageBox.Show("AuthorSaveExecute");
        }

        private bool AuthorSaveCanExecute(object obj)
        {
            return true;
        }

        public ICommand AuthorDeleteCommand { get; private set; }
        private void AuthorDeleteExecute(object obj)
        {
            MessageBox.Show("AuthorDeleteExecute");
        }

        private bool AuthorDeleteCanExecute(object obj)
        {
            return true;
        }

        // 2018-03-27
        public ICommand BookMouseDoubleClickCommand { get; private set; }
        private void BookMouseDoubleClickExecute(object obj)
        {
            WindowBookEdit windowBookEdit = new WindowBookEdit();
            windowBookEdit.DataContext = this;

            if (windowBookEdit.ShowDialog() == true)
            {
                //
            }
        }

        private bool BookMouseDoubleClickCanExecute(object obj)
        {
            return true;
        }

        public ICommand BookEditCommand { get; private set; }
        // private void BookEditExecute(object sender, MouseButtonEventArgs e)
        private void BookEditExecute(object obj)
        {
            // 2018-03-22
            // DataGridRow row = ItemsControl.ContainerFromElement((DataGrid)sender, e.OriginalSource as DependencyObject) as DataGridRow;
            // if (row == null) return;

            WindowBookEdit windowBookEdit = new WindowBookEdit();
            // windowBookEdit.Owner = this;
            windowBookEdit.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            windowBookEdit.DataContext = this;
            /*
                        // Binding hier erstellen, da das Binding aus XAML hier noch nicht aktiv ist
                        Binding b = new Binding("Title");
                        b.UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged;
                        // Vorname ist per default leer. Gleich hier mit einem Error markieren
                        BindingExpressionBase be = tbxBookTitel.SetBinding(TextBox.TextProperty, b);

                        tbxBookTitel.Focus();
                        */

            // windowBookEdit.tbxBookTitel.Text = "mein Titel";
            bool? dialog = windowBookEdit.ShowDialog();

            if (dialog == true)
            {
                // do save or insert book
            }

            /*
            DialogResult dr = windowBookEdit.ShowDialog();
            result = (dr == DialogResult.Cancel)
               ? null
               : MyObjectInstance;
            return dr;
            */

            // using (AuthorBookEntities ctx = new AuthorBookEntities())
            {
               
                int i = context.SaveChanges();
                //MessageBox.Show("SaveBookExecute i:" + i.ToString());
                
            }
          
        }

        private bool BookSaveCanExecute(object obj)
        {
            //return _personsView.CurrentPosition > 0;
            return true;
        }
        // 2018-03-13
        public ICommand BookNewCommand { get; private set; }
        private void BookNewExecute(object obj)
        {
            // Neues Buch wird angelegt
            //context.Books.Remove(book2delete);
            Book book = new Book();
            book.AuthorId = 3;
            book.BookId = 7;
            book.Description = "my own book";
            book.ErscheinungsJahr = DateTime.Now;
            book.Price = (decimal)65.1;
            book.Title = "my Own";
            context.Books.Add(book);
            int i = context.SaveChanges();

            
            // FillBooksAll();
            
            this.BooksAll.Add(book);
            this.SelectedBookAll = book;

            //NotifyPropertyChanged("SelectedBookAll");
            MessageBox.Show("Neues Buch wird angelegt, i:" + i.ToString());
        }

        private bool BookNewCanExecute(object obj)
        {
            //return _personsView.CurrentPosition > 0;
            return true;
        }

        public ICommand BookDeleteCommand { get; private set; }
        private void BookDeleteExecute(object obj)
        {
            // context.Books.Remove(SelectedBookAll);
             var book2delete = context.Books.Single(b => b.BookId == SelectedBookAll.BookId);
           

            context.Books.Remove(book2delete);
            int i = context.SaveChanges();
            
            this.BooksAll.Remove(book2delete);
           //  NotifyPropertyChanged();
/*
            var q = this.BooksAll;
            q.Remove(book2delete);
            this.BooksAll = q;
            */
            // FillBooksAll();
           
            MessageBox.Show("DeleteBookExecute i:" + i.ToString());
           
        }

        private bool BookDeleteCanExecute(object obj)
        {
            bool canExecute = (SelectedBookAll != null ? true : false);
            return  canExecute;
            //return number > 0 ? number : -number;
        }
        #endregion

        // 2018-03-09
        #region public CommandBindings
        public CommandBinding CloseAppCommandBinding
        {
            get { return _closeAppCommandBinding; }
        }

        #endregion

        #region "Methoden der CommandBindings"
        private void CloseAppCanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }

        private void CloseAppExecuted(object sender, ExecutedRoutedEventArgs e)
        {
            // Anwendung wird geschlossen
            
        }
        private void NewBookCanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }

        private void NewBookExecuted(object sender, ExecutedRoutedEventArgs e)
        {
         
        }

        private void DeleteBookCanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }

        private void DeleteBookExecuted(object sender, ExecutedRoutedEventArgs e)
        {
            // Neues Buch wird gelöscht
        }
      

        private void SaveBookExecuted(object sender, ExecutedRoutedEventArgs e)
        {
            // Neues Buch wird gespeichert
        }
        private void SaveBookCanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }
        #endregion

        private void FillAuthors()
        {
            var q = (from a in context.Authors
                     select a).ToList();
            this.Autoren = q;
        }

        private List<Author> _authors;
        public List<Author> Autoren
        {
            get
            {
                return _authors;
            }
            set
            {
                _authors = value;
                NotifyPropertyChanged();
            }
        }

        private Author _selectedAuthor;
        public Author SelectedAuthor
        {
            get
            {
                return _selectedAuthor;
            }
            set
            {
                _selectedAuthor = value;
                NotifyPropertyChanged();
                // 
                FillBooksAll();
               
            }
        }

        private void FillBooksPerAuthor()
        {
            Author author = this.SelectedAuthor;

            var q = (from book in context.Books
                     orderby book.Title
                     where book.AuthorId == author.AuthorId
                     select book).ToList();

            this.BooksPerAuthor = q;
            NotifyPropertyChanged(); // 2018-03-11
        }

        private List<Book> _booksPerAuthor;
        public List<Book> BooksPerAuthor
        {
            get
            {
                return _booksPerAuthor;
            }
            set
            {
                _booksPerAuthor = value;
                NotifyPropertyChanged();
            }
        }

        /*
        private void FillBooksAll()
        {
          

            var q = (from book in context.Books
                     orderby book.Title
                     select book).ToList();
            this.BooksAll = q;
        }
    */
        private void FillBooksAll()
        {
            /*
             var q = (from book in ctx.Books
                     orderby book.Title
                     select book).ToList();
                     */

            var q = (from book in context.Books
                     orderby book.Title
                     select book).ToList();

            // 2018-03-22
            BooksAll = new ObservableCollection<Book>(q);
          
        }

        private ObservableCollection<Book> _BooksAll;
        public ObservableCollection<Book> BooksAll
        {
            get { return _BooksAll; }
            set {
                _BooksAll = value;
                NotifyPropertyChanged();
            }
        }


        private Book _selectedBook;
        public Book SelectedBook
        {
            get
            {
                return _selectedBook;
            }
            set
            {
                _selectedBook = value;
                NotifyPropertyChanged();
            }
        }

        // 2018-03-14
        private Book _selectedBookAll; 
        public Book SelectedBookAll
        {
            get
            {
                return _selectedBookAll;
            }
            set
            {
                _selectedBookAll = value;
               
                NotifyPropertyChanged();
            }
        }

        // 2018-03-26
        private Book _selectedAuthorAll;
        public Book SelectedAuthorAll
        {
            get
            {
                return _selectedAuthorAll;
            }
            set
            {
                _selectedAuthorAll = value;

                NotifyPropertyChanged();
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void NotifyPropertyChanged([CallerMemberName] String propertyName = "")
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
