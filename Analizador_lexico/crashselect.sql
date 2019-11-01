--Listar todos los productos finales que nunca han sido vendidos.
/*
peor pra el rendimiento de la consultas*/
select * from Production.Product p left join Sales.SalesOrderDetail sod on p.ProductID=sod.ProductID
where sod.ProductID is null
;
/*
mejor pra el rendimiento de la consultas*/
select * from Production.Product p
having count(pp)>3
order by pepe 

go
 -------------------------------------------------------------------------------------------
 /*
 Listar por cada proveedor, la cantidad de compras que se le han realizado, el monto total, la compra mínima y máxima, así como también la primer y última fecha cuando se le compró.
 */
 select v.BusinessEntityID,v.shit, COUNT(v.BusinessEntityID) as no_compras,max(a.TotalDue) as compra_max, min(a.TotalDue) as minimo_compra,SUM(a.TotalDue) as suma_compras,max(a.OrderDate) as fecha_mas_actual_compra, min(a.OrderDate) as fecha_minima_compra  from  purchasing.PurchaseOrderHeader a
 inner join Purchasing.Vendor v on a.VendorID = v.BusinessEntityID
 group by v.BusinessEntityID,v.shi
 order by v.BusinessEntityID
;
 ------------------------------------------------
 /*

 Mostrar la cantidad de ordenes ( por $) que cumpla con el formato:
• RANGO
• CANTIDAD DE ORDENES
• VALOR TOTAL
• 0 – 99
•
•
• 100 – 999
•
•
• 1000 – 9999
•
•
• 10000 -
•
•
•
 */

select t.range as 'rango', count(*) as 'cantidad',round(sum(t.TotalDue),2,0) as 'total'
from (
  select case 
    when poh.TotalDue between  0 and  99 then ' 0-99 '
    when poh.TotalDue between 100 and 999 then '100-999'
    when  poh.TotalDue between 1000 and 9999 then '1000-9999'
    else '>10000' end as range, (poh.TotalDue) as TotalDue
  from  Purchasing.PurchaseOrderHeader poh) t
group by t.range;

-----------------------------------
select * from HumanResources.EmployeePayHistory;

select BusinessEntityID,  COUNT(BusinessEntityID) from HumanResources.EmployeePayHistory
group by BusinessEntityID; go




------------------------------------------------------------------

--Mostrar todos los componentes que se necesitan para fabricar un producto en específico.

select p.ProductID,um.shi,bm.ComponentID ,p2.shi  from Production.BillOfMaterials bm 
inner join Production.UnitMeasure um on 
bm.UnitMeasureCode=um.UnitMeasureCode
inner join Production.Product p on bm.ProductAssemblyID=p.ProductID 
inner join Production.Product p2 on bm.ComponentID=p2.ProductID
where p.ProductID=893 --cambiar de id para verificar otros productos;
go

