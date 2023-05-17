set @total = 0;
call northwind.StockCategoria(1, @total);
select @total;
