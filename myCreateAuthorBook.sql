
create table Author (AuthorId int primary key, AuthorName nvarchar(50))
create table Book (BookId int primary key, AuthorId int, Title nvarchar(50), Description nvarchar(200), Price money, ErscheinungsJahr date)
alter table Book add constraint FK_Book_Author foreign key (AuthorId) references Author (AuthorId)

insert into Author values (1, 'Gambardella, Matthew')
insert into Author values (2, 'Ralls, Kim')
insert into Author values (3, 'Corets, Eva')

insert into MVVM.dbo.Book values (1, 1, 'XML Developers Guide', 'An in-depth look at creating applications with XML.', 4.95, '2017-06-11')
insert into Book values (2, 1, 'Foods of the world.', 'Simply a book about food.',  5.95, '2018-01-12')
insert into Book values (3, 1, 'Cars', 'A book about cars.',  8.95, '2006-11-11')
insert into Book values (4, 2, 'Scarecrows', 'This be could horror or agriculture.', 4.15, '2013-12-12')
insert into Book values (5, 3, 'Book of blue', 'First in a series of books about colors',  6.30, '2016-03-04')
insert into Book values (6, 3, 'EF', 'Some tips and trics on Entity Frameworks',  3.45, '2015-03-08')





























