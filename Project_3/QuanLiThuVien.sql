
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddDG](@tendg nvarchar(50), @ngaysinh datetime, @gioitinh nvarchar(3))
as
declare @i int
begin
set @i = (select count(MaDG) from tblDocGia)
if @i <10 begin insert into tblDocGia values ('DG000'+ convert(varchar(5),@i+1), @tendg, @ngaysinh, @gioitinh) end
else if @i <100  begin insert into tblDocGia values ('DG00'+ convert(varchar(6),@i+1), @tendg, @ngaysinh, @gioitinh) end
else if @i <1000 begin insert into tblDocGia values ('DG0'+ convert(varchar(7),@i+1), @tendg ,@ngaysinh, @gioitinh) end
else if @i <10000 begin insert into tblDocGia values ('DG'+ convert(varchar(8),@i+1), @tendg, @ngaysinh, @gioitinh) end
else begin insert into tblDocGia values ('DG'+ convert(varchar(8),@i+1), @tendg, @ngaysinh, @gioitinh) end
end


GO
/****** Object:  StoredProcedure [dbo].[AddDS]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddDS](@tends nvarchar(50), @giaban bigint)
as
declare @i int
begin
set @i = (select Count(MaDS) from tblDauSach)
if @i <10 begin insert into tblDauSach values ('DS000'+ convert(varchar(5),@i+1),@tends,@giaban) end
else if @i <100  begin insert into tblDauSach values ('DS00'+ convert(varchar(6),@i+1),@tends,@giaban) end
else if @i <1000 begin insert into tblDauSach values ('DS0'+ convert(varchar(7),@i+1),@tends,@giaban) end
else if @i <10000 begin insert into tblDauSach values ('DS'+ convert(varchar(8),@i+1),@tends,@giaban) end
else begin insert into tblDauSach values ('DS'+ convert(varchar(8),@i+1),@tends,@giaban) end
end

GO
/****** Object:  StoredProcedure [dbo].[AddMT]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddMT](@madg varchar(10), @mads varchar(10), @ngaytra datetime)
as
declare @i int
begin
set @i = (select count(MaPM) from tblMuonTra)
if @i <10 begin insert into tblMuonTra values ('PM000'+ convert(varchar(5),@i+1), @madg, @mads, convert(varchar(10),getdate(),101), @ngaytra) end
else if @i <100  begin insert into tblMuonTra values ('PM00'+ convert(varchar(6),@i+1), @madg, @mads,convert(varchar(10),getdate(),101), @ngaytra) end
else if @i <1000 begin insert into tblMuonTra values ('PM0'+ convert(varchar(7),@i+1), @madg, @mads, convert(varchar(10),getdate(),101), @ngaytra) end
else if @i <10000 begin insert into tblMuonTra values ('PM'+ convert(varchar(8),@i+1), @madg, @mads, convert(varchar(10),getdate(),101), @ngaytra) end
else begin insert into tblMuonTra values ('PM'+ convert(varchar(8),@i+1), @madg, @mads, convert(varchar(10),getdate(),101), @ngaytra) end
end


GO
/****** Object:  StoredProcedure [dbo].[DelDG]    Script Date: 03/12/2015 7:04:16 CH ******/
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
/****** Object:  StoredProcedure [dbo].[DelDS]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DelDS](@mads varchar(10))
as
begin
delete from tblDauSach where MaDS = @mads
end

GO
/****** Object:  StoredProcedure [dbo].[DelMT]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DelMT](@mapm varchar(10))
as
begin
delete from tblMuonTra where MaPM = @mapm
end


GO
/****** Object:  StoredProcedure [dbo].[FindDG]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FindDG](@str nvarchar(50))
as
begin
select * from tblDocGia where TenDG like '%' + @str + '%' or MaDG like '%' + @str + '%' 
or GioiTinh like '%' + @str + '%' or convert(nvarchar(50),Ngaysinh) like '%' + @str + '%' 
end

GO
/****** Object:  StoredProcedure [dbo].[FindDS]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FindDS](@str nvarchar(50))
as
begin
select * from tblDauSach where TenDS like '%' + @str + '%' or MaDS like '%' + @str +'%'
or convert(nvarchar(50),giaban) like '%' + @str + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[FindMT]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FindMT](@str nvarchar(50))
as
begin
select * from tblMuonTra where MaPM like '%' + @str + '%' or MaDS like '%' + @str +'%'
or MaDG like '%' + @str +'%' or convert(nvarchar(50),ngaymuon) like '%' + @str +'%' or convert(nvarchar(50),ngaytra) like '%' + @str +'%'
end


GO
/****** Object:  StoredProcedure [dbo].[UpdDG]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdDG](@madg varchar(10), @tendg nvarchar(50), @ngaysinh datetime, @gioitinh nvarchar(3))
as
begin
update tblDocGia set TenDG = @tendg, Ngaysinh = @ngaysinh, GioiTinh = @gioitinh where MaDG = @madg
end


GO
/****** Object:  StoredProcedure [dbo].[UpdDS]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdDS](@mads varchar(10), @tends nvarchar(50), @giaban bigint)
as
begin
update tblDauSach set TenDS = @tends, Giaban = @giaban where MaDS = @mads
end


GO
/****** Object:  StoredProcedure [dbo].[UpdMT]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdMT](@mapm varchar(10), @madg varchar(10), @mads varchar(10), @ngaymuon datetime, @ngaytra datetime)
as
begin
update tblMuonTra set MaDG = @madg, MaDS = @mads, NgayMuon = @ngaymuon, NgayTra = @ngaytra where Mapm = @mapm
end


GO
/****** Object:  Table [dbo].[tblDauSach]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDauSach](
	[MaDS] [varchar](10) NOT NULL,
	[TenDS] [nvarchar](50) NOT NULL,
	[GiaBan] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDocGia]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDocGia](
	[MaDG] [varchar](10) NOT NULL,
	[TenDG] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMuonTra]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMuonTra](
	[MaPM] [varchar](10) NOT NULL,
	[MaDG] [varchar](10) NULL,
	[MaDS] [varchar](10) NULL,
	[NgayMuon] [datetime] NULL,
	[NgayTra] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 03/12/2015 7:04:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[Taikhoan] [varchar](30) NOT NULL,
	[Matkhau] [varchar](30) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_DG_MT] FOREIGN KEY([MaDG])
REFERENCES [dbo].[tblDocGia] ([MaDG])
GO
ALTER TABLE [dbo].[tblMuonTra] CHECK CONSTRAINT [FK_DG_MT]
GO
ALTER TABLE [dbo].[tblMuonTra]  WITH CHECK ADD  CONSTRAINT [FK_DS_MT] FOREIGN KEY([MaDS])
REFERENCES [dbo].[tblDauSach] ([MaDS])
GO
ALTER TABLE [dbo].[tblMuonTra] CHECK CONSTRAINT [FK_DS_MT]
GO
ALTER TABLE [dbo].[tblDocGia]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nam' OR [GioiTinh]=N'Nữ'))
GO
