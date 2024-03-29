USE [master]
GO
/****** Object:  Database [ProjectPRJ321]    Script Date: 3/17/2019 9:16:03 PM ******/
CREATE DATABASE [ProjectPRJ321]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectPRJ321', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjectPRJ321.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectPRJ321_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProjectPRJ321_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProjectPRJ321] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectPRJ321].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectPRJ321] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectPRJ321] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectPRJ321] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectPRJ321] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectPRJ321] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectPRJ321] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectPRJ321] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectPRJ321] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectPRJ321] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectPRJ321] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectPRJ321', N'ON'
GO
ALTER DATABASE [ProjectPRJ321] SET QUERY_STORE = OFF
GO
USE [ProjectPRJ321]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ProjectPRJ321]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/17/2019 9:16:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 3/17/2019 9:16:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Detail]    Script Date: 3/17/2019 9:16:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Detail](
	[BookingID] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[AdultQuantity] [nvarchar](50) NOT NULL,
	[KidQuantity] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Booking_Detail] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour_Category]    Script Date: 3/17/2019 9:16:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_Category](
	[TourID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
	[Transport] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tour_Category] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour_Info]    Script Date: 3/17/2019 9:16:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour_Info](
	[Code] [nvarchar](50) NOT NULL,
	[TourID] [nvarchar](50) NOT NULL,
	[AdultPrice] [float] NOT NULL,
	[KidPrice] [float] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Tour_Info] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'admin', N'123456', N'admin', N'0857664974', N'khangndnse130148@fpt.edu.vn', N'admin', 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'doanhathai', N'123456', N'Doan Ha Thai', N'0857664974', N'hathai1804@gmail.com', N'user', 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'doanhathai123', N'123456', N'ThÃ¡i', N'0857664974', N'hathai1804@gmail.com', N'user', 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'hathaihihi', N'123456', N'Thái Hạ', N'0857664974', N'hathai1804@gmail.com', N'user', 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'khang', N'147258', N'Khang Nguyen', N'0857664974', N'khangndnse130148@fpt.edu.vn', N'user', 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'thai', N'123456', N'Doan Ha Thai', N'0857664974', N'doanhathai@gmail.com', N'user', 1)
INSERT [dbo].[Account] ([Username], [Password], [Fullname], [Phone], [Email], [Role], [Status]) VALUES (N'thaiha', N'123456', N'thaiha', N'0918355979', N'doanhathai@gmail.com', N'user', 1)
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [Username], [Date], [Price]) VALUES (57, N'admin', CAST(N'2019-03-17' AS Date), 45749500)
SET IDENTITY_INSERT [dbo].[Booking] OFF
INSERT [dbo].[Booking_Detail] ([BookingID], [Code], [AdultQuantity], [KidQuantity], [Price], [Status]) VALUES (57, N'SCH084', N'1', N'1', 27982500, N'90% Paid')
INSERT [dbo].[Booking_Detail] ([BookingID], [Code], [AdultQuantity], [KidQuantity], [Price], [Status]) VALUES (57, N'SHN0084', N'1', N'2', 17767000, N'10% Paid')
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'CD123', N'Trải nghiệm tour bằng tàu đi Côn Đảo là tàu hai thân hiện đại nhất hiện nay, với sức chứa 600 khách, khoan rộng,tạo sự thoải mái và tránh say sống cho hành khách. Đến với Côn Đảo (hay với các tên khác như Côn Sơn, Côn Lôn) đã gợi cho người nghe hình ảnh mịt mù của một khu vực xa xôi, mờ mịt, có lúc được ví như địa ngục trần gian nổi tiếng từ thời Pháp thuộc đến giữa năm 1975.   Tham quan Cầu tàu 914, Trại Phú Hải, Chuồng Cọp Pháp - Mỹ, Mũi Cá Mập, Đỉnh Tình Yêu.', N'DU LỊCH CÔN ĐẢO (TÀU CAO TỐC)', N'Bus, Tàu cao tốc', N'Viet Nam Tour', N'images/1552815817575cd.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'CHI123', N'Hành trình độc đáo mang đến những trải nghiệm lý thú, cảm nhận sắc thái đa dạng về lịch sử, văn hóa, con người Trung Hoa. Thưởng ngoạn nhiều danh lam thắng cảnh và di tích nổi tiếng tại Bắc Kinh: Cố Cung - Tử Cấm Thành, Vạn lý Trường thành, Di Hoà Viên… Trải nghiệm tàu hỏa siêu tốc từ thủ đô Bắc Kinh đến thành phố toàn cầu Thượng Hải, khám phá khu Phố Đông, cầu Nam Phố, tháp truyền hình Đông Phương Minh Châu…', N'DU LỊCH TRUNG QUỐC', N'Hàng không Việt Nam (VN)', N'World Tour', N'images/1552829702392chi.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'CPC123', N'Khám phá vương quốc Campuchia vừa gần gũi vừa kỳ bí với thủ đô Phnôm Pênh trên 500 tuổi soi bóng bên dòng Tonle Sap. Chiêm ngưỡng Hoàng cung tráng lệ với kiến trúc mang nét đặc trưng của văn hóa Phật giáo Tiểu Thừa và những ngôi chùa tôn nghiêm. Thán phục sức sáng tạo của dân tộc Khmer trong từng đường nét kiến trúc được kết hợp một cách tuyệt hảo, lưu giữ cho nhân loại một kỳ quan Angkor vĩ đại, tượng thần Bayon 4 mặt... thể hiện dấu ấn huy hoàng của các vương triều Angkor rực rỡ.', N'DU LỊCH CAMPUCHIA', N'BUS', N'World Tour', N'images/1552819406708cam.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'CT123', N'Tham quan nhà xưa Nam bộ hơn trăm năm tuổi, theo lối kiến trúc Pháp - Việt (tùy theo thủy triều). Tham quan chợ nổi Cái Răng - một chợ nổi lớn của vùng Đồng Bằng sông Cửu Long. Viếng Lăng Thoại Ngọc Hầu - danh nhân có công khai mở đất An Giang. Viếng Chùa Hang - ngôi chùa gắn liền với truyền thuyết 2 con rắn lớn biết nghe kinh Phật.Viếng lăng Mạc Cửu - người có công khai trấn đất Hà Tiên vào thế kỷ 18', N'DU LỊCH KHÁM PHÁ CÁI BÈ - CẦN THƠ - CHÂU ĐỐC', N'BUS', N'Viet Nam Tour', N'images/1552814915059ct.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'DL123', N'Tham quan thác Dambri - ngọn thác hùng vĩ tại cao nguyên Bảo Lộc.  Tham quan Khu Du Lịch Trang Trại Rau và Hoa, nằm trải rộng cả một thung lũng với bốn bề là rau và hoa đẹp tuyệt vời. Viếng Linh Ẩn tự, ngôi chùa với tượng Phật Di Lặc lớn nhất tỉnh Lâm Đồng.  Tham quan nhà máy Trà Atiso& Rượu Vang Vĩnh Tiến.', N'DU LỊCH ĐÀ LẠT', N'BUS', N'Viet Nam Tour', N'images/1552814660427dl.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'DN123', N'Tham quan Phố cổ Hội An cổ kính, thơ mộng.  Tham quan động Thiên Đường - một trong những hang động kỳ vĩ và dài nhất thế giới. Tham quan Di sản Văn hóa Thế giới Kinh Thành Huế - Hoàng cung của 13 vị Vua triều Nguyễn với các công trình tiêu biểu', N'DU LỊCH ĐÀ NẴNG – HỘI AN – BÀ NÀ – HUẾ', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552816364008dn.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'DN456', N'Dạo bộ Phố cổ Hội An với các công trình tiêu biểu. Đến Bãi Chồng hoặc Bãi Ông, tắm biển, tắm suối, thư giãn nghỉ ngơi, lặn snorkeling ngắm san hô. Trải nghiệm “Vòng quay Mặt trời - Sun Wheel” thưởng ngoạn cảnh đẹp Đà Nẵng từ độ cao 115m. Vui chơi giải trí tại khu du lịch Bà Nà Hills', N'DU LỊCH ĐÀ NẴNG - HỘI AN - CÙ LAO CHÀM - BÀ NÀ', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552819236733dnha.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'EUR123', N'Tham quan nhiều điểm nổi tiếng “không thể không đến” khi đến châu Âu: tháp Eiffel, du thuyền sông Seine, Nhà Thờ Đức Bà, Bảo tàng Louvre, Khải hoàn môn, đại lộ Champs Elyséem (Pháp); quảng trường LaGrand, tượng Chú Bé Tè Mannequin Pis, Mô hình nguyên tử sắt Atominum (Bỉ); khu đồng quê Zaanse Schans với cối xay gió, xưởng làm pho-mai, guốc gỗ (Hà Lan).  Đặc biệt, tham dự lễ hội hoa xuân đẹp nhất thế giới - Lễ hội hoa Keukenhof 2019 thiên đường của các loại hoa Tulip.', N'DU LICH CHÂU ÂU', N'Hàng không Qatar (QR)', N'World Tour', N'images/1552829917681eu.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'HN123', N'Tham quan dạo quanh, ngắm hồ Hoàn Kiếm, viếng đền Ngọc Sơn. Tham quan Khu du lịch Tràng An - nằm trong quần thể danh thắng được UNESCO công nhận di sản hỗn hợp đầu tiên của Việt Nam và khu vực Đông Nam Á. Đặc biệt, khám phá bối cảnh “Làng thổ dân” trong phim bom tấn Kong. Du ngoạn vịnh Hạ Long - thưởng ngoạn vẻ đẹp kỳ vĩ của hang Ba Hang, các hòn Đỉnh Hương - Trống Mái (Gà Chọi) - Chó Đá. Tham quan động Thiên Cung.', N'DU LỊCH HÀ NỘI - BÁI ĐÍNH - TRÀNG AN - HẠ LONG', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552817937652hn.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'HU456', N'Đắm mình trong không gian cổ kính của Kinh Thành Huế. Thư thả tản bộ tại Phố cổ với các công trình tiêu biểu: Chùa Cầu Nhật Bản, chùa Ông, hội quán Phúc Kiến, khu phố đèn lồng. Dạo bước trên Cầu Vàng tọa lạc tại Vườn Thiên Thai, với thiết kế độc đáo và ấn tượng, đầy mềm mại tựa một dải lụa, được nâng đỡ bởi đôi bàn tay khổng lồ loang lổ rêu phong giữa cảnh sắc nên thơ tuyệt diệu của Bà Nà – Núi Chúa.', N'DU LỊCH TẠI HUẾ - ĐÀ NẴNG- HỘI AN - BÀ NÀ', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552816988295hue.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'MN123', N'Tham quan không gian trưng bày nghệ thuật “Làng chài xưa” với diện tích lên đến 1.600 m2.  Chụp hình lưu niệm tại đồi cát vàng ở Hòn Rơm', N'DU LỊCH PHAN THIẾT - MŨI NÉ IKO', N'Bus', N'Viet Nam Tour', N'images/1552815502871mn.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'NA123', N'Tham quan khu di tích Lam Kinh – được xây dựng từ thế kỷ 15, viếng Lăng vua Lê Thái Tổ - vị Vua đầu tiên của nhà Hậu Lê. Tham quan suối cá thần Cẩm Lương với bao câu chuyện truyền miệng đầy kỳ bí. Đến khu du lịch sinh thái Mường Thanh tại Diễn Châu, tham quan vườn thú safari với rất nhiều loài động vật quý hiếm: tê giác, sư tử, cọp, gấu,... Thăm quê hương của Chủ tịch Hồ Chí Minh. Chụp hình trong không gian xanh mướt, bạt ngàn của đảo chè Thanh Chương', N'DU LỊCH NGHỆ AN - THANH HÓA', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552817478826na.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'NT123', N'Tắm biển Dốc Lết - Một trong những bãi biển êm, đẹp, nổi tiếng của tỉnh Khánh Hòa.Thư giãn và tắm khoáng trung tâm suối khoáng nóng I resort Nha Trang (tự túc chi phí tắm bùn các loại).Viếng Thiền viện Trúc Lâm - nơi ngắm được toàn cảnh hồ Tuyền Lâm. Tham quan Khu Du Lịch Trang Trại Rau và Hoa, với bốn bề rau và hoa đẹp tuyệt vời.', N'DU LỊCH NHA TRANG - ĐÀ LẠT', N'BUS', N'Viet Nam Tour', N'images/1552814251456nt.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'NT456', N'Chiêm ngưỡng Bãi biển cát trắng Cà Ná - một trong những bãi biển đẹp nổi tiếng của miền Trung.Tới khu du lịch Hòn Lao - đảo Khỉ, thư giãn, xem xiếc hoặc thử các môn thể thao bãi biển. Tắm biển Dốc Lết - Một trong những bãi biển êm, đẹp, nổi tiếng của tỉnh Khánh Hòa', N'DU LỊCH NHA TRANG - HÒN LAO - DỐC LẾT', N'BUS', N'Viet Nam Tour', N'images/1552815091251ntdl.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'NT789', N'Chiêm ngưỡng Bãi biển cát trắng Cà Ná - một trong những bãi biển đẹp nổi tiếng của miền Trung. Tới khu du lịch Hòn Lao - đảo Khỉ, thư giãn, xem xiếc hoặc thử các môn thể thao bãi biển. Tắm biển Bãi Nhũ Tiên- Một trong những bãi biển êm, đẹp, nổi tiếng của tỉnh Khánh Hòa', N'DU LỊCH NHA TRANG - HÒN LAO', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552818159875nthl.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'NZL123', N'Tham quan vẻ đẹp khoáng đạt của thiên nhiên khi đến Rotorua - thành phố thoang thoảng mùi lưu huỳnh của bùn khoáng rất tốt cho sức khỏe, ngỡ ngàng trước hang động Waitomo huyền ảo với những tổ đom đóm dày đặc tạo nên cả bầu trời sao lấp lánh.  Điểm tham quan Hobbiton Movie Set - trường quay ngoại cảnh của phim Chúa tể những chiếc nhẫn, The Hobbit nổi tiếng sẽ làm chuyến đi của du khách thêm phần thú vị. Đặc biệt, du khách sẽ được thưởng thức các loại trái cây ngon theo mùa tại xứ sở Kiwi.', N'DU LỊCH NEW ZEALAND - ĐẢO BẮC - ĐẢO NAM', N'Hàng không Singapore(SQ)', N'World Tour', N'images/1552829565716nzl.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'PQ123', N'Du ngoạn trên biển, trải nghiệm cuộc sống của ngư dân, bơi lội giữa biển và ngắm san hô. Tắm biển Bãi Sao (hoặc bãi Ông Lang) - một trong những bãi biển đẹp nhất tại Phú Quốc', N'DU LỊCH TẠI PHÚ QUỐC - CÂU CÁ - NGẮM SAN HÔ', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552816629389pq.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'QN123', N'Dưới bàn tay tài hoa của đội ngũ tình nguyện viên Hàn Quốc, những bức tường cũ kĩ của hơn 100 ngôi nhà trong làng chài đã trở thành các tác phẩm hội họa đặc sắc, khắc họa phong cảnh thiên nhiên - biển cả, đời sống sinh hoạt, văn hóa của người dân làng chài, cùng nhiều bức chân dung sống động như thật và các nhân vật hoạt hình vui nhộn tại Tham quan Làng bích họa Tam Thanh. Tham quan Đào Lý Sơn với hàng loạt những cảnh quan thú vi: Cổng Tò Vò, hang Cau, hang Sau,..', N'QUẢNG NGÃI - LÝ SƠN - HỘI AN - ĐÀ NẴNG - BÀ NÀ', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552819060977qn.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'SIN123', N'Thưởng lãm những thắng cảnh nổi tiếng của cả 2 quốc gia: Malaysia - Singapore với mức giá tiết kiệm, chất lượng tiêu chuẩn Saigontourist.  Thăm thành phố cổ Malacca và thành phố trên mây Genting (Malaysia). Khám phá vườn năng lượng với các “siêu cây” . Đặc biệt thưởng thức chương trình biểu diễn nhạc nước hết sức độc đáo “Wings Of Time” với các tia nước nhảy múa trên nền nhạc cổ điển kết hợp hiện đại…', N'DU LỊCH MALAYSIA - SINGAPORE', N'Hàng không Việt Nam (VN)', N'World Tour', N'images/1552829014305sin.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'SP123', N'Viếng chùa Bái Đính - ngôi chùa của những kỷ lục. Tham quan KDL Tràng An - với hệ thống sông, suối, các hang xuyên thủy động và các dãy núi đá vôi trùng điệp. Viếng chùa Trấn Quốc - danh lam cổ tự được xây dựng từ thế kỷ VI. Du ngoạn vịnh Hạ Long - một trong 7 kỳ quan thiên nhiên mới của thế giới', N'DU LỊCH HÀ NỘI - SAPA- NINH BÌNH - HẠ LONG', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552818508528sp.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'SP456', N'Tham quan chụp hình tại đồi chè Mộc Châu. Ghé thăm cụm di tích lịch sử Điện Biên Phủ với một trang sử đầy hào hùng của dân tộc. Tham quan động Pu Sam Cáp hoang sơ và hùng vĩ của núi rừng phía Bắc.', N'DU LỊCH SƠN LA - ĐIỆN BIÊN - SA PA - LÀO CAI', N'Hàng không Vietjet', N'Viet Nam Tour', N'images/1552818723898sl.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'TAI123', N'Khám phá mãnh hổ kinh tế của châu Á với nhiều dấu ấn lịch sử, pha trộn hài hòa giữa văn hóa hiện đại và truyền thống. Ngắm vẻ đẹp thiên nhiên tuyệt vời của hồ Nhật Nguyệt giữa núi rừng hùng vĩ, chiêm ngưỡng những bảo vật vô giá tại Viện bảo tàng Cố Cung… Tham gia hoạt động thả đèn trời, viếng các đền chùa linh thiêng cầu may mắn, bình an cho gia đình. Thỏa sức mua sắm và thưởng thức những món ăn địa phương nức tiếng tại những khu chợ đêm sầm uất.', N'DU LỊCH ĐÀI LOAN', N'Hàng không Việt Nam (VN)', N'Viet Nam Tour', N'images/1552829395437tai.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'THA123', N'Một hành trình có thể đi đến 3 nước trong khu vực Đông Dương. Tham quan thác Khone Phapheng được nhiều người biết đến như một Niagara của Lào.  Ghé thăm Điện thờ Hoàng Gia tại Đông Bắc Thái Lan.', N'DU LỊCH LÀO - CAMPUCHIA - THÁI LAN', N'BUS', N'World Tour', N'images/1552828781716lao.jpg', 1)
INSERT [dbo].[Tour_Category] ([TourID], [Description], [Place], [Transport], [Type], [Image], [Status]) VALUES (N'THA456', N'Thăm xứ sở nụ cười Thái Lan với Hoàng Cung, chùa Phật Ngọc Lục Bảo, chùa Vàng thiêng liêng với tượng Phật vàng 5,5 tấn. Ngồi xe chuyên dụng ngắm nhìn cuộc sống của các động vật hoang dã của Sở thú thiên nhiên, thú vị với các tiết mục biểu diễn cá heo, chim vẹt...tại Công viên hải dương.  Tận kiến màn trình diễn kỹ xảo 3D - Kaan Show hiện đại độc đáo kết hợp cùng âm nhạc và nhảy múa …', N'DU LỊCH THÁI LAN', N'Hàng không Việt Nam (VN)', N'World Tour', N'images/1552829237301tha.jpg', 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SCD0084', N'CD123', 5399000, 3139000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-29' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SCH084', N'CHI123', 15990000, 11992500, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SCM084', N'CPC123', 4339000, 3255000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SCT0084', N'CT123', 3339000, 1670000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SDL084', N'DL123', 3179000, 1590000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SDL085', N'DL123', 3179000, 1590000, CAST(N'2019-04-01' AS Date), CAST(N'2019-04-05' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SDN0084', N'DN123', 7079000, 4739000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-31' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SDN0085', N'DN456', 5279000, 3839000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-28' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SEU084', N'EUR123', 56990000, 45592000, CAST(N'2019-03-25' AS Date), CAST(N'2019-05-01' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SHN0084', N'HN123', 7429000, 5169000, CAST(N'2019-03-27' AS Date), CAST(N'2019-03-31' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SHU0084', N'HU456', 5279000, 3639000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-29' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SMN0084', N'MN123', 2179000, 1089500, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-29' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SMN0085', N'MN123', 2179000, 1089500, CAST(N'2019-03-28' AS Date), CAST(N'2019-03-31' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SNA084', N'NA123', 7579000, 5304000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SNT0084', N'NT456', 3739000, 1870000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-29' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SNT0085', N'NT456', 3739000, 1870000, CAST(N'2019-03-27' AS Date), CAST(N'2019-04-01' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SNT0086', N'NT789', 4739000, 2370000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-29' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SNZ084', N'NZL123', 80990000, 60742500, CAST(N'2019-03-25' AS Date), CAST(N'2019-04-03' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SPQ0084', N'PQ123', 4179000, 2929000, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-29' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SQN084', N'QN123', 6579000, 4279000, CAST(N'2019-03-24' AS Date), CAST(N'2019-03-28' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SSI084', N'SIN123', 15990000, 11992500, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-31' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SSP084', N'SP123', 9679000, 6364000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-31' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'SSP085', N'SP456', 8779000, 5914000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'STA084', N'TAI123', 14990000, 11242500, CAST(N'2019-03-26' AS Date), CAST(N'2019-03-31' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'STH084', N'THA123', 8879000, 6660000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'STH085', N'THA456', 10499000, 9449100, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'STN084', N'NT123', 4379000, 2190000, CAST(N'2019-03-25' AS Date), CAST(N'2019-03-30' AS Date), 50, 1)
INSERT [dbo].[Tour_Info] ([Code], [TourID], [AdultPrice], [KidPrice], [StartDate], [EndDate], [Quantity], [Status]) VALUES (N'STN085', N'NT123', 4379000, 2190000, CAST(N'2019-03-27' AS Date), CAST(N'2019-04-02' AS Date), 50, 1)
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Account]
GO
ALTER TABLE [dbo].[Booking_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Detail_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Booking_Detail] CHECK CONSTRAINT [FK_Booking_Detail_Booking]
GO
ALTER TABLE [dbo].[Booking_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Detail_Tour_Info] FOREIGN KEY([Code])
REFERENCES [dbo].[Tour_Info] ([Code])
GO
ALTER TABLE [dbo].[Booking_Detail] CHECK CONSTRAINT [FK_Booking_Detail_Tour_Info]
GO
ALTER TABLE [dbo].[Tour_Info]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Info_Tour_Category] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour_Category] ([TourID])
GO
ALTER TABLE [dbo].[Tour_Info] CHECK CONSTRAINT [FK_Tour_Info_Tour_Category]
GO
USE [master]
GO
ALTER DATABASE [ProjectPRJ321] SET  READ_WRITE 
GO
