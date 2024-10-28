SELECT TOP (1000) [CustomerID]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[CompanyName]
      ,[SalesPerson]
      ,[EmailAddress]
      ,[Phone]
      ,[PasswordHash]
      ,[PasswordSalt]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorksLT2022].[SalesLT].[Customer]





SET IDENTITY_INSERT [AdventureWorksLT2022].[SalesLT].[Customer] ON;

INSERT INTO [AdventureWorksLT2022].[SalesLT].[Customer]
(
    [CustomerID], 
    [NameStyle], 
    [Title], 
    [FirstName], 
    [MiddleName], 
    [LastName], 
    [Suffix], 
    [PasswordHash], 
    [PasswordSalt], 
    [rowguid], 
    [ModifiedDate]
)
VALUES
(393939, 0, 'Ms.', 'Linda', 'EL', 'Smith', 'Sr.', 'def', '789salt', '5B9E1F45-2AAA-4B19-BD42-345AB67C789E', GETDATE());

SET IDENTITY_INSERT [AdventureWorksLT2022].[SalesLT].[Customer] OFF;




