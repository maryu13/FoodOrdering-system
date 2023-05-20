create database FoodieDB;

use FoodieDB;

create table [Users] (
[UserId] int primary key identity(1,1) not null,
[Name] varchar (50) null ,
[Username] varchar (50) null unique,
[Mobile] varchar (50) null ,
[Email] varchar (50) null unique,
[Address] varchar (max) null ,
[PostCode] varchar (50) null ,
[Password] varchar (50) null ,
[ImageUrl] varchar (max) null ,
[CreatedDate] datetime null
)

create table [Contact](
[ContactId] int primary key identity(1,1) not null,
[Name] varchar (50) null ,
[Email] varchar (50) null ,
[Subject] varchar (200) null ,
[Message] varchar (max) null ,
[CreatedDate] datetime null
)

create table [Categories](
[CategoryId] int primary key identity(1,1) not null,
[Name] varchar (50) null ,
[IsActive] bit null ,
[CreatedDate] datetime null,
[ImageUrl] varchar (max) null
)

create table [Products](
[ProductId] int primary key identity(1,1) not null,
[Name] varchar (50) null ,
[Description] varchar (max) null ,
[Price] decimal (18,2) null ,
[Quantity] int null ,
[ImageUrl] varchar (max) null ,
[CategoryId] int null, --FK
[CreatedDate] datetime null
)

create table [Carts](
[CartId] int primary key identity(1,1) not null,
[ProductId] int null, --FK
[Quantity] int null ,
[UserId] int null ,--FK
)

create table [Orders](
[OrderDetailsId] int primary key identity(1,1) not null,
[OrderNo] varchar (max) null ,
[ProductId] int null, --FK
[Quantity] int null ,
[UserId] int null ,--FK
[Status] varchar (50) null,
[PaymentId] int null,
[OrderDate] datetime null 
)

create table [Payment](
[PaymentId] int primary key identity(1,1) not null,
[Name] varchar (50) null ,
[CardNo] varchar (50) null ,
[ExpiryDate] varchar (50) null ,
[CvvNo] int null ,
[Address] varchar (max) null ,
[PaymentMode] varchar(50) null
)

create table [Blogs](
[BlogId] int primary key identity(1,1) not null,
[UserId] int null ,
[BlogMssg] varchar(max) null ,
[ImageUrl] varchar (max) null ,
[Date] date null ,
)

