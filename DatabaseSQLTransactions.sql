
BEGIN TRY 
	BEGIN TRANSACTION
		UPDATE dbo.Cars Set Price_per_day = 250 WHERE ID=5
		UPDATE dbo.Users Set City = 'Constanta' WHERE ID = 5
		UPDATE dbo.CarsUsers SET PaymentType = 'Cash' WHERE ID =5
		DELETE FROM dbo.CarsUsers WHERE CarId = 1
		DELETE FROM dbo.Cars Where Model = 'M4'

	COMMIT TRANSACTION

END TRY

BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErorrMessage
	ROLLBACK TRANSACTION
END CATCH



