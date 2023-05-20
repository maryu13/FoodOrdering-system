SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE Cart_Crud
	@Action VARCHAR(10),
	@ProductId INT = NULL,
	@Quantity INT = NULL,
	@UserId INT = NULL

AS

BEGIN
	SET NOCOUNT ON;
	--SELECT
	IF @ACTION='SELECT'
	BEGIN
		SELECT c.ProductId,p.Name,p.ImageUrl,p.Price,c.Quantity,c.Quantity AS Qty,p.Quantity AS PrdQty
		FROM dbo.Carts c
		INNER JOIN dbo.Products p ON p.ProductId=c.ProductId
		WHERE c.UserId=@UserId
	END

	--INSERT
	IF @ACTION='INSERT'
	BEGIN
		INSERT into Carts(ProductId,Quantity,UserId)
		VALUES (@ProductId,@Quantity,@UserId)
		 
	END

	--UPDATE
	IF @ACTION='UPDATE'
	BEGIN
		UPDATE dbo.Carts
		SET Quantity=@Quantity
		WHERE ProductId=@ProductId AND UserId=@UserId
	END

	--DELETE
	IF @ACTION='DELETE'
	BEGIN
		DELETE FROM Carts
		WHERE ProductId=@ProductId AND UserId=@UserId	 
	END

	--GET BY ID (PRODUCT AND USER ID)
	IF @ACTION='GETBYID'
	BEGIN
		SELECT *
		FROM dbo.Carts 
		WHERE ProductId=@ProductId AND  UserId=@UserId
	END

END

