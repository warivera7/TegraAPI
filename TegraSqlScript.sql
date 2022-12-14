USE [TegraInventory]
GO
/****** Object:  Table [dbo].[InvBoxProductDetails]    Script Date: 9/24/2022 9:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvBoxProductDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[BoxId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[DetailQuantity] [int] NOT NULL,
	[DetailEnabled] [bit] NOT NULL,
	[DetailCreationDate] [datetime] NOT NULL,
	[DetailCreationUser] [varchar](30) NOT NULL,
	[DetailModifDate] [datetime] NULL,
	[DetailModifUser] [varchar](30) NULL,
 CONSTRAINT [PK_InvBoxProductDetails] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvProducts]    Script Date: 9/24/2022 9:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvProducts](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [varchar](15) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductEnabled] [bit] NOT NULL,
	[ProductCreationDate] [datetime] NOT NULL,
	[ProductCreationUser] [varchar](30) NOT NULL,
	[ProductModifDate] [datetime] NULL,
	[ProductModifUser] [varchar](30) NULL,
 CONSTRAINT [PK_InvProducts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvBoxes]    Script Date: 9/24/2022 9:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvBoxes](
	[BoxId] [int] IDENTITY(1,1) NOT NULL,
	[BoxCode] [varchar](15) NOT NULL,
	[BoxEnabled] [bit] NOT NULL,
	[BoxCreationDate] [datetime] NOT NULL,
	[BoxCreationUser] [varchar](30) NOT NULL,
	[BoxModifDate] [datetime] NULL,
	[BoxModifUser] [varchar](30) NULL,
 CONSTRAINT [PK_InvBoxes] PRIMARY KEY CLUSTERED 
(
	[BoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_InvAvailableReport]    Script Date: 9/24/2022 9:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_InvAvailableReport]
AS
SELECT        a.ProductCode AS Product, CONVERT(varchar, MAX(c.DetailCreationDate), 101) AS LastOperationDate, SUM(ISNULL(c.DetailQuantity, 0)) AS Quantity, a.ProductId
FROM            dbo.InvProducts AS a LEFT OUTER JOIN
                         dbo.InvBoxProductDetails AS c ON c.ProductId = a.ProductId LEFT OUTER JOIN
                         dbo.InvBoxes AS b ON b.BoxId = c.BoxId
GROUP BY a.ProductCode, a.ProductId
GO
/****** Object:  View [dbo].[vw_InvProductDetails]    Script Date: 9/24/2022 9:52:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*WHERE a.ProductId = 2*/
CREATE VIEW [dbo].[vw_InvProductDetails]
AS
SELECT        b.BoxCode, CONVERT(varchar, a.DetailCreationDate, 101) AS DetailCreationDate, a.DetailQuantity, a.ProductId
FROM            dbo.InvBoxProductDetails AS a INNER JOIN
                         dbo.InvBoxes AS b ON b.BoxId = a.BoxId
GO
SET IDENTITY_INSERT [dbo].[InvBoxes] ON 

INSERT [dbo].[InvBoxes] ([BoxId], [BoxCode], [BoxEnabled], [BoxCreationDate], [BoxCreationUser], [BoxModifDate], [BoxModifUser]) VALUES (1, N'00002132132
', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvBoxes] ([BoxId], [BoxCode], [BoxEnabled], [BoxCreationDate], [BoxCreationUser], [BoxModifDate], [BoxModifUser]) VALUES (2, N'00002133242
', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvBoxes] ([BoxId], [BoxCode], [BoxEnabled], [BoxCreationDate], [BoxCreationUser], [BoxModifDate], [BoxModifUser]) VALUES (3, N'00002134352
', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvBoxes] ([BoxId], [BoxCode], [BoxEnabled], [BoxCreationDate], [BoxCreationUser], [BoxModifDate], [BoxModifUser]) VALUES (4, N'00002135462', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
SET IDENTITY_INSERT [dbo].[InvBoxes] OFF
GO
SET IDENTITY_INSERT [dbo].[InvBoxProductDetails] ON 

INSERT [dbo].[InvBoxProductDetails] ([DetailId], [BoxId], [ProductId], [DetailQuantity], [DetailEnabled], [DetailCreationDate], [DetailCreationUser], [DetailModifDate], [DetailModifUser]) VALUES (1, 4, 1, 12, 1, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvBoxProductDetails] ([DetailId], [BoxId], [ProductId], [DetailQuantity], [DetailEnabled], [DetailCreationDate], [DetailCreationUser], [DetailModifDate], [DetailModifUser]) VALUES (2, 3, 1, 12, 1, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvBoxProductDetails] ([DetailId], [BoxId], [ProductId], [DetailQuantity], [DetailEnabled], [DetailCreationDate], [DetailCreationUser], [DetailModifDate], [DetailModifUser]) VALUES (3, 1, 2, 24, 1, CAST(N'2021-06-05T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvBoxProductDetails] ([DetailId], [BoxId], [ProductId], [DetailQuantity], [DetailEnabled], [DetailCreationDate], [DetailCreationUser], [DetailModifDate], [DetailModifUser]) VALUES (4, 2, 2, 24, 1, CAST(N'2021-06-15T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
SET IDENTITY_INSERT [dbo].[InvBoxProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[InvProducts] ON 

INSERT [dbo].[InvProducts] ([ProductId], [ProductCode], [ProductName], [ProductEnabled], [ProductCreationDate], [ProductCreationUser], [ProductModifDate], [ProductModifUser]) VALUES (1, N'SMN23149-12
', N'Product 1', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvProducts] ([ProductId], [ProductCode], [ProductName], [ProductEnabled], [ProductCreationDate], [ProductCreationUser], [ProductModifDate], [ProductModifUser]) VALUES (2, N'SMN33147-12
', N'Product 2', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
INSERT [dbo].[InvProducts] ([ProductId], [ProductCode], [ProductName], [ProductEnabled], [ProductCreationDate], [ProductCreationUser], [ProductModifDate], [ProductModifUser]) VALUES (3, N'SMN43148-12', N'Product 3', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'walter.rivera', NULL, NULL)
SET IDENTITY_INSERT [dbo].[InvProducts] OFF
GO
ALTER TABLE [dbo].[InvBoxProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvBoxProductDetails_InvBoxes] FOREIGN KEY([BoxId])
REFERENCES [dbo].[InvBoxes] ([BoxId])
GO
ALTER TABLE [dbo].[InvBoxProductDetails] CHECK CONSTRAINT [FK_InvBoxProductDetails_InvBoxes]
GO
ALTER TABLE [dbo].[InvBoxProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvBoxProductDetails_InvProducts] FOREIGN KEY([ProductId])
REFERENCES [dbo].[InvProducts] ([ProductId])
GO
ALTER TABLE [dbo].[InvBoxProductDetails] CHECK CONSTRAINT [FK_InvBoxProductDetails_InvProducts]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 280
               Bottom = 136
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 512
               Bottom = 136
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InvAvailableReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InvAvailableReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InvProductDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InvProductDetails'
GO

/****** Object:  Index [NonClusteredIndex-IDs]    Script Date: 9/24/2022 9:38:28 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-IDs] ON [dbo].[InvBoxProductDetails]
(
	[DetailId] DESC,
	[BoxId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
