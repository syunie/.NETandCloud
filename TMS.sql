CREATE DATABASE TMS
GO
USE [TMS]
GO
/****** Object:  Table [dbo].[CostHistory]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PointsBefore] [int] NOT NULL,
	[PointsAfter] [int] NOT NULL,
	[PointsCost] [int] NOT NULL,
	[GoodsID] [int] NOT NULL,
	[GoodsNum] [int] NOT NULL,
	[GoodsName] [nvarchar](100) NOT NULL,
	[OrderNum] [nvarchar](50) NOT NULL,
	[MoneyCost] [decimal](18, 2) NOT NULL,
	[MoneyBefore] [decimal](18, 2) NOT NULL,
	[MoneyAfter] [decimal](18, 2) NOT NULL,
	[CostType] [nvarchar](20) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
	[ExchangeStatus] [nvarchar](50) NOT NULL,
	[ExpressName] [nvarchar](50) NOT NULL,
	[ExpressNum] [nvarchar](100) NOT NULL,
	[SendTime] [datetime] NOT NULL,
	[FinishTime] [datetime] NOT NULL,
	[LinkMan] [nvarchar](100) NOT NULL,
	[LinkAddress] [nvarchar](1000) NOT NULL,
	[LinkPhone] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CatID] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Points] [int] NOT NULL,
	[CoverPath] [nvarchar](50) NOT NULL,
	[BigPicPath] [nvarchar](50) NOT NULL,
	[IsOut] [int] NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[AddUserRealName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsCat]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsCat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsDel] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Line]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[FirstCatID] [int] NOT NULL,
	[SecondCatID] [int] NOT NULL,
	[ProductNum] [nvarchar](50) NOT NULL,
	[CoverPath] [nvarchar](50) NOT NULL,
	[BigPicPath] [nvarchar](50) NOT NULL,
	[TravelDays] [nvarchar](10) NOT NULL,
	[StartAddress] [nvarchar](50) NOT NULL,
	[TargetAddress] [nvarchar](50) NOT NULL,
	[GoTravel] [nvarchar](50) NOT NULL,
	[BackTravel] [nvarchar](50) NOT NULL,
	[SignUpNotice] [nvarchar](max) NOT NULL,
	[LineDesc] [nvarchar](max) NOT NULL,
	[OtherNotice] [nvarchar](max) NOT NULL,
	[WarmTips] [nvarchar](max) NOT NULL,
	[MinPrice] [decimal](18, 2) NOT NULL,
	[Tag] [nvarchar](100) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[AddUserRealName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[IsDel] [int] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
	[IsTop] [int] NOT NULL DEFAULT ((0)),
	[IsHot] [int] NOT NULL DEFAULT ((0)),
	[HitTimes] [int] NOT NULL DEFAULT ((0)),
	[IsPickup] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK__Line__3214EC27DEB9388F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LineCat]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineCat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ParentID] [int] NOT NULL,
	[IsDel] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
	[IsShowIndex] [int] NOT NULL DEFAULT ((0)),
	[IsHotSell] [int] NOT NULL DEFAULT ((0)),
	[IsHotSort] [int] NOT NULL DEFAULT ((0)),
	[IsSearchWord] [int] NOT NULL DEFAULT ((0)),
	[HitTimes] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LineDetail]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LineID] [int] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[DayDesc] [nvarchar](max) NOT NULL,
	[DayPics] [nvarchar](1000) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[WarmTips] [nvarchar](max) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[AddUserRealName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemberFav]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFav](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FavType] [nvarchar](20) NOT NULL,
	[FavObjID] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNum] [nvarchar](50) NOT NULL,
	[GroupID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[AddMemberName] [nvarchar](50) NOT NULL,
	[RealName] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](5) NOT NULL,
	[IDNum] [nvarchar](50) NOT NULL,
	[MobileNum] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PicWall]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PicWall](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CoverPath] [nvarchar](50) NOT NULL,
	[BigPicPath] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[AddUserRealName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsTop] [int] NOT NULL,
	[ExtraFields] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[CoverPath] [nvarchar](100) NOT NULL,
	[PromotionDesc] [nvarchar](max) NOT NULL,
	[PromotionType] [nvarchar](20) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[TotalPayOneTime] [decimal](18, 2) NOT NULL,
	[TotalPayOneTimeJoinNum] [int] NOT NULL,
	[FullCutTotal] [decimal](18, 2) NOT NULL,
	[FullCutMinus] [decimal](18, 2) NOT NULL,
	[SecondKillPrice] [decimal](18, 2) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[IsDel] [int] NOT NULL,
	[Tag] [nvarchar](100) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[AddUserRealName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PromotionGroup]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PromotionID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[TotalNum] [int] NOT NULL,
	[SelledNum] [int] NOT NULL,
	[RemainNum] [int] NOT NULL,
	[RawInnerPrice] [decimal](18, 2) NOT NULL,
	[RawOuterPrice] [decimal](18, 2) NOT NULL,
	[BeginTime] [datetime] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QA]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](50) NOT NULL,
	[QATitle] [nvarchar](200) NOT NULL,
	[QAContent] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteMember]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteMember](
	[UserName] [nvarchar](50) NOT NULL,
	[UserPwd] [nvarchar](100) NOT NULL,
	[RealName] [nvarchar](50) NOT NULL,
	[HeadPicPath] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](5) NOT NULL,
	[MobileNum] [nvarchar](50) NOT NULL,
	[IDNum] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[QQ] [nvarchar](50) NOT NULL,
	[WeChat] [nvarchar](50) NOT NULL,
	[TotalCost] [decimal](18, 2) NOT NULL,
	[TotalPoints] [int] NOT NULL,
	[UsedPoints] [int] NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[InviteNum] [nvarchar](50) NOT NULL,
	[InviterUserName] [nvarchar](50) NOT NULL,
	[InviterRealName] [nvarchar](50) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteMenu]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[StartTag] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](100) NOT NULL,
	[ParentID] [int] NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteRole]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[MenuIDList] [nvarchar](max) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteSetting]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteSetting](
	[ID] [int] NOT NULL,
	[HotSearchWords] [nvarchar](1000) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteUser]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteUser](
	[Name] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](200) NOT NULL,
	[RealName] [nvarchar](10) NOT NULL,
	[RoleIDs] [nvarchar](500) NOT NULL,
	[LastLoginTime] [datetime] NOT NULL,
	[LastLoginIP] [nvarchar](50) NOT NULL,
	[ThisLoginTime] [datetime] NOT NULL,
	[ThisLoginIP] [nvarchar](50) NOT NULL,
	[InviteNum] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[UserStatus] [nvarchar](10) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PicPath] [nvarchar](255) NOT NULL,
	[Url] [nvarchar](255) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsTop] [int] NOT NULL,
	[IsShow] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TravelGroup]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LineID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TotalNum] [int] NOT NULL,
	[RemainNum] [int] NOT NULL,
	[JoinNum] [int] NOT NULL,
	[PromotionNum] [int] NOT NULL,
	[GroupNum] [nvarchar](50) NOT NULL,
	[GoDate] [datetime] NOT NULL,
	[BackDate] [datetime] NOT NULL,
	[GatheringTime] [nvarchar](50) NOT NULL,
	[GatheringPlace] [nvarchar](50) NOT NULL,
	[TransferPlace] [nvarchar](1000) NOT NULL,
	[GoTravel] [nvarchar](200) NOT NULL,
	[BackTravel] [nvarchar](200) NOT NULL,
	[OuterPrice] [decimal](18, 2) NOT NULL,
	[InnerPrice] [decimal](18, 2) NOT NULL,
	[Deposit] [decimal](18, 2) NOT NULL,
	[GruopLeader] [nvarchar](50) NOT NULL,
	[TravelGuide] [nvarchar](50) NOT NULL,
	[IsDel] [int] NOT NULL,
	[IsPublish] [int] NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[AddUserName] [nvarchar](50) NOT NULL,
	[AddUserRealName] [nvarchar](50) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__TravelGr__3214EC27BD45F9B7] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TravelOrder]    Script Date: 2017/8/19 18:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelOrder](
	[OrderNum] [nvarchar](50) NOT NULL,
	[OrderType] [nvarchar](50) NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[GroupID] [int] NOT NULL,
	[LineID] [int] NOT NULL,
	[TotalMoney] [decimal](18, 2) NOT NULL,
	[MoneyPayed] [decimal](18, 2) NOT NULL,
	[MoneyReturn] [decimal](18, 2) NOT NULL,
	[BuyNum] [int] NOT NULL,
	[CanChangeNum] [int] NOT NULL,
	[PromotionID] [int] NOT NULL,
	[CompanyRemarks] [nvarchar](max) NOT NULL,
	[AddTime] [datetime] NOT NULL,
	[AddMemberName] [nvarchar](50) NOT NULL,
	[AddMemberMobile] [nvarchar](50) NOT NULL,
	[AddMemberRealName] [nvarchar](50) NOT NULL,
	[AddMemberRemarks] [nvarchar](max) NOT NULL,
	[InviteNum] [nvarchar](50) NOT NULL,
	[InviterUserName] [nvarchar](50) NOT NULL,
	[InviterRealName] [nvarchar](50) NOT NULL,
	[OperatorUserName] [nvarchar](50) NOT NULL,
	[OperatorRealName] [nvarchar](50) NOT NULL,
	[ExtraFields] [nvarchar](max) NOT NULL,
	[OrderHistory] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_Order]    Script Date: 2017/8/19 18:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Order]
AS
SELECT   dbo.TravelOrder.OrderNum, dbo.TravelOrder.OrderType, dbo.TravelOrder.OrderStatus, dbo.TravelOrder.GroupID, 
                dbo.TravelOrder.OrderHistory, dbo.TravelOrder.LineID, dbo.TravelOrder.TotalMoney, dbo.TravelOrder.MoneyPayed, 
                dbo.TravelOrder.MoneyReturn, dbo.TravelOrder.BuyNum, dbo.TravelOrder.PromotionID, 
                dbo.TravelOrder.CompanyRemarks, dbo.TravelOrder.AddTime, dbo.TravelOrder.AddMemberName, 
                dbo.TravelOrder.AddMemberMobile, dbo.TravelOrder.AddMemberRealName, dbo.TravelOrder.AddMemberRemarks, 
                dbo.TravelOrder.InviteNum, dbo.TravelOrder.InviterUserName, dbo.TravelOrder.InviterRealName, 
                dbo.TravelOrder.OperatorUserName, dbo.TravelOrder.OperatorRealName, dbo.TravelOrder.ExtraFields, 
                dbo.Line.Name AS LineName, dbo.TravelGroup.GoDate, dbo.TravelGroup.BackDate, dbo.TravelGroup.GatheringTime, 
                dbo.TravelGroup.GatheringPlace, dbo.TravelGroup.TransferPlace, dbo.TravelGroup.InnerPrice, 
                dbo.TravelGroup.OuterPrice, dbo.TravelGroup.Deposit, dbo.TravelGroup.GruopLeader, dbo.TravelGroup.TravelGuide, 
                dbo.Promotion.Name AS PromotionName, dbo.TravelOrder.CanChangeNum, dbo.Line.TravelDays
FROM      dbo.TravelOrder LEFT OUTER JOIN
                dbo.Line ON dbo.TravelOrder.LineID = dbo.Line.ID LEFT OUTER JOIN
                dbo.Promotion ON dbo.TravelOrder.PromotionID = dbo.Promotion.ID LEFT OUTER JOIN
                dbo.TravelGroup ON dbo.TravelOrder.GroupID = dbo.TravelGroup.ID

GO
/****** Object:  View [dbo].[V_CostHistory]    Script Date: 2017/8/19 18:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_CostHistory]
AS
SELECT   dbo.CostHistory.ID, dbo.CostHistory.UserName, dbo.CostHistory.PointsBefore, dbo.CostHistory.PointsAfter, 
                dbo.CostHistory.PointsCost, dbo.CostHistory.GoodsID, dbo.CostHistory.GoodsNum, dbo.CostHistory.GoodsName, 
                dbo.CostHistory.OrderNum, dbo.CostHistory.MoneyCost, dbo.CostHistory.MoneyBefore, dbo.CostHistory.MoneyAfter, 
                dbo.CostHistory.CostType, dbo.CostHistory.Remarks, dbo.CostHistory.AddTime, dbo.CostHistory.ExtraFields, 
                dbo.V_Order.LineID, dbo.V_Order.GroupID, dbo.V_Order.BuyNum, dbo.V_Order.PromotionID, dbo.V_Order.LineName, 
                dbo.V_Order.GoDate, dbo.V_Order.PromotionName, dbo.V_Order.TotalMoney, dbo.V_Order.MoneyPayed, 
                dbo.CostHistory.ExchangeStatus
FROM      dbo.CostHistory LEFT OUTER JOIN
                dbo.V_Order ON dbo.CostHistory.UserName = dbo.V_Order.AddMemberName AND 
                dbo.CostHistory.OrderNum = dbo.V_Order.OrderNum

GO
/****** Object:  View [dbo].[V_ExchangeHistory]    Script Date: 2017/8/19 18:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ExchangeHistory]
AS
SELECT   dbo.CostHistory.ID, dbo.CostHistory.UserName, dbo.CostHistory.PointsBefore, dbo.CostHistory.PointsAfter, 
                dbo.CostHistory.PointsCost, dbo.CostHistory.GoodsID, dbo.CostHistory.GoodsNum, dbo.CostHistory.OrderNum, 
                dbo.CostHistory.MoneyCost, dbo.CostHistory.MoneyBefore, dbo.CostHistory.MoneyAfter, dbo.CostHistory.CostType, 
                dbo.CostHistory.Remarks, dbo.CostHistory.AddTime, dbo.CostHistory.ExtraFields, dbo.Goods.CoverPath, 
                dbo.Goods.Points, dbo.Goods.Num, dbo.CostHistory.GoodsName, dbo.CostHistory.ExchangeStatus, 
                dbo.CostHistory.ExpressName, dbo.CostHistory.ExpressNum, dbo.CostHistory.SendTime, dbo.CostHistory.FinishTime, 
                dbo.CostHistory.LinkMan, dbo.CostHistory.LinkAddress, dbo.CostHistory.LinkPhone
FROM      dbo.CostHistory INNER JOIN
                dbo.Goods ON dbo.CostHistory.GoodsID = dbo.Goods.ID

GO
/****** Object:  View [dbo].[V_Goods]    Script Date: 2017/8/19 18:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW  [dbo].[V_Goods]
AS
SELECT   dbo.Goods.ID, dbo.Goods.Name, dbo.Goods.CatID, dbo.Goods.Num, dbo.Goods.Points, dbo.Goods.CoverPath, 
                dbo.Goods.BigPicPath, dbo.Goods.IsOut, dbo.Goods.Remarks, dbo.Goods.AddUserName, 
                dbo.Goods.AddUserRealName, dbo.Goods.AddTime, dbo.Goods.ExtraFields, dbo.GoodsCat.Name AS CatName
FROM      dbo.Goods INNER JOIN
                dbo.GoodsCat ON dbo.Goods.CatID = dbo.GoodsCat.ID

GO
/****** Object:  View [dbo].[V_Group_Line]    Script Date: 2017/8/19 18:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Group_Line]
AS
SELECT     dbo.TravelGroup.*, dbo.Line.Name AS LineName, dbo.Line.FirstCatID, dbo.Line.SecondCatID, dbo.Line.TravelDays
FROM         dbo.TravelGroup INNER JOIN
                      dbo.Line ON dbo.TravelGroup.LineID = dbo.Line.ID

GO
/****** Object:  View [dbo].[V_Promotion_Group]    Script Date: 2017/8/19 18:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Promotion_Group]
AS
SELECT   dbo.PromotionGroup.ID, dbo.PromotionGroup.PromotionID, dbo.PromotionGroup.GroupID, dbo.PromotionGroup.LineID, 
                dbo.PromotionGroup.TotalNum, dbo.PromotionGroup.SelledNum, dbo.PromotionGroup.AddTime, 
                dbo.PromotionGroup.ExtraFields, dbo.Promotion.Name AS PromotionName, dbo.Line.Name AS LineName, 
                dbo.TravelGroup.GoDate, dbo.TravelGroup.BackDate, dbo.TravelGroup.GruopLeader, dbo.TravelGroup.TravelGuide, 
                dbo.TravelGroup.GatheringTime, dbo.TravelGroup.GatheringPlace, dbo.TravelGroup.TransferPlace, dbo.Line.CoverPath, 
                dbo.Line.StartAddress, dbo.Line.TargetAddress, dbo.Line.GoTravel, dbo.Line.BackTravel, dbo.Line.SignUpNotice, 
                dbo.Line.LineDesc, dbo.Line.WarmTips, dbo.Line.OtherNotice, dbo.Line.ProductNum, dbo.Line.TravelDays, 
                dbo.Promotion.PromotionType, dbo.Promotion.Discount, dbo.Promotion.TotalPayOneTime, 
                dbo.Promotion.TotalPayOneTimeJoinNum, dbo.Promotion.FullCutTotal, dbo.Promotion.FullCutMinus, 
                dbo.Promotion.SecondKillPrice, dbo.Promotion.StartTime, dbo.Promotion.EndTime, dbo.Promotion.IsDel, 
                dbo.PromotionGroup.RawInnerPrice, dbo.PromotionGroup.RawOuterPrice, dbo.PromotionGroup.RemainNum
FROM      dbo.PromotionGroup LEFT OUTER JOIN
                dbo.Promotion ON dbo.PromotionGroup.PromotionID = dbo.Promotion.ID LEFT OUTER JOIN
                dbo.Line ON dbo.PromotionGroup.LineID = dbo.Line.ID LEFT OUTER JOIN
                dbo.TravelGroup ON dbo.PromotionGroup.GroupID = dbo.TravelGroup.ID AND dbo.Line.ID = dbo.TravelGroup.LineID

GO
SET IDENTITY_INSERT [dbo].[CostHistory] ON 

INSERT [dbo].[CostHistory] ([ID], [UserName], [PointsBefore], [PointsAfter], [PointsCost], [GoodsID], [GoodsNum], [GoodsName], [OrderNum], [MoneyCost], [MoneyBefore], [MoneyAfter], [CostType], [Remarks], [AddTime], [ExtraFields], [ExchangeStatus], [ExpressName], [ExpressNum], [SendTime], [FinishTime], [LinkMan], [LinkAddress], [LinkPhone]) VALUES (3, N'member001', 0, 1497, 1497, 0, 0, N'', N'201512282046317630000000001', CAST(1497.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), N'参团', N'', CAST(N'2015-12-29 17:29:48.400' AS DateTime), N' ', N'完成', N'', N'', CAST(N'2016-06-16 00:00:00.000' AS DateTime), CAST(N'2016-06-16 00:00:00.000' AS DateTime), N'', N'', N'')
INSERT [dbo].[CostHistory] ([ID], [UserName], [PointsBefore], [PointsAfter], [PointsCost], [GoodsID], [GoodsNum], [GoodsName], [OrderNum], [MoneyCost], [MoneyBefore], [MoneyAfter], [CostType], [Remarks], [AddTime], [ExtraFields], [ExchangeStatus], [ExpressName], [ExpressNum], [SendTime], [FinishTime], [LinkMan], [LinkAddress], [LinkPhone]) VALUES (4, N'member001', 1497, 1397, 100, 1, 1, N'U盘', N'', CAST(0.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), N'积分兑换', N'', CAST(N'2015-12-30 10:40:51.340' AS DateTime), N' ', N'完成', N'', N'', CAST(N'2016-06-16 00:00:00.000' AS DateTime), CAST(N'2016-06-16 00:00:00.000' AS DateTime), N'', N'', N'')
INSERT [dbo].[CostHistory] ([ID], [UserName], [PointsBefore], [PointsAfter], [PointsCost], [GoodsID], [GoodsNum], [GoodsName], [OrderNum], [MoneyCost], [MoneyBefore], [MoneyAfter], [CostType], [Remarks], [AddTime], [ExtraFields], [ExchangeStatus], [ExpressName], [ExpressNum], [SendTime], [FinishTime], [LinkMan], [LinkAddress], [LinkPhone]) VALUES (5, N'member001', 1397, 1197, 200, 1, 2, N'U盘', N'', CAST(0.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), N'积分兑换', N'', CAST(N'2015-12-30 10:41:53.983' AS DateTime), N' ', N'完成', N'', N'', CAST(N'2016-06-16 00:00:00.000' AS DateTime), CAST(N'2016-06-16 00:00:00.000' AS DateTime), N'', N'', N'')
INSERT [dbo].[CostHistory] ([ID], [UserName], [PointsBefore], [PointsAfter], [PointsCost], [GoodsID], [GoodsNum], [GoodsName], [OrderNum], [MoneyCost], [MoneyBefore], [MoneyAfter], [CostType], [Remarks], [AddTime], [ExtraFields], [ExchangeStatus], [ExpressName], [ExpressNum], [SendTime], [FinishTime], [LinkMan], [LinkAddress], [LinkPhone]) VALUES (6, N'member001', 1197, 1047, 150, 2, 1, N'费列罗巧克力', N'', CAST(0.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), N'积分兑换', N'', CAST(N'2016-04-25 16:36:54.767' AS DateTime), N' ', N'完成', N'申通快递', N'4231123', CAST(N'2016-06-16 00:00:00.000' AS DateTime), CAST(N'2016-06-16 00:00:00.000' AS DateTime), N'', N'', N'')
INSERT [dbo].[CostHistory] ([ID], [UserName], [PointsBefore], [PointsAfter], [PointsCost], [GoodsID], [GoodsNum], [GoodsName], [OrderNum], [MoneyCost], [MoneyBefore], [MoneyAfter], [CostType], [Remarks], [AddTime], [ExtraFields], [ExchangeStatus], [ExpressName], [ExpressNum], [SendTime], [FinishTime], [LinkMan], [LinkAddress], [LinkPhone]) VALUES (7, N'member001', 1497, 4697, 3200, 0, 0, N'', N'201606061021004290000000001', CAST(3200.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), CAST(4697.00 AS Decimal(18, 2)), N'参团', N'', CAST(N'2016-06-06 10:38:29.170' AS DateTime), N' ', N'完成', N'', N'', CAST(N'2016-06-16 00:00:00.000' AS DateTime), CAST(N'2016-06-16 00:00:00.000' AS DateTime), N'', N'', N'')
INSERT [dbo].[CostHistory] ([ID], [UserName], [PointsBefore], [PointsAfter], [PointsCost], [GoodsID], [GoodsNum], [GoodsName], [OrderNum], [MoneyCost], [MoneyBefore], [MoneyAfter], [CostType], [Remarks], [AddTime], [ExtraFields], [ExchangeStatus], [ExpressName], [ExpressNum], [SendTime], [FinishTime], [LinkMan], [LinkAddress], [LinkPhone]) VALUES (8, N'member001', 4247, 4147, 100, 1, 1, N'U盘', N'', CAST(0.00 AS Decimal(18, 2)), CAST(4697.00 AS Decimal(18, 2)), CAST(4697.00 AS Decimal(18, 2)), N'积分兑换', N'', CAST(N'2016-06-16 11:11:00.817' AS DateTime), N' ', N'完成', N'圆通快递', N'26234324', CAST(N'2016-06-17 10:17:27.597' AS DateTime), CAST(N'2016-06-17 10:49:48.550' AS DateTime), N'高高的', N'士大夫士大夫士大夫', N'12345333')
SET IDENTITY_INSERT [dbo].[CostHistory] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([ID], [Name], [CatID], [Num], [Points], [CoverPath], [BigPicPath], [IsOut], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (1, N'U盘', 1, 6, 100, N'201512/20151224160738276.jpg', N'', 0, N'金士顿U盘32G', N'admin', N'超级管理员', CAST(N'2015-12-24 16:07:48.827' AS DateTime), N' ')
INSERT [dbo].[Goods] ([ID], [Name], [CatID], [Num], [Points], [CoverPath], [BigPicPath], [IsOut], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (2, N'费列罗巧克力', 2, 99, 150, N'201512/20151224160833023.jpg', N'', 0, N'意大利进口 Ferrero Rocher费列罗榛果威化巧克力24粒钻石装300g', N'admin', N'超级管理员', CAST(N'2015-12-24 16:08:50.447' AS DateTime), N' ')
INSERT [dbo].[Goods] ([ID], [Name], [CatID], [Num], [Points], [CoverPath], [BigPicPath], [IsOut], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (3, N'埃普（UP）AP-5铝合金鼠标垫（小号）', 1, 222, 223, N'201604/20160416170635253.jpg', N'', 0, N'精密高光切削，简约时尚纤薄。
手感细腻顺滑，精致礼盒包装！', N'admin', N'超级管理员', CAST(N'2016-04-16 17:06:49.657' AS DateTime), N' ')
SET IDENTITY_INSERT [dbo].[Goods] OFF
SET IDENTITY_INSERT [dbo].[GoodsCat] ON 

INSERT [dbo].[GoodsCat] ([ID], [Name], [IsDel], [SortOrder], [Remarks], [ExtraFields]) VALUES (1, N'数码家电', 0, 0, N'', N' ')
INSERT [dbo].[GoodsCat] ([ID], [Name], [IsDel], [SortOrder], [Remarks], [ExtraFields]) VALUES (2, N'休闲零食', 0, 0, N'', N' ')
SET IDENTITY_INSERT [dbo].[GoodsCat] OFF
SET IDENTITY_INSERT [dbo].[Line] ON 

INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (1, N'北京3日游', 1, 4, N'1001', N'201512/20151224173233788.jpg', N'', N'3', N'甘肃', N'北京', N'飞机', N'飞机', N'报名报名报名报名报名报名报名报名报名报名报名须知须知须知', N'1品质保证：全程无购物，保证充足的游览时间！2景点安排：海上名山-【崂山风景区】； 【帆船出海】海中看高层林立、游人如织，不一样的角度，领略岛城别样风情； 【旅游观光电视塔】俯瞰青岛老城区，领略“红瓦、绿树、碧海、蓝天”之美景。3推荐理由：周末休闲独家好去处，沐浴阳光，享受沙滩，品尝海鲜美食、豪饮青岛啤酒！', N'', N'', CAST(499.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 10:56:44.783' AS DateTime), 0, N' ', 0, 0, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (2, N'青岛、崂山双飞4日纯玩品质游', 1, 4, N'2003', N'201512/20151224180335109.jpg', N'', N'4', N'甘肃', N'青岛', N'飞机', N'飞机', N'报名报名报名报名报名报名报名报名报名报名报名须知须知须知', N'适合暑期度假游、自驾游！
全程无购物，保证充足的游览时间！
赠送崂山一日游！
自由组合：高铁、飞机任意选择，更自由舒心！
休闲、舒适，安排更多自由活动，周末休闲度假好去处，沐浴阳光，享受沙滩，品尝海鲜美食、豪饮青岛啤酒！', N'', N'', CAST(399.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:04:07.327' AS DateTime), 0, N' ', 0, 0, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (3, N'日本【发现旅行】东京5天4晚机+酒自由行', 2, 14, N'3332222', N'201604/20160413164830355.jpg', N'', N'5', N'甘肃', N'日本', N'飞机', N'飞机', N'须知须知', N'说明说明', N'', N'', CAST(3399.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-13 16:49:15.110' AS DateTime), 0, N' ', 0, 0, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (4, N'日本『九州特惠』福冈连住阿苏别府双温泉悠闲5天', 2, 14, N'32432', N'201604/20160413164957813.jpg', N'', N'5', N'甘肃', N'日本', N'飞机', N'飞机', N'似的发射点', N'生生世世', N'', N'', CAST(2234.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-13 16:50:15.660' AS DateTime), 0, N' ', 0, 1, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (5, N'日本【当地游】富士山下赏樱1日游', 2, 14, N'63243', N'201604/20160413165055990.jpg', N'', N'1', N'', N'', N'', N'', N'', N'', N'', N'', CAST(545.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-13 16:51:03.913' AS DateTime), 0, N' ', 0, 1, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (6, N'日本【当地游】日立海滨公园「粉蝶花之丘」&足利花园「藤花」赏花1日游', 2, 14, N'23434', N'201604/20160413165132062.jpg', N'', N'1', N'', N'', N'', N'', N'', N'', N'', N'', CAST(433.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-13 16:51:38.303' AS DateTime), 0, N' ', 0, 1, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (7, N'【寻趣迪士尼】上海迪士尼•花样江南休闲之旅双飞4天皇牌华东', 1, 11, N'3243434', N'201604/20160413195530987.jpg', N'', N'4', N'ss', N'g第三代', N'水水', N'嘎嘎嘎', N'须知干活干活干活哈哈撒啊手动阀手动阀撒地方', N'说明手动阀手动阀似的发射点阿斯蒂芬', N'', N'', CAST(3599.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-13 19:47:48.337' AS DateTime), 0, N' ', 0, 1, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (8, N'【经典游•皇牌】东北全线双飞6天*经典东北', 18, 19, N'2343243', N'201604/20160414160635451.jpg', N'', N'6', N'', N'', N'', N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:06:42.963' AS DateTime), 0, N' ', 0, 1, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (9, N'【生态/温泉】白水寨、果园、崴格诗温泉二天（广从B）', 27, 28, N'24324324', N'201604/20160414160805331.jpg', N'', N'2', N'', N'', N'', N'', N'', N'', N'', N'', CAST(609.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:08:19.490' AS DateTime), 0, N' ', 0, 1, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (10, N'【超值华东特惠•扬州】全景华东水乡乌镇双飞六天', 18, 20, N'234234324', N'201604/20160414175940849.jpg', N'', N'6', N'', N'', N'', N'', N'', N'', N'', N'', CAST(999.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-14 17:59:42.543' AS DateTime), 0, N' ', 0, 0, 0, 0)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (11, N'【尚•博览】日本『绝美升龙道』米其林三星合掌村精品温泉京都深度6天', 2, 14, N'sfdsff', N'201604/20160414180105520.jpg', N'', N'6', N'', N'', N'', N'', N'', N'', N'', N'', CAST(7629.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-14 18:01:08.280' AS DateTime), 0, N' ', 0, 0, 0, 1)
INSERT [dbo].[Line] ([ID], [Name], [FirstCatID], [SecondCatID], [ProductNum], [CoverPath], [BigPicPath], [TravelDays], [StartAddress], [TargetAddress], [GoTravel], [BackTravel], [SignUpNotice], [LineDesc], [OtherNotice], [WarmTips], [MinPrice], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [IsDel], [ExtraFields], [IsTop], [IsHot], [HitTimes], [IsPickup]) VALUES (12, N'【臻逸•深度】『等待确认』日本版舌尖上的美食7天之旅', 2, 14, N'2342343', N'201604/20160414180151041.jpg', N'', N'7', N'', N'', N'', N'', N'报名嘘嘘嘻嘻嘻嘻嘻嘻嘻嘻嘻', N'说明说明说明说明说明说明说明说明说明说明说明说明说明说明说明', N'', N'', CAST(24899.00 AS Decimal(18, 2)), N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-14 18:01:52.500' AS DateTime), 0, N' ', 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Line] OFF
SET IDENTITY_INSERT [dbo].[LineCat] ON 

INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (1, N'当季游/主题游', 0, 0, 1, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (2, N'出境旅游', 0, 0, 3, N'', N' ', 1, 0, 1, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (3, N'崴格诗温泉', 1, 0, 1, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (4, N'日本温泉', 1, 0, 4, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (5, N'韩国', 2, 0, 4, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (6, N'迪拜', 2, 0, 5, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (7, N'悠闲海岛', 1, 0, 3, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (8, N'北京滑雪嬉冰', 1, 0, 2, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (9, N'赏花', 1, 0, 5, N'', N' ', 0, 1, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (10, N'毕业游', 1, 0, 6, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (11, N'上海迪士尼', 1, 0, 7, N'', N' ', 0, 1, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (12, N'美食', 1, 0, 8, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (13, N'甜蜜旅程', 1, 0, 9, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (14, N'日本', 2, 0, 0, N'', N' ', 0, 1, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (15, N'泰国', 2, 0, 1, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (16, N'文莱', 2, 0, 2, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (17, N'马来西亚', 2, 0, 3, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (18, N'国内旅游', 0, 0, 2, N'', N' ', 1, 0, 1, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (19, N'华东', 18, 0, 1, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (20, N'江西', 18, 0, 2, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (21, N'张家界', 18, 0, 3, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (22, N'凤凰古山', 18, 0, 4, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (23, N'三亚', 18, 0, 5, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (24, N'北京', 18, 0, 6, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (25, N'青海湖', 18, 0, 7, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (26, N'华山', 18, 0, 8, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (27, N'周边游', 0, 0, 4, N'', N' ', 0, 0, 1, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (28, N'富力岭南', 27, 0, 0, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (29, N'锦江温泉', 27, 0, 0, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (30, N'云天海', 27, 0, 0, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (31, N'金水谷', 27, 0, 0, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (32, N'丹霞山', 27, 0, 0, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (33, N'动物园', 27, 0, 0, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (34, N'上海', 18, 0, 9, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (35, N'其他1', 0, 0, 6, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (36, N'其他2', 0, 0, 7, N'', N' ', 0, 0, 0, 0, 0)
INSERT [dbo].[LineCat] ([ID], [Name], [ParentID], [IsDel], [SortOrder], [Remarks], [ExtraFields], [IsShowIndex], [IsHotSell], [IsHotSort], [IsSearchWord], [HitTimes]) VALUES (37, N'其他3', 0, 0, 5, N'', N' ', 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[LineCat] OFF
SET IDENTITY_INSERT [dbo].[LineDetail] ON 

INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (1, 1, N'上海虹桥南昌西站', N'客人自行前往上海虹桥火车站集合，乘坐高铁前往南昌西站。抵达后，专人接站，乘坐南昌高铁巴士1号线，后前往市区酒店入住。
参考车次：
G1389次/13：17-16：42分或G1375次/13：45-17：29分
G1355次/13：50-17：47分或G1393次/17：46-21：39分
（上海虹桥至南昌有20多趟高铁，客人可根据需要购买）', N'201512/20151224110059096.jpg|201512/20151224110102356.jpg|', 1, N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 10:57:59.207' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (2, 1, N'南昌井冈山，井冈山游览', N'●早抵达后于指定地点集合出发(步行前往约5-10分钟)，车赴革命摇篮—【井冈山】大门票、观光车已含（全程高速及一级盘山公路约350公里，车程约4.5小时），参观井冈山——“一号工程”【博物馆】（周一闭馆）；中餐后参观中国第一画【井冈山斗争全景画声光电演示管】（60元/人自费）：体验到“五百里井冈尽现眼底，八十年前峰火再现眼前”的真实情景，乘观光车赴井冈山财富之山 【笔架山】缆车（162元/人自理，游览约2个半小时),景区位于全国著名的5A级风景名胜区井冈山南大门，景区以纯天然自然景区为主，以“十里杜鹃长廊”、“七大峰”、“五大奇观”而享誉。辅以特有的人文、历史景观，形成了笔架山内独具风格的“红”、“绿”交相辉映的旅游佳境格局，令人仰慕和神往。晚上自由活动，可逛井冈山天街。', N'||', 2, N'三餐：中晚 酒店：井冈山山上', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 10:58:29.247' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (3, 1, N'南昌西上海虹桥', N'●退房自行品尝南昌特色早餐。（南昌炒粉、南昌瓦罐汤等特色美食）
●后可自行参观南昌市区景点，例如：【八一广场】、【八一起义纪念碑】、【八一起义纪念馆】等，后“自行”赴南昌西站乘高铁返回上海（建议乘坐：高铁巴士1号线5元/人），结束愉快的行程，回到温暖的家。
参考车次：
G1346次/09：36-13：20分或G1368/10：07-13：59分
G1388次/13：25-17：23分或G1356/15：33-19：12分
 （或客人根据需要选其他20多趟不同时间段的同级车次）', N'||', 3, N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 10:59:05.763' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (4, 2, N'上海青岛', N'乘飞机或高铁赴浪漫海滨城市青岛，抵达后，自行入住酒店，自由活动！', N'||', 1, N'温馨提示： 三餐： 酒店：青岛', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:07:54.697' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (5, 2, N'青岛崂山', N'早上乘车出发，前往我国海岸线上唯一过千米的山峰、素有“海上名山第一”之美誉的【崂山】（5A级景区，共约游览5小时），沿途观赏青岛黄金海岸线，游览【中华人民共和国水准零点风景区】（4A级景区，约40分钟），感受“高度从这里开始”的体验，进山后先登山观崂山最大的寺庙【华严寺】（游览约90分钟），后乘车途经有“棋盘仙弈”之称的棋盘石风景区，游览垭口风景区（或仰口风景区 游览约2小时左右），可自行爬山或乘坐索道空中观山海相连、海天一色美景（索道需自行购买），后前往【八水河】(游览约20分钟)拍照留念,途经有大自然鬼斧神工的象形石——【青蛙石】、【石老人】，后返回青岛市内，入住酒店。', N'||', 2, N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:08:39.513' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (6, 2, N'青岛市区', N'早餐后，自由活动。客人可自行游览青岛特色景点：【栈桥】、【五四广场】、【步行参观八大关特色建筑】、【迎宾馆】、【啤酒博物馆】等，晚上可自行品尝青岛特色美食，如【登云路啤酒一条街】这里惹眼的绿色马路及以酒为母体的景观雕塑和风格各异的酒吧，展现了青岛啤酒文化风情，使整条街的啤酒氛围浓郁，来到这里，品尝新鲜酿制的原浆扎啤，吃地道的鲁菜，享受美食带给乐趣！这里已成为岛城“永不落幕的啤酒节”。', N'201512/20151224180926630.jpg|201512/20151224180934839.jpg|', 3, N'三餐：早 酒店：青岛', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:09:36.067' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (7, 2, N'青岛上海', N'早上睡至自然醒，客人自由活动。自行选择乘下午高铁返回，或选择晚上乘飞机返回 ，结束愉快行程！', N'||', 4, N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:09:52.610' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (8, 7, N'上海[飞机]北京', N'手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。手动阀阿斯蒂芬速度士大夫。', N'||', 1, N'免费', N'上饶全程入住挂牌四星（参考和平国际及维多利亚皇家）标准间', N'admin', N'超级管理员', CAST(N'2016-04-25 11:48:09.610' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (9, 7, N'噶士大夫[汽车]老公了旮都是', N'啊广东省分散的噶似的222222222', N'||', 2, N'噶士大夫士大夫阿斯顿的萨芬阿三222222222', N'', N'admin', N'超级管理员', CAST(N'2016-04-25 11:48:33.010' AS DateTime), N' ')
INSERT [dbo].[LineDetail] ([ID], [LineID], [Title], [DayDesc], [DayPics], [SortOrder], [WarmTips], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (10, 7, N'阿斯蒂芬[轮船]噶士大夫', N'阿斯蒂芬噶似的33333333', N'201604/20160425114929990.jpg|201604/20160425114933105.jpg|', 3, N'阿斯蒂芬嘎斯东方33333333', N'', N'admin', N'超级管理员', CAST(N'2016-04-25 11:49:34.113' AS DateTime), N' ')
SET IDENTITY_INSERT [dbo].[LineDetail] OFF
SET IDENTITY_INSERT [dbo].[MemberFav] ON 

INSERT [dbo].[MemberFav] ([ID], [UserName], [FavType], [FavObjID], [AddTime], [ExtraFields]) VALUES (2, N'member001', N'Line', N'1', CAST(N'2016-06-08 17:22:09.267' AS DateTime), N' ')
INSERT [dbo].[MemberFav] ([ID], [UserName], [FavType], [FavObjID], [AddTime], [ExtraFields]) VALUES (3, N'member001', N'Line', N'2', CAST(N'2016-06-08 17:22:19.270' AS DateTime), N' ')
INSERT [dbo].[MemberFav] ([ID], [UserName], [FavType], [FavObjID], [AddTime], [ExtraFields]) VALUES (7, N'member001', N'Line', N'6', CAST(N'2016-06-09 09:14:23.073' AS DateTime), N' ')
SET IDENTITY_INSERT [dbo].[MemberFav] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (1, N'201512282046317630000000001', 4, 1, N'member001', N'士大夫1222', N'男', N'32432432', N'24234', CAST(N'2015-12-28 20:46:31.783' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (2, N'201512282046317630000000001', 4, 1, N'member001', N'士大夫但是31', N'女', N'222222', N'343434', CAST(N'2015-12-28 20:46:31.790' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (3, N'201512282046317630000000001', 4, 1, N'member001', N'似懂非懂是否31', N'男', N'325234', N'234324324', CAST(N'2015-12-28 20:46:31.790' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (4, N'201512291631193300000000001', 8, 2, N'member001', N'', N'', N'', N'', CAST(N'2015-12-29 16:31:19.377' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (5, N'201604251629001130000000001', 31, 7, N'member001', N'1', N'男', N'2', N'2343', CAST(N'2016-04-25 16:29:00.130' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (6, N'201604251629001130000000001', 31, 7, N'member001', N'2', N'女', N'2', N'222', CAST(N'2016-04-25 16:29:00.137' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (7, N'201604251629001130000000001', 31, 7, N'member001', N'3', N'女', N'2', N'22', CAST(N'2016-04-25 16:29:00.137' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (8, N'201604251629001130000000001', 31, 7, N'member001', N'4', N'女', N'2', N'22', CAST(N'2016-04-25 16:29:00.137' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (9, N'201604251629001130000000001', 31, 7, N'member001', N'5', N'女', N'2', N'22', CAST(N'2016-04-25 16:29:00.137' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (10, N'201604251629001130000000001', 31, 7, N'member001', N'6', N'女', N'2', N'22', CAST(N'2016-04-25 16:29:00.137' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (11, N'201604251629001130000000001', 31, 7, N'member001', N'7', N'女', N'2', N'22', CAST(N'2016-04-25 16:29:00.140' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (12, N'201606031615157970000000001', 38, 12, N'member001', N'啊啊', N'女', N'222', N'222', CAST(N'2016-06-03 16:15:15.830' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (13, N'201606031615157970000000001', 38, 12, N'member001', N'得到', N'男', N'22', N'22', CAST(N'2016-06-03 16:15:15.830' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (14, N'201606031805498550000000001', 38, 12, N'member001', N'', N'', N'', N'', CAST(N'2016-06-03 18:05:49.857' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (15, N'201606031809325860000000002', 38, 12, N'member001', N'', N'', N'', N'', CAST(N'2016-06-03 18:09:32.587' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (16, N'201606061021004290000000001', 38, 12, N'member001', N'士大夫', N'男', N'234324', N'示范点', CAST(N'2016-06-06 10:21:00.443' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (17, N'201606150909205590000000001', 42, 12, N'member001', N'是', N'男', N'34', N'234', CAST(N'2016-06-15 09:09:20.587' AS DateTime), N'', N' ')
INSERT [dbo].[OrderDetail] ([ID], [OrderNum], [GroupID], [LineID], [AddMemberName], [RealName], [Sex], [IDNum], [MobileNum], [AddTime], [Remarks], [ExtraFields]) VALUES (18, N'201606150909205590000000001', 42, 12, N'member001', N'士大夫', N'男', N'342', N'234324', CAST(N'2016-06-15 09:09:20.593' AS DateTime), N'', N' ')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[PicWall] ON 

INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (1, N'5.28晚会现场', N'201512/20151221165204958.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-21 16:52:07.720' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (2, N'嘉兴推荐会', N'201512/20151221165241580.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-21 16:52:42.673' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (3, N'sdfdsd', N'201603/20160307093224410.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-03-07 09:32:25.613' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (4, N'嘉兴湖州推荐会', N'201604/20160415094707448.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:47:08.257' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (5, N'晚会', N'201604/20160415094738369.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:47:39.347' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (6, N'绍兴推荐会', N'201604/20160415094757405.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:47:58.117' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (7, N'合作交流会', N'201604/20160415094837174.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:48:38.123' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (8, N'青岛推介会现场', N'201604/20160415094904513.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:49:05.243' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (9, N'辽宁·锦州推介会', N'201604/20160415095000738.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:50:01.393' AS DateTime), 0, 0, N' ')
INSERT [dbo].[PicWall] ([ID], [Name], [CoverPath], [BigPicPath], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [SortOrder], [IsTop], [ExtraFields]) VALUES (10, N'南通招商签约会', N'201604/20160415095028137.jpg', N'', N'', N'admin', N'超级管理员', CAST(N'2016-04-15 09:50:28.953' AS DateTime), 0, 0, N' ')
SET IDENTITY_INSERT [dbo].[PicWall] OFF
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([ID], [Name], [CoverPath], [PromotionDesc], [PromotionType], [Discount], [TotalPayOneTime], [TotalPayOneTimeJoinNum], [FullCutTotal], [FullCutMinus], [SecondKillPrice], [StartTime], [EndTime], [IsDel], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (1, N'元旦八折大优惠', N'201512/20151224161218664.jpg', N'团位一律八折，数量有限，先到先得', N'折扣', CAST(0.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-12-24 00:00:00.000' AS DateTime), CAST(N'2016-10-23 00:00:00.000' AS DateTime), 0, N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 16:12:35.003' AS DateTime), N' ')
INSERT [dbo].[Promotion] ([ID], [Name], [CoverPath], [PromotionDesc], [PromotionType], [Discount], [TotalPayOneTime], [TotalPayOneTimeJoinNum], [FullCutTotal], [FullCutMinus], [SecondKillPrice], [StartTime], [EndTime], [IsDel], [Tag], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (2, N'1999元2团位', N'201512/20151224161404830.jpg', N'一次购买2个团位，只需1999', N'打包', CAST(0.00 AS Decimal(18, 2)), CAST(1999.00 AS Decimal(18, 2)), 2, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2015-12-01 00:00:00.000' AS DateTime), CAST(N'2016-10-24 00:00:00.000' AS DateTime), 0, N'', N'', N'admin', N'超级管理员', CAST(N'2015-12-24 16:14:15.200' AS DateTime), N' ')
SET IDENTITY_INSERT [dbo].[Promotion] OFF
SET IDENTITY_INSERT [dbo].[PromotionGroup] ON 

INSERT [dbo].[PromotionGroup] ([ID], [PromotionID], [GroupID], [LineID], [TotalNum], [SelledNum], [RemainNum], [RawInnerPrice], [RawOuterPrice], [BeginTime], [AddTime], [ExtraFields]) VALUES (1, 1, 12, 2, 5, 0, 0, CAST(488.00 AS Decimal(18, 2)), CAST(588.00 AS Decimal(18, 2)), CAST(N'2015-12-28 08:59:08.530' AS DateTime), CAST(N'2015-12-28 08:59:08.530' AS DateTime), N' ')
INSERT [dbo].[PromotionGroup] ([ID], [PromotionID], [GroupID], [LineID], [TotalNum], [SelledNum], [RemainNum], [RawInnerPrice], [RawOuterPrice], [BeginTime], [AddTime], [ExtraFields]) VALUES (3, 1, 11, 2, 5, 0, 0, CAST(488.00 AS Decimal(18, 2)), CAST(588.00 AS Decimal(18, 2)), CAST(N'2015-12-28 09:52:44.343' AS DateTime), CAST(N'2015-12-28 09:52:44.343' AS DateTime), N' ')
INSERT [dbo].[PromotionGroup] ([ID], [PromotionID], [GroupID], [LineID], [TotalNum], [SelledNum], [RemainNum], [RawInnerPrice], [RawOuterPrice], [BeginTime], [AddTime], [ExtraFields]) VALUES (4, 1, 7, 1, 5, 0, 0, CAST(499.00 AS Decimal(18, 2)), CAST(599.00 AS Decimal(18, 2)), CAST(N'2015-12-28 09:52:48.837' AS DateTime), CAST(N'2015-12-28 09:52:48.837' AS DateTime), N' ')
INSERT [dbo].[PromotionGroup] ([ID], [PromotionID], [GroupID], [LineID], [TotalNum], [SelledNum], [RemainNum], [RawInnerPrice], [RawOuterPrice], [BeginTime], [AddTime], [ExtraFields]) VALUES (5, 2, 42, 12, 12, 0, 0, CAST(3200.00 AS Decimal(18, 2)), CAST(3233.00 AS Decimal(18, 2)), CAST(N'2016-04-28 09:43:42.837' AS DateTime), CAST(N'2016-04-28 09:43:42.837' AS DateTime), N' ')
INSERT [dbo].[PromotionGroup] ([ID], [PromotionID], [GroupID], [LineID], [TotalNum], [SelledNum], [RemainNum], [RawInnerPrice], [RawOuterPrice], [BeginTime], [AddTime], [ExtraFields]) VALUES (6, 2, 30, 8, 10, 0, 0, CAST(2299.00 AS Decimal(18, 2)), CAST(2399.00 AS Decimal(18, 2)), CAST(N'2016-04-28 10:26:42.397' AS DateTime), CAST(N'2016-04-28 10:26:42.397' AS DateTime), N' ')
INSERT [dbo].[PromotionGroup] ([ID], [PromotionID], [GroupID], [LineID], [TotalNum], [SelledNum], [RemainNum], [RawInnerPrice], [RawOuterPrice], [BeginTime], [AddTime], [ExtraFields]) VALUES (7, 1, 42, 12, 10, 0, 10, CAST(3200.00 AS Decimal(18, 2)), CAST(3233.00 AS Decimal(18, 2)), CAST(N'2016-04-28 12:00:45.357' AS DateTime), CAST(N'2016-04-28 12:00:45.357' AS DateTime), N' ')
SET IDENTITY_INSERT [dbo].[PromotionGroup] OFF
SET IDENTITY_INSERT [dbo].[QA] ON 

INSERT [dbo].[QA] ([ID], [CatName], [QATitle], [QAContent]) VALUES (1, N'网上支付问题', N'网上付款方式', N'<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;"><span style="color: #ff0000;">目前我们接受的付款方式包括：</span></p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">&nbsp;</p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><strong>一、网上支付</strong></span></p>
<p><br /><br /></p>
<table style="font: 14px/24px Arial, 宋体; border: 1px solid #ffffff; color: #000000; font-size-adjust: none; font-stretch: normal;" border="0" width="600" cellspacing="0" cellpadding="0" bgcolor="#e9e9e9">
<tbody>
<tr>
<td style="border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" align="center" bgcolor="#ffffff">1</td>
<td style="padding-left: 25px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" bgcolor="#ffffff" width="25%">支付宝</td>
<td style="padding-left: 25px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" bgcolor="#ffffff" width="35%">适合经常&ldquo;淘宝&rdquo;的用户</td>
<td style="padding: 3px 0px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" align="center" bgcolor="#ffffff" width="35%"><img src="http://b2c.gzl.cn/b2c-image/2015/11/20/954ad7ee-5dd7-423f-8eee-dd2f745aaf17.jpg" alt="" /></td>
</tr>
<tr>
<td style="border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" align="center" bgcolor="#ffffff">2</td>
<td style="padding-left: 25px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" bgcolor="#ffffff" width="25%">快钱</td>
<td style="padding-left: 25px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" bgcolor="#ffffff" width="35%">适合使用信用卡支付的用户</td>
<td style="padding: 3px 0px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" align="center" bgcolor="#ffffff" width="35%"><img src="http://b2c.gzl.cn/b2c-image/2015/11/20/ebf53a45-b0b0-4668-8486-0be21fdb7cd3.jpg" alt="" /></td>
</tr>
<tr>
<td style="border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" align="center" bgcolor="#ffffff">3</td>
<td style="padding-left: 25px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" bgcolor="#ffffff" width="25%">自游通卡（绿版）</td>
<td style="padding-left: 45px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" bgcolor="#ffffff" width="35%">&nbsp;</td>
<td style="padding: 3px 0px; border-bottom-color: #e9e9e9; border-bottom-width: 1px; border-bottom-style: dashed;" align="center" bgcolor="#ffffff" width="35%"><img src="http://b2c.gzl.cn/b2c-image/2015/11/20/4e2dfbae-ec62-437a-92cc-d9e2a57da73f.jpg" alt="" /></td>
</tr>
</tbody>
</table>
<p><br /><br /></p>
<p>&nbsp;</p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><strong>二、银行转账</strong></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">通过银行汇款以后请务必联系广之旅客服，告诉我们您的款项已经汇出，以及汇出的银行、金额、联系人姓名和联系地址。</p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">广之旅对公账户信息如下：</p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">户名：广州广之旅国际旅行社股份有限公司</p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">帐号：3602015019200530369</p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">开户银行：广州市工行粤秀支行</p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">&nbsp;</p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;"><strong>三、门市部付款</strong></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">可以前往广之旅门市部交款，交款时请告诉营业人员您的订单号码，并向营业人员索取收款凭证。</p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">※ 营业网点请点击&ldquo;<a href="http://www.gzl.com.cn/b2c-web/storeInfo/storeInfo.html" target="_blank"><span style="font: 14px/24px Arial, 宋体; padding: 4px 1px; color: #7388c1; text-decoration: underline; font-size-adjust: none; font-stretch: normal;">门市网点列表</span></a>&rdquo;查看（注：网站预订的订单，暂时只能在广州市区内门市部交款，具体可先致电咨询。）</p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;">&nbsp;</p>
<p><br /><br /></p>
<p style="font: 16px/24px Arial, 宋体; margin: 0px; color: #333333; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><strong>四、中国工商银行网银支付</strong></span></p>
<p><br /><br /></p>
<p><img src="http://b2c.gzl.cn/b2c-image/2016/1/12/1ab6c39a-edbe-4be4-8e39-4a8a8c4becf4.png" alt="" /></p>')
INSERT [dbo].[QA] ([ID], [CatName], [QATitle], [QAContent]) VALUES (2, N'网上支付问题', N'如何使用自游通卡支付', N'<p><strong><span style="color: #0000ff; font-family: ''宋体'', sans-serif; font-size: 18px;">本教程应用场景：</span></strong><br /> <strong><span style="color: #0000ff; font-family: ''宋体'', sans-serif; font-size: 18px;">单张自游通卡面额不足以支付全额费用，拥有多张自游通卡需要进行多次支付</span></strong></p>
<p><br /><br /></p>
<p><strong><span style="color: #0000ff; font-family: ''宋体'', sans-serif; font-size: 18px;">例如：总费用为1500元，单张自游通卡面额为1000元/张，共有两张卡。</span></strong></p>
<p><br /><br /></p>
<p><strong><span style="font-family: ''宋体'', sans-serif; font-size: 18px;">&nbsp;</span></strong></p>
<p><br /><br /></p>
<p><strong><span style="font-family: ''宋体'', sans-serif; font-size: 18px;">第一步：进入支付页面，在&ldquo;本次支付金额&rdquo;中，输入自游通卡可用余额，例如此处输入1000；</span></strong></p>
<p><br /><br /></p>
<p>&nbsp;<img src="http://b2b.gzl.com.cn/Administrator/UploadFile/Editor/Image/2013/07/20130716180556331.jpg" width="850" height="372" border="0" /></p>
<p><br /><br /></p>
<p><strong><span style="font-family: ''宋体'', sans-serif; font-size: 18px;">第二步：选择自游通卡进行支付；</span></strong></p>
<p><br /><br /></p>
<p><img src="http://b2b.gzl.com.cn/Administrator/UploadFile/Editor/Image/2013/07/20130716180615518.jpg" width="850" height="369" border="0" /></p>
<p><br /><br /></p>
<p><strong><span style="font-family: ''宋体'', sans-serif; font-size: 18px;">第三步：跳转到支付页面，输入卡号、密码完成交易；</span></strong></p>
<p><br /><br /></p>
<p><img src="http://b2b.gzl.com.cn/Administrator/UploadFile/Editor/Image/2013/07/20130716180654081.jpg" width="750" height="430" border="0" /></p>
<p><br /><br /></p>
<p>&nbsp;</p>
<p><br /><br /></p>
<p><strong><span style="font-family: ''宋体'', sans-serif; font-size: 18px;">第四步：再次回到支付页面，在&ldquo;本次支付金额&rdquo;中输入需要支付的余额，例如本例中需要输入500；</span></strong></p>
<p><br /><br /></p>
<p><img src="http://b2b.gzl.com.cn/Administrator/UploadFile/Editor/Image/2013/07/20130716180710252.jpg" width="850" height="371" border="0" /></p>
<p><br /><br /></p>
<p><strong><span style="font-family: ''宋体'', sans-serif; font-size: 18px;">第五步：按流程完成支付即可。</span></strong></p>
<p><br /><br /><br /></p>')
INSERT [dbo].[QA] ([ID], [CatName], [QATitle], [QAContent]) VALUES (4, N'旅游常见概念解释', N'旅游电子合同介绍', N'<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 15px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">一、广东省旅游电子合同管理服务系统简介</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">为进一步促进旅游电子商务的发展，保障游客切身利益，方便参与旅游，杜绝旅游行业低价竞争，规范旅游市场秩序，广东省旅游局建设了 "广东省电子合同管理服务系统"（以下简称电子合同系统）。该系统实现旅游合同电子化签署、变更、撤销、存放、查阅、取证以及数据统计汇总分析、行业行政监管、游客查询、旅行社内部辅助管理等功能的信息系统。游客可通过在线选购旅游电子合同线路，直接在网上与旅行社签订电子合同，合同存放在旅游局系统中，可随时供游客查阅。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 15px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">二、什么是旅游电子合同？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">游客通过计算机、手机等设备在互联网上与旅行社签订的以电子信息形式达成的旅游合同。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 15px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">三、签订旅游电子合同的好处？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">1.更方便：游客足不出户，就可以通过在线选购旅游电子合同线路，直接在网上与旅行社签订电子合同，实现在线交易，并可随时随地通过网络查询合同内容。</span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">2.更实惠：同一时间内同一线路产品，旅行社承诺网上签订电子合同线路价格最实惠。有统一网上销售价格，不议价。</span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">3.更有保障：电子合同线路在旅游行政管理部门使用统一制定的合同模板备案，线路质量有保障；游客与旅行社一旦发生合同纠纷，旅游投诉受理部门通过电子合同系统查阅双方合同内容，协调纠纷，维护游客的合法权益。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 15px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">四、如何签订旅游电子合同？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">游客可通过指定的旅行社网站或优游网等第三方旅游电商平台上签订电子合同，如下图所示：</span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><img src="http://b2b.gzl.com.cn/Administrator/UploadFile/Editor/Image/2013/07/20130718105507862.jpg" width="750" height="562" border="0" /></span></p>
<p><br /><br /><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 15px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">五、旅游电子合同常见问题解答</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">1.问:电子合同是否具有法律效力？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:电子合同具备旅行社电子签章，根据电子签名法规定，与纸质合同一样具有同等法律效力，合同的意义和作用都没有改变。因此对旅行社与游客双方签订旅游电子合同后是否履行合同约定具有约束效力。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">2.问:旅游电子合同与传统纸质合同有什么区别？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:传统纸质合同是旅行社与游客通过文字方式来签订旅游合同，合同的生效以签字盖章方式确认。在旅游电子商务中，旅游合同生效以电子签名方式确认，游客直接通过网络向旅行社支付团费，合同生成后存放在电子合同系统中，保护了游客权益，节省了合同双方交易时间。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">3.问:游客在旅行社门店如何签订旅游电子合同？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:游客在旅行社门店报名参团，先由旅行社工作人员登陆电子合同系统或旅行社业务系统登记游客参团信息，电子合同生成前旅行社打印合同给游客确认，最后在系统提交并生成电子合同。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">4.问:游客如何确认旅游电子合同已经生成？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:电子合同提交后，游客手机将会收到系统发出的合同验证码与合同编号，证明电子合同已完成签订并生效。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">5.问:旅游电子合同能否打印？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:可以。游客凭合同验证码与编号登录电子合同查询页面后便可在线打印。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">6.问:旅游电子合同生成后，能否修改合同内容或解除合同？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:电子合同生成后具有法律约束力，按规定单方面不能修改或解除。如果合同双方经协商达成一致意见，可以修改或解除。如需修改存放于系统中的电子合同，游客需向旅行社提供合同验证码，并由旅行社登录系统完成操作。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">7.问:旅游电子合同由什么部门监管？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:电子合同与传统纸质合同一样，其监管部门为省或市旅游质监所。</span></p>
<p><br /><br /></p>
<p style="font: 14px/22px Arial, 宋体; padding: 6px 0px; color: #666666; text-indent: 1em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;"><span style="font: 700 14px/normal 微软雅黑, 黑体; padding: 1px 2px; font-size-adjust: none; font-stretch: normal;">8.问:游客向旅游质监所投诉电子合同线路服务质量问题主要有哪些渠道？</span></span></p>
<p><br /><br /></p>
<p style="font: 14px/24px Arial, 宋体; margin: 0px; padding: 6px 0px; color: #666666; text-indent: 2em; font-size-adjust: none; font-stretch: normal;"><span style="color: #000000;">答:投诉的主要渠道有：电话投诉（广东12301旅游服务热线）、网上投诉（广东省旅游局政务网）、书面投诉（邮寄）、上门投诉（上访）。</span></p>')
INSERT [dbo].[QA] ([ID], [CatName], [QATitle], [QAContent]) VALUES (5, N'签证相关问题', N'什么是签证？', N'<p><span style="color: #000000;">签证是一个国家的主权机关在本国或外国公民所持的护照或其他旅行证件上的签注、盖印，以表示允许其出入本国国境或者经过国境的手续，也可以说是颁发给他们的一项签注式的证明。</span></p>')
SET IDENTITY_INSERT [dbo].[QA] OFF
INSERT [dbo].[SiteMember] ([UserName], [UserPwd], [RealName], [HeadPicPath], [Sex], [MobileNum], [IDNum], [Email], [QQ], [WeChat], [TotalCost], [TotalPoints], [UsedPoints], [AddTime], [Remarks], [InviteNum], [InviterUserName], [InviterRealName], [ExtraFields]) VALUES (N'member001', N'21232F297A57A5A743894A0E4A801FC3', N'高高的', N'', N'男', N'12345333', N'', N'', N'', N'', CAST(4697.00 AS Decimal(18, 2)), 4697, 550, CAST(N'2015-12-26 09:25:14.677' AS DateTime), N'', N'0002', N'test001', N'测试员工2', N' ')
INSERT [dbo].[SiteMember] ([UserName], [UserPwd], [RealName], [HeadPicPath], [Sex], [MobileNum], [IDNum], [Email], [QQ], [WeChat], [TotalCost], [TotalPoints], [UsedPoints], [AddTime], [Remarks], [InviteNum], [InviterUserName], [InviterRealName], [ExtraFields]) VALUES (N'member002', N'21232F297A57A5A743894A0E4A801FC3', N'张老大', N'', N'女', N'', N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), 0, 0, CAST(N'2015-12-29 18:52:46.267' AS DateTime), N'', N'0002', N'test001', N'测试员工2', N' ')
INSERT [dbo].[SiteMember] ([UserName], [UserPwd], [RealName], [HeadPicPath], [Sex], [MobileNum], [IDNum], [Email], [QQ], [WeChat], [TotalCost], [TotalPoints], [UsedPoints], [AddTime], [Remarks], [InviteNum], [InviterUserName], [InviterRealName], [ExtraFields]) VALUES (N'member009', N'21232F297A57A5A743894A0E4A801FC3', N'', N'', N'', N'', N'', N'', N'', N'', CAST(0.00 AS Decimal(18, 2)), 0, 0, CAST(N'2016-06-20 10:18:01.880' AS DateTime), N'', N'0001', N'admin', N'超级管理员', N' ')
INSERT [dbo].[SiteSetting] ([ID], [HotSearchWords], [ExtraFields]) VALUES (1, N'迪士尼|日本|华东|果园|双飞|东北|休闲|北京|花样|青岛|温泉', N'<?xml version="1.0"?>
<ExFields>
  <Field Name="Copyright" Value="本网站产品和服务由甘肃环球国际旅行社提供。© 2016 版权所有 | ICP经营许可号：陇ICP备13071273号-2" />
</ExFields>')
INSERT [dbo].[SiteUser] ([Name], [Pwd], [RealName], [RoleIDs], [LastLoginTime], [LastLoginIP], [ThisLoginTime], [ThisLoginIP], [InviteNum], [Remarks], [UserStatus], [ExtraFields]) VALUES (N'admin', N'21232F297A57A5A743894A0E4A801FC3', N'超级管理员', N'0', CAST(N'2016-07-04 09:45:59.663' AS DateTime), N'113.70.238.12', CAST(N'2016-08-25 17:29:16.250' AS DateTime), N'::1', N'0001', N'', N'启用', N' ')
INSERT [dbo].[SiteUser] ([Name], [Pwd], [RealName], [RoleIDs], [LastLoginTime], [LastLoginIP], [ThisLoginTime], [ThisLoginIP], [InviteNum], [Remarks], [UserStatus], [ExtraFields]) VALUES (N'test001', N'21232F297A57A5A743894A0E4A801FC3', N'测试员工2', N'1', CAST(N'2015-12-26 08:58:33.793' AS DateTime), N'127.0.0.1', CAST(N'2015-12-26 08:58:33.793' AS DateTime), N'127.0.0.1', N'0002', N'', N'启用', N' ')
INSERT [dbo].[SiteUser] ([Name], [Pwd], [RealName], [RoleIDs], [LastLoginTime], [LastLoginIP], [ThisLoginTime], [ThisLoginIP], [InviteNum], [Remarks], [UserStatus], [ExtraFields]) VALUES (N'test003', N'21232F297A57A5A743894A0E4A801FC3', N'测试员工3', N'1', CAST(N'2015-12-26 09:05:36.293' AS DateTime), N'127.0.0.1', CAST(N'2015-12-26 09:05:36.293' AS DateTime), N'127.0.0.1', N'0003', N'', N'启用', N' ')
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID], [Name], [PicPath], [Url], [AddTime], [AddUserName], [SortOrder], [IsTop], [IsShow]) VALUES (1, N'幻灯1', N'201604/20160414113500363.jpg', N'http://baidu.com', CAST(N'2016-04-14 11:35:01.797' AS DateTime), N'admin', 1, 0, 0)
INSERT [dbo].[Slider] ([ID], [Name], [PicPath], [Url], [AddTime], [AddUserName], [SortOrder], [IsTop], [IsShow]) VALUES (2, N'幻灯2222343', N'201604/20160414113835514.jpg', N'http://www.qq.com', CAST(N'2016-04-14 11:38:36.577' AS DateTime), N'admin', 2, 0, 0)
INSERT [dbo].[Slider] ([ID], [Name], [PicPath], [Url], [AddTime], [AddUserName], [SortOrder], [IsTop], [IsShow]) VALUES (3, N'幻灯34324333', N'201604/20160414113854757.jpg', N'http://www.sohu.com', CAST(N'2016-04-14 11:38:55.640' AS DateTime), N'admin', 3, 0, 0)
INSERT [dbo].[Slider] ([ID], [Name], [PicPath], [Url], [AddTime], [AddUserName], [SortOrder], [IsTop], [IsShow]) VALUES (4, N'还等噶士大夫', N'201604/20160414113919374.jpg', N'http://www.163.com', CAST(N'2016-04-14 11:39:20.200' AS DateTime), N'admin', 4, 0, 0)
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[TravelGroup] ON 

INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (3, 1, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-04 00:00:00.000' AS DateTime), N'2016-1-1 16点', N'火星', N'不接送', N'', N'', CAST(599.00 AS Decimal(18, 2)), CAST(499.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'李四', N'', 1, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 15:27:40.073' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (4, 1, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), N'2016-1-1 16点', N'火星', N'不接送', N'', N'', CAST(599.00 AS Decimal(18, 2)), CAST(499.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'张三', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 16:01:40.130' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (5, 1, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-03 00:00:00.000' AS DateTime), CAST(N'2016-01-06 00:00:00.000' AS DateTime), N'2016-1-3 16点', N'火星', N'不接送', N'', N'', CAST(699.00 AS Decimal(18, 2)), CAST(599.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'王五', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 16:04:13.767' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (6, 1, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-04 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), N'2016-1-7 16点', N'火星', N'不接送', N'', N'', CAST(799.00 AS Decimal(18, 2)), CAST(499.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'马六', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 16:04:18.027' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (7, 1, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2016-01-08 00:00:00.000' AS DateTime), N'2016-1-1 16点', N'火星', N'不接送', N'', N'', CAST(599.00 AS Decimal(18, 2)), CAST(499.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'张三', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 16:04:23.113' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (8, 2, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-01-05 00:00:00.000' AS DateTime), N'当天下午四点', N'甘肃', N'接送信息接送信息', N'', N'', CAST(588.00 AS Decimal(18, 2)), CAST(488.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'刘大', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:15:43.717' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (9, 2, N'', 30, 10, 0, 0, N'', CAST(N'2016-01-02 00:00:00.000' AS DateTime), CAST(N'2016-01-06 00:00:00.000' AS DateTime), N'当天下午四点', N'甘肃', N'接送信息接送信息', N'', N'', CAST(588.00 AS Decimal(18, 2)), CAST(488.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'张一', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:15:48.750' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (10, 2, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-03 00:00:00.000' AS DateTime), CAST(N'2016-01-07 00:00:00.000' AS DateTime), N'当天下午四点', N'甘肃', N'接送信息接送信息', N'', N'', CAST(588.00 AS Decimal(18, 2)), CAST(488.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'张二', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:15:51.130' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (11, 2, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-04 00:00:00.000' AS DateTime), CAST(N'2016-01-08 00:00:00.000' AS DateTime), N'当天下午四点', N'甘肃', N'接送信息接送信息', N'', N'', CAST(588.00 AS Decimal(18, 2)), CAST(488.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'张三', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:15:53.317' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (12, 2, N'', 20, 10, 0, 0, N'', CAST(N'2016-01-05 00:00:00.000' AS DateTime), CAST(N'2016-01-09 00:00:00.000' AS DateTime), N'当天下午四点', N'甘肃', N'接送信息接送信息', N'', N'', CAST(588.00 AS Decimal(18, 2)), CAST(488.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'张氏', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2015-12-24 18:15:55.443' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (13, 6, N'', 33, 22, 0, 0, N'', CAST(N'2016-04-14 00:00:00.000' AS DateTime), CAST(N'2016-04-15 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(223.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-13 17:14:05.457' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (14, 6, N'', 33, 22, 0, 0, N'', CAST(N'2016-04-15 00:00:00.000' AS DateTime), CAST(N'2016-04-16 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(223.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-13 17:14:09.600' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (15, 6, N'', 33, 22, 0, 0, N'', CAST(N'2016-04-16 00:00:00.000' AS DateTime), CAST(N'2016-04-17 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(223.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-13 17:14:17.327' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (16, 6, N'', 33, 22, 0, 0, N'', CAST(N'2016-05-17 00:00:00.000' AS DateTime), CAST(N'2016-05-18 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(223.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-13 17:14:19.543' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (17, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-19 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:04.810' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (18, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-05-20 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:09.007' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (19, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-05-02 00:00:00.000' AS DateTime), CAST(N'2016-05-21 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:11.657' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (20, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-05-03 00:00:00.000' AS DateTime), CAST(N'2016-05-22 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:13.597' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (21, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-05-23 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:15.557' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (22, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-05-24 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:17.477' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (23, 9, N'', 22, 12, 0, 0, N'', CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-05-25 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(200.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:19.530' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (24, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-05-19 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:52.090' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (25, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-20 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:56.357' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (26, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-05-21 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:09:59.213' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (27, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-05-02 00:00:00.000' AS DateTime), CAST(N'2016-05-22 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:01.020' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (28, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-05-03 00:00:00.000' AS DateTime), CAST(N'2016-05-23 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:03.173' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (29, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-05-04 00:00:00.000' AS DateTime), CAST(N'2016-05-24 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:05.193' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (30, 8, N'', 25, 21, 0, 0, N'', CAST(N'2016-05-05 00:00:00.000' AS DateTime), CAST(N'2016-05-25 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2399.00 AS Decimal(18, 2)), CAST(2299.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:07.800' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (31, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-04-26 00:00:00.000' AS DateTime), CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:37.053' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (32, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:40.753' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (33, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-04-28 00:00:00.000' AS DateTime), CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:42.440' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (34, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-04-29 00:00:00.000' AS DateTime), CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:44.273' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (35, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-04 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:45.817' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (36, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-05-05 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:47.590' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (37, 7, N'', 22, 21, 0, 0, N'', CAST(N'2016-05-02 00:00:00.000' AS DateTime), CAST(N'2016-05-06 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(2222.00 AS Decimal(18, 2)), CAST(1111.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-14 16:10:49.783' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (38, 12, N'', 22, 11, 0, 0, N'', CAST(N'2016-07-13 00:00:00.000' AS DateTime), CAST(N'2016-07-20 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3233.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:29:27.283' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (39, 12, N'', 22, 11, 0, 0, N'', CAST(N'2016-07-14 00:00:00.000' AS DateTime), CAST(N'2016-07-21 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3233.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:29:31.830' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (40, 12, N'', 22, 11, 0, 0, N'', CAST(N'2016-07-15 00:00:00.000' AS DateTime), CAST(N'2016-07-22 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3233.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:29:34.017' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (41, 12, N'', 22, 11, 0, 0, N'', CAST(N'2016-07-16 00:00:00.000' AS DateTime), CAST(N'2016-07-23 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3233.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:29:35.987' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (42, 12, N'', 22, 11, 0, 0, N'', CAST(N'2016-07-17 00:00:00.000' AS DateTime), CAST(N'2016-07-24 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3233.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:29:38.063' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (43, 11, N'', 32, 11, 0, 0, N'', CAST(N'2016-04-24 00:00:00.000' AS DateTime), CAST(N'2016-04-30 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3333.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:30:05.417' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (44, 11, N'', 32, 11, 0, 0, N'', CAST(N'2016-04-25 00:00:00.000' AS DateTime), CAST(N'2016-05-01 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3333.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:30:08.547' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (45, 11, N'', 32, 11, 0, 0, N'', CAST(N'2016-04-26 00:00:00.000' AS DateTime), CAST(N'2016-05-02 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3333.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:30:10.477' AS DateTime), N' ')
INSERT [dbo].[TravelGroup] ([ID], [LineID], [Name], [TotalNum], [RemainNum], [JoinNum], [PromotionNum], [GroupNum], [GoDate], [BackDate], [GatheringTime], [GatheringPlace], [TransferPlace], [GoTravel], [BackTravel], [OuterPrice], [InnerPrice], [Deposit], [GruopLeader], [TravelGuide], [IsDel], [IsPublish], [Remarks], [AddUserName], [AddUserRealName], [AddTime], [ExtraFields]) VALUES (46, 11, N'', 32, 11, 0, 0, N'', CAST(N'2016-04-27 00:00:00.000' AS DateTime), CAST(N'2016-05-03 00:00:00.000' AS DateTime), N'', N'', N'', N'', N'', CAST(3333.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), CAST(2222.00 AS Decimal(18, 2)), N'', N'', 0, 0, N'', N'admin', N'超级管理员', CAST(N'2016-04-16 10:30:12.650' AS DateTime), N' ')
SET IDENTITY_INSERT [dbo].[TravelGroup] OFF
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201512282046317630000000001', N'', N'已完成', 4, 1, CAST(1497.00 AS Decimal(18, 2)), CAST(1497.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, 1, 0, N'', CAST(N'2015-12-28 20:46:31.763' AS DateTime), N'member001', N'12345333', N'王五', N'', N'0002', N'test001', N'测试员工2', N'admin', N'超级管理员', N' ', N'提交订单|等待编辑参团者|等待商家确认|等待支付|已完成')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201512291631193300000000001', N'', N'已取消', 8, 2, CAST(488.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 0, N'', CAST(N'2015-12-29 16:31:19.330' AS DateTime), N'member001', N'12345333', N'马六', N'', N'0002', N'test001', N'测试员工2', N'', N'', N'', N'提交订单|已取消')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201604251629001130000000001', N'', N'已取消', 31, 7, CAST(7777.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 7, 1, 0, N'', CAST(N'2016-04-25 16:29:00.113' AS DateTime), N'member001', N'12345333', N'faaaa', N'', N'0002', N'test001', N'测试员工2', N'admin', N'超级管理员', N' ', N'提交订单|等待编辑参团者|等待商家确认|等待支付|已取消|')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201606031615157970000000001', N'', N'已取消', 38, 12, CAST(6400.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, 1, 0, N'', CAST(N'2016-06-03 16:15:15.797' AS DateTime), N'member001', N'12345333', N'水水', N'', N'0002', N'test001', N'测试员工2', N'admin', N'超级管理员', N' ', N'提交订单|等待商家确认|等待支付|已取消|')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201606031805498550000000001', N'', N'已取消', 38, 12, CAST(3200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 0, N'', CAST(N'2016-06-03 18:05:49.857' AS DateTime), N'member001', N'12345333', N'啊啊', N'', N'0002', N'test001', N'测试员工2', N'', N'', N' ', N'提交订单|已取消|')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201606031809325860000000002', N'', N'已取消', 38, 12, CAST(3200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 0, N'', CAST(N'2016-06-03 18:09:32.587' AS DateTime), N'member001', N'12345333', N'怕', N'', N'0002', N'test001', N'测试员工2', N'', N'', N' ', N'提交订单|已取消|')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201606061021004290000000001', N'', N'已完成', 38, 12, CAST(3200.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 1, 0, N'', CAST(N'2016-06-06 10:21:00.430' AS DateTime), N'member001', N'12345333', N'水水', N'', N'0002', N'test001', N'测试员工2', N'admin', N'超级管理员', N' ', N'提交订单|等待商家确认|等待支付|')
INSERT [dbo].[TravelOrder] ([OrderNum], [OrderType], [OrderStatus], [GroupID], [LineID], [TotalMoney], [MoneyPayed], [MoneyReturn], [BuyNum], [CanChangeNum], [PromotionID], [CompanyRemarks], [AddTime], [AddMemberName], [AddMemberMobile], [AddMemberRealName], [AddMemberRemarks], [InviteNum], [InviterUserName], [InviterRealName], [OperatorUserName], [OperatorRealName], [ExtraFields], [OrderHistory]) VALUES (N'201606150909205590000000001', N'', N'等待商家确认', 42, 12, CAST(5120.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, 1, 1, N'', CAST(N'2016-06-15 09:09:20.560' AS DateTime), N'member001', N'12345333', N'高高的', N'', N'0002', N'test001', N'测试员工2', N'', N'', N' ', N'提交订单|等待商家确认|')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SiteMenu__99C40756E6E334AD]    Script Date: 2017/8/19 18:41:36 ******/
ALTER TABLE [dbo].[SiteMenu] ADD UNIQUE NONCLUSTERED 
(
	[StartTag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SiteUser__3EA603799FC7C5AB]    Script Date: 2017/8/19 18:41:36 ******/
ALTER TABLE [dbo].[SiteUser] ADD UNIQUE NONCLUSTERED 
(
	[InviteNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CostHistory]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[SiteMember] ([UserName])
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD FOREIGN KEY([CatID])
REFERENCES [dbo].[GoodsCat] ([ID])
GO
ALTER TABLE [dbo].[Line]  WITH CHECK ADD  CONSTRAINT [FK__Line__FirstCatID__36B12243] FOREIGN KEY([FirstCatID])
REFERENCES [dbo].[LineCat] ([ID])
GO
ALTER TABLE [dbo].[Line] CHECK CONSTRAINT [FK__Line__FirstCatID__36B12243]
GO
ALTER TABLE [dbo].[Line]  WITH CHECK ADD  CONSTRAINT [FK__Line__SecondCatI__37A5467C] FOREIGN KEY([SecondCatID])
REFERENCES [dbo].[LineCat] ([ID])
GO
ALTER TABLE [dbo].[Line] CHECK CONSTRAINT [FK__Line__SecondCatI__37A5467C]
GO
ALTER TABLE [dbo].[LineDetail]  WITH CHECK ADD  CONSTRAINT [FK__LineDetai__LineI__38996AB5] FOREIGN KEY([LineID])
REFERENCES [dbo].[Line] ([ID])
GO
ALTER TABLE [dbo].[LineDetail] CHECK CONSTRAINT [FK__LineDetai__LineI__38996AB5]
GO
ALTER TABLE [dbo].[MemberFav]  WITH CHECK ADD FOREIGN KEY([UserName])
REFERENCES [dbo].[SiteMember] ([UserName])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[TravelGroup] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([LineID])
REFERENCES [dbo].[Line] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderNum])
REFERENCES [dbo].[TravelOrder] ([OrderNum])
GO
ALTER TABLE [dbo].[PromotionGroup]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[TravelGroup] ([ID])
GO
ALTER TABLE [dbo].[PromotionGroup]  WITH CHECK ADD FOREIGN KEY([LineID])
REFERENCES [dbo].[Line] ([ID])
GO
ALTER TABLE [dbo].[TravelGroup]  WITH CHECK ADD  CONSTRAINT [FK__TravelGro__LineI__3F466844] FOREIGN KEY([LineID])
REFERENCES [dbo].[Line] ([ID])
GO
ALTER TABLE [dbo].[TravelGroup] CHECK CONSTRAINT [FK__TravelGro__LineI__3F466844]
GO
ALTER TABLE [dbo].[TravelOrder]  WITH CHECK ADD FOREIGN KEY([AddMemberName])
REFERENCES [dbo].[SiteMember] ([UserName])
GO
ALTER TABLE [dbo].[TravelOrder]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[TravelGroup] ([ID])
GO
ALTER TABLE [dbo].[TravelOrder]  WITH CHECK ADD FOREIGN KEY([LineID])
REFERENCES [dbo].[Line] ([ID])
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
         Begin Table = "CostHistory"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 237
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "V_Order"
            Begin Extent = 
               Top = 6
               Left = 229
               Bottom = 267
               Right = 423
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
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CostHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_CostHistory'
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
         Begin Table = "CostHistory"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 252
               Right = 196
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "Goods"
            Begin Extent = 
               Top = 6
               Left = 229
               Bottom = 282
               Right = 456
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
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ExchangeHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ExchangeHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
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
         Begin Table = "TravelGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "Line"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 125
               Right = 432
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 32
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Group_Line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Group_Line'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Group_Line'
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
         Begin Table = "TravelOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 231
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "Line"
            Begin Extent = 
               Top = 167
               Left = 79
               Bottom = 286
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Promotion"
            Begin Extent = 
               Top = 150
               Left = 516
               Bottom = 302
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TravelGroup"
            Begin Extent = 
               Top = 14
               Left = 382
               Bottom = 133
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 23
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 38
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2580
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[58] 4[4] 2[15] 3) )"
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
         Begin Table = "PromotionGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 282
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Promotion"
            Begin Extent = 
               Top = 19
               Left = 708
               Bottom = 187
               Right = 922
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Line"
            Begin Extent = 
               Top = 244
               Left = 685
               Bottom = 400
               Right = 863
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "TravelGroup"
            Begin Extent = 
               Top = 263
               Left = 234
               Bottom = 416
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 42
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Promotion_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Table = 2670
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Promotion_Group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Promotion_Group'
GO
