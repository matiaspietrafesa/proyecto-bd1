use ObligatorioDB;

--Consulta 1
select cli.nombre, count(Co.idCliente) as 'Cantidad de compras'
from Compra Co
join Cliente Cli on Co.idCliente = Cli.idCliente
group by Cli.nombre
having COUNT(Co.idCliente) >= all (select count(co.idCliente) from Compra co group by co.idCliente);

-- Consulta 2
select * from bus b
join viaje v on b.idBus = v.idbus
where b.capacidad > 35 
and b.idBus not in (select v.idbus from viaje v where v.fechaSalida = Dateadd(day,1,GETDATE()));


-- Consulta 3
Select c.*, COUNT(co.idPasaje) as 'Cantidad de viajes comprados' from cliente c 
join compra co on co.idCliente = c.idCliente
GROUP BY c.idCliente, c.nombre, c.apellido1, c.apellido2, c.tipoDocumento, c.nDocumento, 
         c.fechaNacimiento, c.correo, c.contrasena
having count(co.idPasaje) >=5;


-- Consulta 4
select c.idCliente, cli.nombre, CONCAT(cli.apellido1, ' ', cli.apellido2) as 'Apellidos', v.idAsiento, a.numeroDeFila
from Compra c
join Pasaje p on c.idPasaje = p.idPasaje
join Viaje v on v.idViaje = p.idViaje
join Cliente cli on cli.idCliente = c.idCliente
join Asiento a on a.idAsiento = v.idAsiento
where v.idViaje = 255;


-- Consulta 5
SELECT V.idViaje, COUNT(*) AS cantidad_pasajes
FROM Cliente C
JOIN Compra Co ON C.idCliente = Co.idCliente
JOIN Pasaje P ON Co.idPasaje = P.idPasaje
JOIN Viaje V ON P.idViaje = V.idViaje
WHERE C.correo = 'soyturista@gmail.com'
  AND MONTH(P.fechaDeCompra) = 9
  AND YEAR(P.fechaDeCompra) = 2017
GROUP BY V.idViaje
ORDER BY V.idViaje ASC;