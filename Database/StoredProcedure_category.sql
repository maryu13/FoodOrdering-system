
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE Category_Crud
	-- Add the parameters for the stored procedure here
	@Action varchar (20),
	@CategoryID int=null,
	@Name varchar (100)= null,
	@IsActive bit =false,
	@ImageUrl varchar(max)=null

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--select
	if @Action = 'SELECT'
		begin 
			select * from dbo.Categories order by CreatedDate DESC
		end

	if @Action = 'ACTIVECAT'
		begin 
			select * from dbo.Categories WHERE IsActive=1
		end

	--insert
	if @Action = 'INSERT'
		begin 
			insert into dbo.Categories(Name,IsActive,CreatedDate,ImageUrl)
			values(@Name,@IsActive,GETDATE(),@ImageUrl)
		end

	--update
	if @Action = 'UPDATE'
		begin 
			declare @UPDATE_IMAGE varchar (20)
			SELECT @UPDATE_IMAGE=(CASE WHEN @ImageUrl is null then 'no' else 'yes' end)
			if @UPDATE_IMAGE='no'
				begin
					update dbo.Categories
					set Name=@Name,IsActive=@IsActive
					where CategoryId=@CategoryID
				end
			else
				begin
					update dbo.Categories
					set Name=@Name,ImageUrl=@ImageUrl,IsActive=@IsActive
					where CategoryId=@CategoryID
				end
		end
	--delete

	if @Action = 'DELETE'
		begin 
			delete from dbo.Categories where CategoryId=@CategoryID
		end

	--GETBYID

	if @Action = 'GETBYID'
		begin 
			select * from dbo.Categories where CategoryId=@CategoryID
		end
END
GO
