   M S B A M L   `   `   `  ����M  IWpf_EF_Mvvm_sample, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Wpf_EF_Mvvm_sampleWpf_EF_Mvvm_sample  5   	   7 clr-namespace:Wpf_EF_Mvvm_sampleWpf_EF_Mvvm_sample  5   	   '    !Wpf_EF_Mvvm_sample.WindowBookEdit   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   2local clr-namespace:Wpf_EF_Mvvm_sample     5   	   /vm clr-namespace:Wpf_EF_Mvvm_sample     5   	   -   5          �Name$  WindowsBookEdit��5   	    � Title$ 	Edit Book��5   	   $	��240��6   $	��460��6(    � WindowStartupLocation$ CenterScreen=�64    � 	Resources 5	      ,  &Wpf_EF_Mvvm_sample.MainWindowViewModel   vm�� 5
   
   %   &	          5      6%   5       � DataContext 5        5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��37* �6   �� 5      $	��76* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5       $��* �6   �� 5!      $
��1.3* �6   .+�5#   
   �� $��Buch ID:��6   $
��Left=�6#   $��0,0,0,0q�6>   $��Bottom=�6O   $��26��6j   $��53��6v   �� 5$   
   $��Autor:��6   $
��Left=�6!   $��0,0,0,0q�6<   $��Bottom=�6M   $��1��6h   $��26��6u   $��42��6�   �� 5%   
   $��Titel:��6   $
��Left=�6!   $��0,0,0,0q�6<   $��Bottom=�6M   $��2��6h   $��26��6u   $��35��6�   �� 5&   
   $��Beschreibung:��6   $
��Left=�6(   $��0,0,0,0q�6C   $��Bottom=�6T   $��3��6o   $��26��6|   $��84��6�   �� 5'   
   $��Preis:��6   $
��Left=�6!   $��0,0,0,0q�6<   $��Bottom=�6M   $��4��6h   $��26��6u   $��38��6�   �� 5(   
   $��Veröffentlichung:��6   $
��Left=�6,   $��0,0,0,0q�6G   $��Bottom=�6X   $��5��6s   $��26��6�   $	��101��6�   �� 5*   
   -   5         ��Name$ 	tbxBookId��5*      $��1��6%   $��0��65    �� TextWrapping$
 Wrap=�6B   ��5+      �� *SelectedBookAll.BookId+�� 5,   
   -   5        $ tbxBookAuthor��5,      $��1��6)   $��1��69   $
 Wrap=�6F   ��5-      �� *#!SelectedBookAll.Author.AuthorName+�� 5/   
   -   5        $ tbxBookTitel��5/      $��1��6(   $��2��68   ��50      �� *SelectedBookAll.Title+�� 51   
   -   5        $ tbxBookDescription��51      $��1��6.   $��3��6>   ��52      �� *SelectedBookAll.Description+�� 53   
   $��1��6   $��4��6"   ��54      �� *SelectedBookAll.Price+	 �� StringFormat$	 ####.00 €���� 55   
   $��1��6   $��5��6#   ��56      �� *" SelectedBookAll.ErscheinungsJahr+$	 {0:yyyy-MM-dd}��]� 58   
   $��1��6   ��.  $��0q�6:   $��6��6E   .+�5<      �� -   5        
 ��Name$
 btnBookDelete��5<      $��Delete��5=      $��70��6&   $	��4,8q�61   ��5<   ,   �� *BookDeleteCommand+5=   1   �� 5?      -   5        $
 btnClose��5?      $��Close��6'   $��76��67   $	��2,8q�6B   $��Right=�5@       �� IsCancel . 6,   �� 5A      -   5        $
 btnSave��5A      $��Save and Close��5B      $	��106��6*   $	��2,8q�66    �� 	IsDefault . 6C   5C      5D      5E      