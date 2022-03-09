USE [SE1610]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Group]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Group](
	[username] [varchar](150) NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Account_Group] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] NOT NULL,
	[dname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Feature]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Feature](
	[fid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/16/2022 11:44:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
	[did] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'mra', N'mra')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'mrb', N'mrb')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'mrc', N'mrc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'mrd', N'mrd')
GO
INSERT [dbo].[Account_Group] ([username], [gid]) VALUES (N'mra', 1)
INSERT [dbo].[Account_Group] ([username], [gid]) VALUES (N'mrb', 2)
INSERT [dbo].[Account_Group] ([username], [gid]) VALUES (N'mrb', 3)
INSERT [dbo].[Account_Group] ([username], [gid]) VALUES (N'mrc', 3)
INSERT [dbo].[Account_Group] ([username], [gid]) VALUES (N'mrd', 3)
GO
INSERT [dbo].[Department] ([did], [dname]) VALUES (1, N'Software Engineering')
INSERT [dbo].[Department] ([did], [dname]) VALUES (2, N'Computer Science')
INSERT [dbo].[Department] ([did], [dname]) VALUES (3, N'Information Assurance')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'Add new Student', N'/student/insert')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Update existing Student', N'/student/edit')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Delete existing Student', N'/student/delete')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'Test', N'/student/test')
GO
INSERT [dbo].[Group] ([gid], [gname]) VALUES (1, N'Admin')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (2, N'Moderator')
INSERT [dbo].[Group] ([gid], [gname]) VALUES (3, N'User')
GO
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (1, 1)
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (1, 2)
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (1, 3)
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (2, 1)
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (2, 2)
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (3, 1)
INSERT [dbo].[Group_Feature] ([fid], [gid]) VALUES (4, 3)
GO
INSERT [dbo].[Student] ([sid], [sname], [gender], [dob], [did]) VALUES (1, N'1111111111111111', 1, CAST(N'2022-02-11' AS Date), 2)
INSERT [dbo].[Student] ([sid], [sname], [gender], [dob], [did]) VALUES (222, N'22222', 1, CAST(N'2022-02-16' AS Date), 2)
GO
ALTER TABLE [dbo].[Account_Group]  WITH CHECK ADD  CONSTRAINT [FK_Account_Group_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Account_Group] CHECK CONSTRAINT [FK_Account_Group_Account]
GO
ALTER TABLE [dbo].[Account_Group]  WITH CHECK ADD  CONSTRAINT [FK_Account_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Account_Group] CHECK CONSTRAINT [FK_Account_Group_Group]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Feature]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Group]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
