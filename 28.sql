--Print the traingle
set @n=21;
select repeat('* ',@n:=@n-1) from information_schema.tables;
