USE [myTalentBank]
GO
INSERT [dbo].[Department] ([ID], [Name], [HiringContactPerson], [PhoneNumber], [Email]) VALUES (1, N'Enrollment', N'Julie Martin', N'231-398-5206', N'jmartin@lrboi.com')
GO
INSERT [dbo].[Department] ([ID], [Name], [HiringContactPerson], [PhoneNumber], [Email]) VALUES (2, N'Accounting', N'Tom Mitchell', N'231-398-8204', N'tmitchell@lrboi.com')
GO
INSERT [dbo].[Department] ([ID], [Name], [HiringContactPerson], [PhoneNumber], [Email]) VALUES (3, N'Education', N'Joy Lee', N'231-398-1214', N'jlee@lrboi.com')
GO
INSERT [dbo].[Department] ([ID], [Name], [HiringContactPerson], [PhoneNumber], [Email]) VALUES (4, N'Members Assitance', N'Linda Smith', N'231-398-1234', N'lsmith@lrboi.com')
GO
INSERT [dbo].[Department] ([ID], [Name], [HiringContactPerson], [PhoneNumber], [Email]) VALUES (5, N'Natural Resource', N'Jamie Weasel', N'231-398-0094', N'jweasel@lrboi.com')
GO
INSERT [dbo].[Department] ([ID], [Name], [HiringContactPerson], [PhoneNumber], [Email]) VALUES (6, N'Facilities', N'John Danks', N'231-398-8288', N'jdanks@lrboi.com')
GO
INSERT [dbo].[ZipCode] ([Zipcode], [City], [State]) VALUES (N'49635', N'Kaleva', N'MI')
GO
INSERT [dbo].[ZipCode] ([Zipcode], [City], [State]) VALUES (N'49636', N'Kaleva', N'MI')
GO
INSERT [dbo].[ZipCode] ([Zipcode], [City], [State]) VALUES (N'49659', N'Mancelona', N'MI')
GO
INSERT [dbo].[ZipCode] ([Zipcode], [City], [State]) VALUES (N'49660', N'Manistee', N'MI')
GO
INSERT [dbo].[Applicant] ([ID], [FName], [LName], [Zipcode], [Email], [CellPh]) VALUES (1, N'John Smith', N'11235 Tannerville Road', N'49635', N'jsmith@gmail.com', N'231-362-2030')
GO
INSERT [dbo].[Applicant] ([ID], [FName], [LName], [Zipcode], [Email], [CellPh]) VALUES (2, N'Michael TwoStar', N'4563 Musser Road', N'49659', N'MichaelTS@gmail.com', N'231-587-0087')
GO
INSERT [dbo].[Applicant] ([ID], [FName], [LName], [Zipcode], [Email], [CellPh]) VALUES (3, N'Sandra Dee', N'15 Ski Run Road', N'49659', N'SandraDee@gmail.com', N'231-587-9077')
GO
INSERT [dbo].[Applicant] ([ID], [FName], [LName], [Zipcode], [Email], [CellPh]) VALUES (4, N'Cheryl Huffman', N'524 West State Street', N'49660', N'chuffman@gmail.com', N'231-398-3040')
GO
INSERT [dbo].[Applicant] ([ID], [FName], [LName], [Zipcode], [Email], [CellPh]) VALUES (5, N'Jay Rosebush', N'3940 Cheif Road', N'49635', N'jrosebush@gmailc.om', N'231-362-9290')
GO
INSERT [dbo].[Applicant] ([ID], [FName], [LName], [Zipcode], [Email], [CellPh]) VALUES (6, N'George Samuals', N'5219 3rd Street', N'49660', N'gsamuals@gmail.com', N'231-398-2200')
GO
