
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_HangHoa](@TenHang nvarchar(50), @GiaHang int, @NgayNhap datetime, @HanSd datetime)
as
declare @i char(10)
begin
set @i = (select count(ID_HangHoa) from HangHoa)
if @i <10 begin insert into HangHoa (ID_HangHoa,TenHang,GiaHang,NgayNhap,Hansd) values ('HH00'+ convert(varchar(4),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
else if @i <100  begin insert into HangHoa (ID_HangHoa,TenHang,GiaHang,NgayNhap,Hansd) values ('HH0'+ convert(varchar(5),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
else if @i <1000 begin insert into HangHoa (ID_HangHoa,TenHang,GiaHang,NgayNhap,Hansd) values ('HH'+ convert(varchar(6),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
--else if @i <10000 begin insert into HangHoa values ('HH'+ convert(varchar(8),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
--else begin insert into HangHoa values ('HH'+ convert(varchar(6),@i+1), @TenHang, @GiaHang, @NgayNhap, @HanSd) end
end


GO
/****** Object:  StoredProcedure [dbo].[Add_HoaDon]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_HoaDon](@id char(10), @ten nvarchar(30), @idkh char(10), @idhh char(10), @idnv char(10))
as
begin
insert into HoaDon values (@id, @ten, @idkh, @idhh, @idnv)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_KhachHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_KhachHang](@id char(10), @ten nvarchar(50), @sdt int, @gioitinh nvarchar(100))
as
begin
insert into KhachHang values (@id, @ten, @sdt, @gioitinh)
end

GO
/****** Object:  StoredProcedure [dbo].[Add_NhanVien]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_NhanVien](@ID_NhanVien char(10),@Hoten nvarchar(50),@QueQuan nvarchar(100),@GT char(3),@CMND int, @NgaySinh datetime)
as
begin
	insert into NhanVien(ID_NhanVien,HoTen,Quequan,GT,CMND,NgaySinh)
	values(@ID_NhanVien,@Hoten,@QueQuan,@GT,@CMND,@NgaySinh)
end


GO
/****** Object:  StoredProcedure [dbo].[BanHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BanHang] (@tenhang nvarchar(50), @soluong int, @ngayban datetime)
as
declare @i int, @id char(10)
begin
set @i = (select count(MaPhieu) from PhieuXuat)
set @id = (select ID_HangHoa from HangHoa where TenHang = @tenhang)
update HangHoa set SoLuong = SoLuong - @soluong where TenHang = @tenhang
insert into PhieuXuat values (convert(varchar(10),@i+1),@id, @soluong, @ngayban)
end


GO
/****** Object:  StoredProcedure [dbo].[DelDG]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[DelDG](@madg varchar(10))
as
begin
delete from tblDocGia where MaDG = @madg
end

GO
/****** Object:  StoredProcedure [dbo].[Delete_HangHoa]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_HangHoa](@ID_HangHoa char(10))
as 
begin
 delete from HangHoa where ID_HangHoa=@ID_HangHoa
 end

GO
/****** Object:  StoredProcedure [dbo].[Delete_HoaDon]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_HoaDon](@ID_HoaDon char(10))
as
begin
delete from HoaDon
where ID_HoaDon= @ID_HoaDon
end

GO
/****** Object:  StoredProcedure [dbo].[Delete_KhachHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_KhachHang](@ID_KhachHang char(10))
as
begin
delete from KhachHang
where ID_KhachHang= @ID_KhachHang
end

GO
/****** Object:  StoredProcedure [dbo].[Delete_NhanVien]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_NhanVien](@ID_NhanVien char(10))
as
begin
	delete from NhanVien
		where ID_NhanVien=@ID_NhanVien	
end			


GO
/****** Object:  StoredProcedure [dbo].[Edit_HangHoa]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Edit_HangHoa](@ID_HangHoa char(10), @TenHang nvarchar(50),@GiaHang int, @NgayNhap datetime, @HanSd datetime)
as  
begin
update HangHoa
set TenHang= @TenHang, GiaHang= @GiaHang, NgayNhap=@NgayNhap,HanSd=@HanSd
where ID_HangHoa= @ID_HangHoa
end

GO
/****** Object:  StoredProcedure [dbo].[Edit_HoaDon]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Edit_HoaDon](@ID_HoaDon char(10),@Ten_HoaDon nvarchar(30),@ID_HangHoa char(10),@ID_NhanVien char(10),@ID_KhachHang char(10))
as
begin
update HoaDon
set ID_HoaDon=@ID_HoaDon,Ten_HoaDon=@Ten_HoaDon,ID_HangHoa=@ID_HangHoa,ID_NhanVien=@ID_NhanVien,ID_KhachHang=@ID_KhachHang
where ID_HoaDon=@ID_HoaDon
end

GO
/****** Object:  StoredProcedure [dbo].[Edit_KhachHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Edit_KhachHang](@ID_KhachHang char(10),@Ten_KhachHang char(20),@SDT_KhachHang int,@GioiTinh_KhachHang char(3))
as
begin
	update KhachHang
	set ID_KhachHang=@ID_KhachHang,Ten_KhachHang=@Ten_KhachHang,SDT_KhachHang=@SDT_KhachHang,GioiTinh_KhachHang=@GioiTinh_KhachHang
	where ID_KhachHang=@ID_KhachHang
end

GO
/****** Object:  StoredProcedure [dbo].[Edit_NhanVien]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Edit_NhanVien](@ID_NhanVien char(10),@HoTen char(50),@QueQuan nvarchar(100),@GT char(3),@CMND int,@NgaySinh datetime)			
as
begin
	update NhanVien
	set ID_NhanVien=@ID_NhanVien,HoTen=@Hoten,Quequan=@QueQuan,GT=@GT,NgaySinh=@Ngaysinh,CMND=@CMND
	where ID_NhanVien=@ID_NhanVien
end

GO
/****** Object:  StoredProcedure [dbo].[LoadHangHoa]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadHangHoa]
as
begin
	select *from HangHoa
end

GO
/****** Object:  StoredProcedure [dbo].[LoadHoaDon]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadHoaDon]
as
begin
select* from HoaDon
end


GO
/****** Object:  StoredProcedure [dbo].[LoadKhachHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadKhachHang]
as
begin
	select *from KhachHang
end


GO
/****** Object:  StoredProcedure [dbo].[LoadNhanVien]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LoadNhanVien]
as 
begin
select * from NhanVien
end

GO
/****** Object:  StoredProcedure [dbo].[LuuLuong]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LuuLuong](@ngaybatdau datetime, @ngayketthuc datetime)
as
begin
select  c.TenHang, Isnull(sum(b.soluong),0) as Nhap, isnull(sum(a.soluong),0) as Xuat, c.SoLuong as ConLai from HangHoa c left join PhieuNhap b on b.id_hanghoa = c.id_hanghoa left join PhieuXuat a on a.id_hanghoa=c.id_hanghoa
where (b.ngaynhap between @ngaybatdau and @ngayketthuc) or (a.ngayban between @ngaybatdau and @ngayketthuc)
group by c.TenHang, c.SoLuong
end

GO
/****** Object:  StoredProcedure [dbo].[NhapHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NhapHang] (@tenhang nvarchar(50), @soluong int, @giaban int, @ngaynhap datetime)
as
declare @i int, @id int, @id1 char(10), @id2 char(10)
begin
set @i = (select count(MaPhieu) from PhieuNhap)
set @id = (select count(ID_HangHoa) from HangHoa where TenHang = @tenhang)
set @id1 = (select count(ID_HangHoa) from HangHoa)
set @id2 = (select Id_HangHoa from HangHoa where TenHang = @tenhang)
if (@id  = 0)
begin
insert into HangHoa values('HH' + convert(varchar(10), @id1+1), @tenhang, @giaban, @soluong)
insert into PhieuNhap values(convert(varchar(10), + @i+1),'HH' + convert(varchar(10), @id1+1), @soluong, @giaban, @ngaynhap)
end
else
begin
update HangHoa set SoLuong = SoLuong + @soluong, GiaHang = @giaban where TenHang = @tenhang
insert into PhieuNhap values(convert(varchar(10), + @i+1), @id2, @soluong, @giaban, @ngaynhap)
end
end
GO
/****** Object:  StoredProcedure [dbo].[timkiemhoadon]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemhoadon](@tim nvarchar(max))
as
begin
select * from HoaDon
where ID_HoaDon like '%'+ @tim+ '%' or Ten_HoaDon like '%'+@tim+'%'
end


GO
/****** Object:  StoredProcedure [dbo].[timkiemkhachhang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemkhachhang](@tim nvarchar(max))
as
begin
	select *from KhachHang
	where Ten_KhachHang like '%'+@tim+ '%' or ID_KhachHang like '%' +@tim+ '%'
end

GO
/****** Object:  StoredProcedure [dbo].[timkiemnhanvien]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkiemnhanvien](@tim nvarchar(max))
as
begin
	select *from NhanVien
	where HoTen like '%'+@tim+ '%' or ID_NhanVien like '%' +@tim+ '%'
end

GO
/****** Object:  StoredProcedure [dbo].[timkienhanghoa]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[timkienhanghoa](@tim nvarchar(max))
as
begin
	select *from HangHoa
	where TenHang like '%' + @tim + '%' or ID_HangHoa like '%' + @tim + '%'
end


GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HangHoa](
	[ID_HangHoa] [char](10) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
	[GiaHang] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [HH_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_HangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID_HoaDon] [char](10) NOT NULL,
	[Ten_HoaDon] [nvarchar](30) NULL,
	[ID_KhachHang] [char](10) NOT NULL,
	[ID_HangHoa] [char](10) NOT NULL,
	[ID_NhanVien] [char](10) NOT NULL,
 CONSTRAINT [HD_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_HoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID_KhachHang] [char](10) NOT NULL,
	[Ten_KhachHang] [nvarchar](50) NULL,
	[SDT_KhachHang] [int] NULL,
	[GioiTinh_KhachHang] [nvarchar](100) NULL,
 CONSTRAINT [KH_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_KhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ID_NhanVien] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Quequan] [nvarchar](100) NULL,
	[GT] [char](3) NULL,
	[CMND] [int] NULL,
	[NgaySinh] [datetime] NULL,
	[Luong] [int] NULL,
 CONSTRAINT [NV_ID_PK] PRIMARY KEY CLUSTERED 
(
	[ID_NhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieu] [varchar](10) NOT NULL,
	[ID_HangHoa] [char](10) NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[NgayNhap] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 03/12/2015 7:05:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MaPhieu] [varchar](10) NOT NULL,
	[ID_HangHoa] [char](10) NULL,
	[SoLuong] [int] NULL,
	[NgayBan] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 03/12/2015 7:05:15 CH ******/
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
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_hanghoa_hoadon] FOREIGN KEY([ID_HangHoa])
REFERENCES [dbo].[HangHoa] ([ID_HangHoa])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_hanghoa_hoadon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_khachhang_hoadon] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[KhachHang] ([ID_KhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_khachhang_hoadon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [fk_nhanvien_hoadon] FOREIGN KEY([ID_NhanVien])
REFERENCES [dbo].[NhanVien] ([ID_NhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [fk_nhanvien_hoadon]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PN_HH] FOREIGN KEY([ID_HangHoa])
REFERENCES [dbo].[HangHoa] ([ID_HangHoa])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PN_HH]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PX_HH] FOREIGN KEY([ID_HangHoa])
REFERENCES [dbo].[HangHoa] ([ID_HangHoa])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PX_HH]
GO
