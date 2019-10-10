/****** Object:  Table [dbo].[UserActionLog_ActionLog]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActionLog_ActionLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IP] [nvarchar](256) NOT NULL,
	[UserId] [int] NULL,
	[TokenId] [int] NULL,
	[EventName] [nvarchar](256) NULL,
	[Module] [nvarchar](256) NOT NULL,
	[Action] [nvarchar](256) NOT NULL,
	[ActionTime] [datetime] NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserActionLog_ActionLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_Group]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](256) NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_GroupInRole]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_GroupInRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_GroupInRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_Role]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[RoleTitle] [nvarchar](256) NULL,
	[RoleDescription] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_Token]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_Token](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[NotificationToken] [nvarchar](256) NULL,
	[TokenCode] [nvarchar](max) NOT NULL,
	[ExpiredDate] [datetime] NOT NULL,
	[Device] [nvarchar](256) NOT NULL,
	[DeviceKey] [nvarchar](256) NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_Token] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_User]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Surname] [nvarchar](256) NULL,
	[ProfilePic] [nvarchar](256) NULL,
	[ProfileBgPic] [nvarchar](256) NULL,
	[ProfileStatusMessage] [nvarchar](512) NULL,
	[UserName] [nvarchar](32) NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_UserInGroup]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_UserInGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_UserInGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_UserInRole]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_UserInRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_UserInRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement_UserMessage]    Script Date: 10.10.2019 04:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement_UserMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[Message] [nvarchar](4000) NOT NULL,
	[ViewStatus] [bit] NOT NULL,
	[ViewDate] [datetime] NULL,
	[Status] [bit] NULL,
	[AddingDate] [datetime] NOT NULL,
	[UpdatingDate] [datetime] NOT NULL,
	[AddingUserId] [int] NULL,
	[UpdatingUserId] [int] NULL,
 CONSTRAINT [PK_UserManagement_UserMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserManagement_UserMessage_FromUserId]    Script Date: 10.10.2019 04:54:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserManagement_UserMessage_FromUserId] ON [dbo].[UserManagement_UserMessage]
(
	[FromUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserManagement_UserMessage_ToUserId]    Script Date: 10.10.2019 04:54:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserManagement_UserMessage_ToUserId] ON [dbo].[UserManagement_UserMessage]
(
	[ToUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserActionLog_ActionLog] ADD  CONSTRAINT [DF_UserActionLog_ActionLog_ActionTime]  DEFAULT (getdate()) FOR [ActionTime]
GO
ALTER TABLE [dbo].[UserActionLog_ActionLog] ADD  CONSTRAINT [DF_UserActionLog_ActionLog_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserActionLog_ActionLog] ADD  CONSTRAINT [DF_UserActionLog_ActionLog_AddingDate]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserActionLog_ActionLog] ADD  CONSTRAINT [DF_UserActionLog_ActionLog_UpdatingDate]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_Group] ADD  CONSTRAINT [DF_UserManagement_Group_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_Group] ADD  CONSTRAINT [DF_UserManagement_Group_AddingDate_1]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_Group] ADD  CONSTRAINT [DF_UserManagement_Group_UpdatingDate_1]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole] ADD  CONSTRAINT [DF_UserManagement_GroupInRole_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole] ADD  CONSTRAINT [DF_UserManagement_GroupInRole_AddingDate_1]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole] ADD  CONSTRAINT [DF_UserManagement_GroupInRole_UpdatingDate_1]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_Role] ADD  CONSTRAINT [DF_UserManagement_Role_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_Role] ADD  CONSTRAINT [DF_UserManagement_Role_AddingDate]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_Role] ADD  CONSTRAINT [DF_UserManagement_Role_UpdatingDate]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_Token] ADD  CONSTRAINT [DF_UserManagement_Token_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_Token] ADD  CONSTRAINT [DF_UserManagement_Token_AddingDate_1]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_Token] ADD  CONSTRAINT [DF_UserManagement_Token_UpdatingDate_1]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_User] ADD  CONSTRAINT [DF_User_AddingDate]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_User] ADD  CONSTRAINT [DF_UserManagement_User_UpdatingDate]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup] ADD  CONSTRAINT [DF_UserManagement_UserInGroup_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup] ADD  CONSTRAINT [DF_UserManagement_UserInGroup_AddingDate]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup] ADD  CONSTRAINT [DF_UserManagement_UserInGroup_UpdatingDate]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_UserInRole] ADD  CONSTRAINT [DF_UserManagement_UserInRole_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_UserInRole] ADD  CONSTRAINT [DF_UserManagement_UserInRole_AddingDate_1]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_UserInRole] ADD  CONSTRAINT [DF_UserManagement_UserInRole_UpdatingDate_1]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_UserMessage] ADD  CONSTRAINT [DF_UserManagement_UserMessage_ViewStatus]  DEFAULT ((0)) FOR [ViewStatus]
GO
ALTER TABLE [dbo].[UserManagement_UserMessage] ADD  CONSTRAINT [DF_UserManagement_UserMessage_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserManagement_UserMessage] ADD  CONSTRAINT [DF_UserManagement_UserMessage_AddingDate_1]  DEFAULT (getdate()) FOR [AddingDate]
GO
ALTER TABLE [dbo].[UserManagement_UserMessage] ADD  CONSTRAINT [DF_UserManagement_UserMessage_UpdatingDate_1]  DEFAULT (getdate()) FOR [UpdatingDate]
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_GroupInRole_UserManagement_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserManagement_Group] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole] CHECK CONSTRAINT [FK_UserManagement_GroupInRole_UserManagement_Group]
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_GroupInRole_UserManagement_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserManagement_Role] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_GroupInRole] CHECK CONSTRAINT [FK_UserManagement_GroupInRole_UserManagement_Role]
GO
ALTER TABLE [dbo].[UserManagement_Token]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_Token_UserManagement_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserManagement_User] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_Token] CHECK CONSTRAINT [FK_UserManagement_Token_UserManagement_User]
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_UserInGroup_UserManagement_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserManagement_Group] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup] CHECK CONSTRAINT [FK_UserManagement_UserInGroup_UserManagement_Group]
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_UserInGroup_UserManagement_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserManagement_User] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_UserInGroup] CHECK CONSTRAINT [FK_UserManagement_UserInGroup_UserManagement_User]
GO
ALTER TABLE [dbo].[UserManagement_UserInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_UserInRole_UserManagement_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserManagement_Role] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_UserInRole] CHECK CONSTRAINT [FK_UserManagement_UserInRole_UserManagement_Role]
GO
ALTER TABLE [dbo].[UserManagement_UserInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_UserInRole_UserManagement_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserManagement_User] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_UserInRole] CHECK CONSTRAINT [FK_UserManagement_UserInRole_UserManagement_User]
GO
ALTER TABLE [dbo].[UserManagement_UserMessage]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_UserMessage_UserManagement_User_FromUserId] FOREIGN KEY([FromUserId])
REFERENCES [dbo].[UserManagement_User] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_UserMessage] CHECK CONSTRAINT [FK_UserManagement_UserMessage_UserManagement_User_FromUserId]
GO
ALTER TABLE [dbo].[UserManagement_UserMessage]  WITH CHECK ADD  CONSTRAINT [FK_UserManagement_UserMessage_UserManagement_User_ToUserId] FOREIGN KEY([ToUserId])
REFERENCES [dbo].[UserManagement_User] ([Id])
GO
ALTER TABLE [dbo].[UserManagement_UserMessage] CHECK CONSTRAINT [FK_UserManagement_UserMessage_UserManagement_User_ToUserId]
GO
