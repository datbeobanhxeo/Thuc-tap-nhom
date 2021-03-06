
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LoadHangHoa]
as
begin
	select *from tblHangHoa
end

GO
/****** Object:  StoredProcedure [dbo].[NhapMoi]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NhapMoi](@MaHH nvarchar(50),@TenHH nvarchar(50), @MaNCC varchar(10), @Soluong int)
as
declare @i int
begin
	set @i =(select Count(MaHH) from tblHangHoa)
	if @i <10 insert into tblHangHoa values ('HH000'+convert(varchar(5),@i+1),@TenHH, @mancc,@soluong)
	else if @i<100 and @i>=10 insert into tblHangHoa values ('HH00'+convert(varchar(6),@i+1),@TenHH, @mancc,@soluong)
	else if @i<1000 and @i >=100 insert into tblHangHoa values ('HH0'+convert(varchar(7),@i+1),@TenHH, @mancc,@soluong)
	else if @i<10000 and @i >=1000 insert into tblHangHoa values ('HH'+convert(varchar(8),@i+1),@TenHH, @mancc,@soluong)
end

GO
/****** Object:  StoredProcedure [dbo].[NhapThem]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NhapThem] (@MaHH nvarchar(50),@TenHH nvarchar(50), @MaNCC varchar(10), @Soluong int)
as
begin
update tblHangHoa set SoLuong = SoLuong + @soluong where MaHH = @mahh
end



GO
/****** Object:  StoredProcedure [dbo].[ThongKeNhap]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThongKeNhap]
as
begin
		SELECT        dbo.tblHangHoa.TenHH, dbo.tblPhieuNhap.SoLuong, dbo.tblPhieuNhap.NgayNhap
		FROM dbo.tblHangHoa INNER JOIN
                         dbo.tblPhieuNhap ON dbo.tblHangHoa.MaHH = dbo.tblPhieuNhap.MaHH
end

GO
/****** Object:  StoredProcedure [dbo].[ThongKeXuat]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThongKeXuat]
as 
begin
	SELECT        dbo.tblHangHoa.TenHH, dbo.tblPhieuXuat.NgayXuat, dbo.tblPhieuXuat.SoLuong
	FROM            dbo.tblHangHoa INNER JOIN
                         dbo.tblPhieuXuat ON dbo.tblHangHoa.MaHH = dbo.tblPhieuXuat.MaHH
end

GO
/****** Object:  StoredProcedure [dbo].[TimMaHH]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimMaHH] (@MaHH varchar(10))
as
begin
	select * from tblHangHoa where MaHH=@MaHH
end



GO
/****** Object:  StoredProcedure [dbo].[TimMaNCC]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimMaNCC] (@MaNCC varchar(10))
as
begin
	select * from tblHangHoa where MaNCC=@MaNCC
end

GO
/****** Object:  StoredProcedure [dbo].[TimSL]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimSL] (@SoLuong int)
as
begin
	select * from tblHangHoa where SoLuong=@SoLuong
end



GO
/****** Object:  StoredProcedure [dbo].[TimTenHH]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimTenHH] (@TenHH nvarchar(50))
as
begin
	select * from tblHangHoa where TenHH=@TenHH
end



GO
/****** Object:  StoredProcedure [dbo].[XuatHang]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XuatHang](@MaHH varchar(10), @TenHH nvarchar(50), @MaNCC varchar(10), @SoLuong int)
as
begin
update tblHangHoa set SoLuong = SoLuong - @soluong where MaHH = @mahh
end


GO
/****** Object:  Table [dbo].[tblHangHoa]    Script Date: 03/12/2015 2:08:08 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHangHoa](
	[MaHH] [varchar](10) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[MaNCC] [varchar](10) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 03/12/2015 2:08:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[MaNCC] [varchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPhieuNhap]    Script Date: 03/12/2015 2:08:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPhieuNhap](
	[MaPN] [varchar](10) NOT NULL,
	[MaHH] [varchar](10) NULL,
	[NgayNhap] [datetime] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPhieuXuat]    Script Date: 03/12/2015 2:08:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPhieuXuat](
	[MaPX] [varchar](10) NOT NULL,
	[MaHH] [varchar](10) NULL,
	[NgayXuat] [datetime] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 03/12/2015 2:08:09 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0001', N'Hàng hóa 01', N'NCC0001', 100)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH00010', N'dao', N'NCC0001', 50)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0002', N'Hàng hóa 02', N'NCC0003', 350)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0003', N'Hàng hóa 03', N'NCC0002', 200)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0004', N'Hàng hóa 04', N'NCC0003', 500)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0005', N'Hàng hóa 05', N'NCC0001', 100)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0006', N'Hàng hóa 06', N'NCC0002', 200)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0007', N'Hàng hóa 07', N'NCC0002', 150)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0008', N'Hàng hóa 08', N'NCC0003', 400)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0009', N'sdfadfasd', N'NCC0001', 32000)
INSERT [dbo].[tblHangHoa] ([MaHH], [TenHH], [MaNCC], [SoLuong]) VALUES (N'HH0011', N'adfadfadf', N'NCC0002', 300)
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC0001', N'Hoàng Hà')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC0002', N'Thăng Long')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC0003', N'Hải Tiến')
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0001', N'HH0001', CAST(0x0000A42100000000 AS DateTime), 200)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0002', N'HH0003', CAST(0x0000A42100000000 AS DateTime), 150)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0003', N'HH0002', CAST(0x0000A43000000000 AS DateTime), 100)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0004', N'HH0005', CAST(0x0000A43B00000000 AS DateTime), 250)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0005', N'HH0007', CAST(0x0000A44900000000 AS DateTime), 150)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0006', N'HH0004', CAST(0x0000A45800000000 AS DateTime), 100)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0007', N'HH0003', CAST(0x0000A48000000000 AS DateTime), 200)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0008', N'HH0006', CAST(0x0000A48B00000000 AS DateTime), 250)
INSERT [dbo].[tblPhieuNhap] ([MaPN], [MaHH], [NgayNhap], [SoLuong]) VALUES (N'PN0009', N'HH0008', CAST(0x0000A49C00000000 AS DateTime), 100)
INSERT [dbo].[tblPhieuXuat] ([MaPX], [MaHH], [NgayXuat], [SoLuong]) VALUES (N'PX0001', N'HH0003', CAST(0x0000A43600000000 AS DateTime), 100)
INSERT [dbo].[tblPhieuXuat] ([MaPX], [MaHH], [NgayXuat], [SoLuong]) VALUES (N'PX0002', N'HH0001', CAST(0x0000A45C00000000 AS DateTime), 150)
INSERT [dbo].[tblPhieuXuat] ([MaPX], [MaHH], [NgayXuat], [SoLuong]) VALUES (N'PX0003', N'HH0002', CAST(0x0000A46700000000 AS DateTime), 100)
INSERT [dbo].[tblPhieuXuat] ([MaPX], [MaHH], [NgayXuat], [SoLuong]) VALUES (N'PX0004', N'HH0005', CAST(0x0000A47800000000 AS DateTime), 200)
INSERT [dbo].[tblPhieuXuat] ([MaPX], [MaHH], [NgayXuat], [SoLuong]) VALUES (N'PX0005', N'HH0007', CAST(0x0000A48F00000000 AS DateTime), 150)
INSERT [dbo].[tblPhieuXuat] ([MaPX], [MaHH], [NgayXuat], [SoLuong]) VALUES (N'PX0006', N'HH0008', CAST(0x0000A4AA00000000 AS DateTime), 250)
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'nguyenanhdung', N'nguyenanhdung')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'hoangdinhdat', N'hoangdinhdat')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'phixuandao', N'phixuandao')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'phamdinhminh', N'phamdinhminh')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'levanvu', N'levanvu')
INSERT [dbo].[tblUser] ([TaiKhoan], [MatKhau]) VALUES (N'luongvanluan', N'luongvanluan')
ALTER TABLE [dbo].[tblHangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HH_NCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tblNhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHangHoa] CHECK CONSTRAINT [FK_HH_NCC]
GO
ALTER TABLE [dbo].[tblPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PN_HH] FOREIGN KEY([MaHH])
REFERENCES [dbo].[tblHangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPhieuNhap] CHECK CONSTRAINT [FK_PN_HH]
GO
ALTER TABLE [dbo].[tblPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PX_HH] FOREIGN KEY([MaHH])
REFERENCES [dbo].[tblHangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPhieuXuat] CHECK CONSTRAINT [FK_PX_HH]
GO
