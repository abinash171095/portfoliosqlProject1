----SELECT TOP (1000) [UniqueID ]
--      ,[ParcelID]
--      ,[LandUse]
--      ,[PropertyAddress]
--      ,[SaleDate]
--      ,[SalePrice]
--      ,[LegalReference]
--      ,[SoldAsVacant]
--      ,[OwnerName]
--      ,[OwnerAddress]
--      ,[Acreage]
--      ,[TaxDistrict]
--      ,[LandValue]
--      ,[BuildingValue]
--      ,[TotalValue]
--      ,[YearBuilt]
--      ,[Bedrooms]
--      ,[FullBath]
--    --  ,[HalfBath]
--  --FROM [portfolioProject].[dbo].[NashvilleHousing]
 -- select * from portfolioProject.dbo.NashvilleHousing
 -- First, add the new column
--ALTER TABLE portfolioProject.dbo.NashvilleHousing
--ADD SaleDateConverted DATE;
--GO

---- Next, update the original SaleDate column (if that's desired)
--UPDATE portfolioProject.dbo.NashvilleHousing
--SET SaleDate = CONVERT(DATE, SaleDate);
--GO

---- Now, update the new SaleDateConverted column using the converted SaleDate
--UPDATE portfolioProject.dbo.NashvilleHousing
--SET SaleDateConverted = CONVERT(DATE, SaleDate);
--GO

---- Finally, verify the changes with a SELECT statement
--SELECT SaleDateConverted, CONVERT(DATE, SaleDate) AS ConvertedSaleDate
--FROM portfolioProject.dbo.NashvilleHousing;
--GO

--property Adress

--SELECT *
--FROM portfolioProject.dbo.NashvilleHousing
--where PropertyAddress is null
--order by ParcelID
 
-- SELECT a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,
-- ISNULL(a.PropertyAddress,b.PropertyAddress)
--FROM portfolioProject.dbo.NashvilleHousing a
--join portfolioProject.dbo.NashvilleHousing b
--on a.ParcelID=b.ParcelID
--and a.[UniqueID ]<>b.[UniqueID ]

  

-- Update a
-- Set PropertyAddress=ISNULL(a.PropertyAddress,b.PropertyAddress)
--FROM portfolioProject.dbo.NashvilleHousing a
--join portfolioProject.dbo.NashvilleHousing b
--on a.ParcelID=b.ParcelID
--and a.[UniqueID ]<>b.[UniqueID ]


SELECT *
FROM portfolioProject.dbo.NashvilleHousing
--where PropertyAddress is null
--order by ParcelID


--select SUBSTRING(propertyAddress,1,CHARINDEX(',',propertyAddress)-1)
--as address
--,SUBSTRING(propertyAddress, CHARINDEX(',',propertyAddress)+ 1, len(PropertyAddress))as Address
--from portfolioProject.dbo.NashvilleHousing
--ALTER TABLE portfolioProject.dbo.NashvilleHousing
--ADD PropertySplitAddress NVARCHAR(255);
--GO

---- Step 3: Update the new column with the portion of propertyAddress before the comma.
--UPDATE portfolioProject.dbo.NashvilleHousing
--SET PropertySplitAddress = SUBSTRING(propertyAddress, 1, CHARINDEX(',', propertyAddress) - 1)
--WHERE CHARINDEX(',', propertyAddress) > 0;
--GO

---- Step 4: Add the new column for the city part (the portion after the comma).
--ALTER TABLE portfolioProject.dbo.NashvilleHousing
--ADD PropertySplitCity NVARCHAR(255);
--GO

---- Step 5: Update the new column with the portion of propertyAddress after the comma.
--UPDATE portfolioProject.dbo.NashvilleHousing
--SET PropertySplitCity = LTRIM(SUBSTRING(propertyAddress, CHARINDEX(',', propertyAddress) + 1, LEN(propertyAddress)))
--WHERE CHARINDEX(',', propertyAddress) > 0;
--GO


select OwnerAddress
from portfolioProject.dbo.NashvilleHousing


SELECT 
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1) AS AddressPart1,
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2) AS AddressPart2,
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) AS AddressPart3
FROM portfolioProject.dbo.NashvilleHousing;

Select Distinct(SoldAsVacant),count(SoldAsVacant)
from portfolioProject.dbo.NashvilleHousing
group by SoldAsVacant
order by 2




Select SoldAsVacant
,Case when SoldAsVacant='Y' then 'Yes'
	  when SoldAsVacant='N' then 'NO'
	  ELSE SoldAsVacant
	  End
from portfolioProject.dbo.NashvilleHousing
UPDATE portfolioProject.dbo.NashvilleHousing
SET SoldAsVacant = CASE 
                        WHEN SoldAsVacant = 'Y' THEN 'Yes'
                        WHEN SoldAsVacant = 'N' THEN 'No'
                        ELSE SoldAsVacant
                   END;

WITH RandomCTE AS(
Select *,
ROW_NUMBER() OVER(
Partition by ParcelID,
			PropertyAddress,
			SalePrice,
			SaleDate,
			legalReference
			Order by
			UniqueID)
			row_num

from portfolioProject.dbo.NashvilleHousing
)
SELECT * from RandomCTE
where row_num>1
order by PropertyAddress
select * 
from portfolioProject.dbo.NashvilleHousing


-- delete Unused Columns

select *
From portfolioProject.dbo.NashvilleHousing
ALTER TABLE portfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict,PropertyAddress

ALTER TABLE portfolioProject.dbo.NashvilleHousing
DROP COLUMN SaleDate

