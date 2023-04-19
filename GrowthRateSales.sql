--Initial Starting Point: 
--- Found Years, summed total TotalDue for state
--- Need to find growth rate between 2020 vs 2021
--TO DO:
--- Idea would be to create two temporary tables one for 2020 and 2021
--- Inner Join based on states that have over 500,000 in sales

--- 2020 Data (temp Table)
select StateProvince, sum(TotalDue) as TotalDue2020 into #Data2020
from SalesOrderHeader 
left join Address
on SalesOrderHeader.ShipToAddressID = Address.AddressID
where SalesOrderHeader.OrderDate between '2020-01-01' and '2020-12-31'
group by StateProvince, Year(OrderDate)


---2021 Data (temp table)
select StateProvince as State2021, sum(TotalDue) as TotalDue2021 into #Data2021
from SalesOrderHeader 
left join Address
on SalesOrderHeader.ShipToAddressID = Address.AddressID
where SalesOrderHeader.OrderDate between '2021-01-01' and '2021-12-31'
group by StateProvince, Year(OrderDate)


select StateProvince, TotalDue2020, TotalDue2021, ((TotalDue2021 - TotalDue2020)/TotalDue2020)*100 as growthrate
from #Data2020
join #Data2021
on #Data2020.StateProvince = #Data2021.State2021
where TotalDue2020 > 500000 and TotalDue2021 >500000