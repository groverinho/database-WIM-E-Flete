 select t1.bultos, t1.nombres,  t2.suma
 from (select base.nombres, sum (cant) as bultos
 from
  (select distinct count(*) as cant, replace(replace(replace(lpp.numeroBulto,'.1',''),'.2',''),'.3','') as bultos,  per.nombre +' '+ per.apellidos as nombres
 from ListaPedidoPersona lpp , Pedido p, FechaPedido f, Persona per
 where lpp.idListaPedidoPersona = p.id and f.Id = p.IdFechaPedido and per.id = p.idPersona
 and p.IdFechaPedido=4
  group by per.nombre, per.apellidos,lpp.numeroBulto
  ) as base
  group by base.nombres
) as t1
inner join 
 (
  select  per.nombre + ' '+ per.apellidos as nombres, sum(lpp.precioCantidad) as suma
 from ListaPedidoPersona lpp, Pedido p ,  FechaPedido f ,Persona per
 where lpp.idListaPedidoPersona  = p.id  and f.Id = p.IdFechaPedido and p.idPersona = per.id and p.IdFechaPedido =4
 group by per.nombre, per.apellidos
 ) as t2
 on t1.nombres = t2.nombres