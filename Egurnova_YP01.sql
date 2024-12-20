USE [Egurnova_YP01]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientFirstname] [nvarchar](100) NULL,
	[ClientLastname] [nvarchar](100) NULL,
	[ClientMiddlename] [nvarchar](100) NOT NULL,
	[ContactInfo] [nvarchar](255) NULL,
 CONSTRAINT [PK__Clients__E67E1A0431B00145] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Equipmen__344745999B622ED3] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultType]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultType](
	[FaultTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FaultTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_FaultType] PRIMARY KEY CLUSTERED 
(
	[FaultTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] NOT NULL,
	[RequestDateSub] [datetime] NULL,
	[RequestDateEnd] [datetime] NULL,
	[PeriodExecution] [date] NULL,
	[EquipmentID] [int] NULL,
	[FaultTypeID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[ClientID] [int] NULL,
	[StatusID] [int] NULL,
	[TechniciansID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK__Requests__33A8519A7A3EE5A3] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusType]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusType](
	[StatusID] [int] NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Technicians]    Script Date: 19.12.2024 2:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technicians](
	[TechnicianID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[TechnicianFirstname] [nvarchar](100) NULL,
	[TechnicianLastname] [nvarchar](100) NULL,
	[TechnicianMiddlename] [nvarchar](100) NULL,
	[ContactInfo] [nvarchar](255) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK__Technici__301F82C183D4DD32] PRIMARY KEY CLUSTERED 
(
	[TechnicianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (1, N'Иван', N'Иванов', N'Иванович', N'ivanov@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (2, N'Петр', N'Петров', N'Петрович', N'petrov@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (3, N'Сидор', N'Сидоров', N'Сидорович', N'sidorov@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (4, N'Алексей', N'Алексеев', N'Алексеевич', N'alekseev@example.com')
INSERT [dbo].[Clients] ([ClientID], [ClientFirstname], [ClientLastname], [ClientMiddlename], [ContactInfo]) VALUES (5, N'Дмитрий', N'Дмитриев', N'Дмитриевич', N'dmitriev@example.com')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (1, N'Компьютер')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (2, N'Принтер')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (3, N'Сканер')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (4, N'Ноутбук')
INSERT [dbo].[Equipment] ([EquipmentID], [EquipmentName]) VALUES (5, N'Мобильный телефон')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[FaultType] ON 

INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (1, N'Не включается')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (2, N'Ошибка печати')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (3, N'Зависание системы')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (4, N'Проблема с сетью')
INSERT [dbo].[FaultType] ([FaultTypeID], [FaultTypeName]) VALUES (5, N'Не работает звук')
SET IDENTITY_INSERT [dbo].[FaultType] OFF
GO
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (1, CAST(N'2024-11-13T01:51:39.433' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 1, 1, N'Компьютер не включается.', 1, 4, 1, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (2, CAST(N'2024-11-13T01:51:39.433' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 2, 2, N'Ошибка при печати документа.', 2, 4, 2, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (3, CAST(N'2024-11-13T01:51:39.433' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 3, 3, N'Сканер зависает при сканировании.', 3, 2, 3, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (4, CAST(N'2024-11-13T01:51:39.433' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 4, 4, N'Нет доступа к сети.', 4, 3, 4, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (5, CAST(N'2024-11-13T01:51:39.433' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 5, 5, N'Не работает звук на ноутбуке.', 5, 1, 2, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (6, CAST(N'2024-11-20T18:32:01.140' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 1, 3, N'упс', 2, 4, 1, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDateSub], [RequestDateEnd], [PeriodExecution], [EquipmentID], [FaultTypeID], [Description], [ClientID], [StatusID], [TechniciansID], [Comment]) VALUES (99, CAST(N'2024-11-11T00:00:00.000' AS DateTime), NULL, CAST(N'2024-11-11' AS Date), 1, 1, NULL, 1, 4, 1, N'ждем запчасти')
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Пользователь')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (1, N'Создана')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (2, N'В ожидании')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (3, N'В работе')
INSERT [dbo].[StatusType] ([StatusID], [StatusName]) VALUES (4, N'Выполнено')
GO
SET IDENTITY_INSERT [dbo].[Technicians] ON 

INSERT [dbo].[Technicians] ([TechnicianID], [Login], [Password], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo], [RoleID]) VALUES (1, N'user1', N'user1', N'Алексей', N'Алексеев', N'Алексеевич', N'alekseev@example.com', 2)
INSERT [dbo].[Technicians] ([TechnicianID], [Login], [Password], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo], [RoleID]) VALUES (2, N'user2', N'user2', N'Дмитрий', N'Дмитриев', N'Дмитриевич', N'dmitriev@example.com', 1)
INSERT [dbo].[Technicians] ([TechnicianID], [Login], [Password], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo], [RoleID]) VALUES (3, N'user3', N'user3', N'Сергей', N'Сергеев', N'Сергеевич', N'sergeev@example.com', 2)
INSERT [dbo].[Technicians] ([TechnicianID], [Login], [Password], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo], [RoleID]) VALUES (4, N'user4', N'user4', N'Николай', N'Николаев', N'Николаевич', N'nikolaev@example.com', 1)
INSERT [dbo].[Technicians] ([TechnicianID], [Login], [Password], [TechnicianFirstname], [TechnicianLastname], [TechnicianMiddlename], [ContactInfo], [RoleID]) VALUES (5, N'user5', N'user5', N'Владимир', N'Владимиров', N'Владимирович', N'vladimirov@example.com', 1)
SET IDENTITY_INSERT [dbo].[Technicians] OFF
GO
ALTER TABLE [dbo].[Request] ADD  CONSTRAINT [DF__Requests__Reques__5FB337D6]  DEFAULT (getdate()) FOR [RequestDateSub]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Application_Technicians] FOREIGN KEY([TechniciansID])
REFERENCES [dbo].[Technicians] ([TechnicianID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Application_Technicians]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Requests_Clients]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Equipment] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[Equipment] ([EquipmentID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Requests_Equipment]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Requests_FaultType] FOREIGN KEY([FaultTypeID])
REFERENCES [dbo].[FaultType] ([FaultTypeID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Requests_FaultType]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Requests_StatusType] FOREIGN KEY([StatusID])
REFERENCES [dbo].[StatusType] ([StatusID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Requests_StatusType]
GO
ALTER TABLE [dbo].[Technicians]  WITH CHECK ADD  CONSTRAINT [FK_Technicians_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Technicians] CHECK CONSTRAINT [FK_Technicians_Roles]
GO
USE [master]
GO
ALTER DATABASE [Egurnova_YP01] SET  READ_WRITE 
GO
