   M S B A M L   `   `   `  ����M  IWpf_EF_Mvvm_sample, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Wpf_EF_Mvvm_sampleWpf_EF_Mvvm_sample  5   	   #    Wpf_EF_Mvvm_sample.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   /vm clr-namespace:Wpf_EF_Mvvm_sample     5   	   c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   	     � Title$  
MainWindow��5   	   $	��600��6   $	��800��6)    � WindowStartupLocation$ CenterScreen=�65    � 	Resources 5
      ,  &Wpf_EF_Mvvm_sample.MainWindowViewModel   vm�� 5   
   %   &	          5      6%   5       � DataContext 5        5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $��1* �6   �� 5      $��2* �6    � RowDefinitions 5   
   �� 5      $��25 �6   �� 5      $��40 �6   �� 5      $��* �6   �� 5      $	��150 �6   �� 5       $��40 �6   .+�5#   
   �� -   5         ��Name$ combo_Author��5$   4    �� DisplayMemberPath$ 
AuthorName��5#      $��0��5$      $��0��6$   ��5#   2   �� *	Autoren+ �� SelectedItem 5%      �� *SelectedAuthor+5&      �� 5(   
   -   5        $ combo_Books��5)   5   $ Title��5(      $��0��5)      $��1��6$   ��5(   -   �� *SelectedAuthor.Books+ 5*      �� *SelectedBook+5.      �� 52   
   -   5        $��tbDesc��53      $��1��52      $��0��6!   $��2��61   ��53   "   �� *SelectedBook.Description+�� 55   
   $��4��6   $��4��6"   	 �� Orientation$	 
Horizontal=�60   .+�56      �� -   5        
 ��Name$
 btnAuthorDelete��56      $��
Author Del��58      $��70��6*   $	��2,8q�65   ��57      �� *AuthorDeleteCommand+58   5   �� 5:      -   5        $
 btnAuthorNew��5:      $��
Author New��5;      $��70��6*   $	��2,8q�65   ��5:   +   �� *AuthorNewCommand+5;   5   �� 5=      -   5        $
 btnAuthorSave��5=      $��Author Save��5>      $��70��6+   $	��2,8q�66   ��5=   ,   �� *AuthorSaveCommand+5>   6   5?      ]� 5@   
   $��1��6   ��.  $��0q�6:   $��4��6E   .+�5D      �� -   5        $
 btnBookDelete��5D      $��Book Del��5E      $��70��6(   $	��2,8q�63   ��5D   ,   �� *BookDeleteCommand+5E   3   �� 5F      -   5        $
 
btnBookNew��5F      $��Book New��5G      $��70��6(   $	��2,8q�63   ��5F   ,   �� *BookNewCommand+5G   3   �� 5I      -	   5        $
 btnBookEdit��5I      $��	Book Edit��5J      $��70��6)   $	��2,8q�64   ��5I   *   �� *BookEditCommand+5J   4   �� 5L      -
   5        $
 btnClose��5L      $��	Close App��6'   $��76��6;   $	��2,8q�6F   $��Right=�5M      5O      �� 5P      -   5        $
 btnOpenBookEdit��5P      $��Open Book Edit��5Q      $��70��6*   $	��2,8q�65   6B   5R      &   System.Windows.Controls.DataGrid  5S   
   -   5          Name$ dataGridAuthor��5S      $��2��6+   $ �� IsSynchronizedWithCurrentItem$
 TrueY�5U         AutoGenerateColumns .    SelectionMode$ Single=�5W         
IsReadOnly . ��5S   8   �� *	Autoren+ 5T      ��  �� Path$ SelectedAuthorAll� �� Mode$ TwoWay=�5Y        5Z   
   -   5        $ dataGridBooks��5Z      $��1��6*   $��2��6:   $
 TrueY�5]       .  $ Single=�5_       . ��5[      �� *
BooksAll+ 5\      �� $ SelectedBookAll�$ TwoWay=�.  (System.Windows.Interactivity.Interaction   Triggers 5a      /  )System.Windows.Interactivity.EventTrigger  5b         	EventName$ MouseDoubleClick��6!   .  (System.Windows.Interactivity.TriggerBase   Actions. 5c      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6,   �� *BookMouseDoubleClickCommand+5d         Columns 5g      0  *System.Windows.Controls.DataGridTextColumn  5i      ,  &System.Windows.Controls.DataGridColumn   Header$ Buch ID��6@   1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding 6%   �� *BookId+   	CellStyle 5j      �� 5k      .�5l      ��  �� Property �@��TextAlignment �� Value$ Right=�6H   5m      5o        5q      $ Autor��6n    6%   �� *Author.AuthorName+ 	  ClipboardContentBinding 6K   Z� 6n     5r      $ Title��6b    6%   �� *Title+ 6?   Z� 6b     5s      $ Beschreibung��6h    6%   �� *Description+ 6E   Z� 6h     5t         Width5
  /System.Windows.Controls.DataGridLengthConverter$
  50 
 5u   %   $ Preis��6V    5t   %   �� *Price+ �� StringFormat$ ####.00 €�� 5u   3   Z�  5v      �� 5w      .�5x      ��  �@��TextAlignment$ Right=�6H   5y      5{        5|      $ Veröffentlichung��6�    6%   �� *ErscheinungsJahr+$ {0:yyyy-MM-dd}�� 6i   Z� 6�   5�      � 5�   
   -   5         �Name$ gridBookDetails��5�      $��1��6(   $��3��68    5�      �� 5�      $	��49* �6#   �� 5�      $	��83* �6#    5�      �� 5�      �� 5�      �� 5�      �� 5�      �� 5�      �� 5�      .+�5�      �� $��Buch ID:��6   $
��Left=�6'   $��0,0,0,0q�6B   $��Bottom=�6S   �� 5�      $��Autor:��6   $
��Left=�6%   $��0,0,0,0q�6@   $��Bottom=�6Q   $��1��6l   �� 5�      $��Titel:��6   $
��Left=�6%   $��0,0,0,0q�6@   $��Bottom=�6Q   $��2��6l   �� 5�      $��Beschreibung:��6   $
��Left=�6,   $��0,0,0,0q�6G   $��Bottom=�6X   $��3��6s   �� 5�      $��Preis:��6   $
��Left=�6%   $��0,0,0,0q�6@   $��Bottom=�6Q   $��4��6l   �� 5�      $��Veröffentlichung:��6   $
��Left=�60   $��0,0,0,0q�6K   $��Bottom=�6\   $��5��6w   �� 5�      -   5          ��Name$  	tbxBookId��5�      $��1��6)   $��0��69   ! �� TextWrapping$
! Wrap=�6F   ��5�      �� *SelectedBookAll.BookId+�� 5�      -   5        $  tbxBookAuthor��5�      $��1��6-   $��1��6=   $
! Wrap=�6J   ��5�      �� *#!SelectedBookAll.Author.AuthorName+�� 5�      -   5        $  tbxBookTitel��5�      $��1��6,   $��2��6<   ��5�      �� *SelectedBookAll.Title+�� 5�      -   5        $  tbxBookDescription��5�      $��1��62   $��3��6B   ��5�      �� *SelectedBookAll.Description+�� 5�      $��1��6   $��4��6&   ��5�      �� *SelectedBookAll.Price+$ ####.00 €���� 5�      $��1��6   $��5��6'   ��5�      �� *" SelectedBookAll.ErscheinungsJahr+$ {0:yyyy-MM-dd}��5�      5�      5�      