   M S B A M L   `   `   `  ����M  IWpf_EF_Mvvm_sample, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Wpf_EF_Mvvm_sampleWpf_EF_Mvvm_sample  5   	   7 clr-namespace:Wpf_EF_Mvvm_sampleWpf_EF_Mvvm_sample  5
   	   )    #Wpf_EF_Mvvm_sample.WindowAuthorEdit   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:Wpf_EF_Mvvm_sample     5   	   /vm clr-namespace:Wpf_EF_Mvvm_sample     5
   	   -   5          �Name$  WindowsAuthorEdit��5   	    � Title$ WindowAuthorEdit��5	   	   $	��300��6"   $	��620��6/    � WindowStartupLocation$ CenterScreen=�5   	    � 	Resources 5      ,  &Wpf_EF_Mvvm_sample.MainWindowViewModel   vm�� 5   
   %   &	          5      6%   5       � DataContext 5        5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $	��37* �6   �� 5      $	��76* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5       $��* �6   �� 5!      $��* �6   �� 5"      $��* �6   �� 5#      $��* �6   �� 5$      $
��1.3* �6   .+�5&   
   �� $��
Author ID:��6   $
��Left=�6%   $��0,0,0,0q�6@   $��Bottom=�6Q   $��26��5'      $	��121��6   $��1��6)   �� 5(   
   $��Author:��6   $
��Left=�6"   $��0,0,0,0q�6=   $��Bottom=�5)      $��2��6+   $��26��68   $��60��6D   �� 5+   
   -   5         ��Name$ tbxAuthorId��5+      $��1��6'   $��1��67    �� TextWrapping$
 Wrap=�6D   ��5,      �� *SelectedAuthorAll.AuthorId+�� 5-   
   -   5        $ 	tbxAuthor��5-      $��1��6%   $��2��65   $
 Wrap=�6B   ��5.      �� *%#SelectedAuthorAll.Author.AuthorName+]� 50   
   $��1��6   ��.  $��0q�6:   $��6��6E   .+�54      �� -   5        	 ��Name$	 btnBookDelete��54      $��Delete��55      $��70��6&   $	��4,8q�61   ��54   ,   �� *BookDeleteCommand+55   1   �� 57      -   5        $	 btnClose��57      $��Close��6'   $��76��67   $	��2,8q�6B   $��Right=�58      5:      �� 5;      -   5        $	 btnSave��5;      $
��Save��5<      $��70��6    $	��2,8q�6+   5=      5?      5@      