select  CAST(lpp.numeroBulto AS  decimal) as 'nroBulto', lpp.cantidad as cantidad,lpp.tipoCantidad as descripcion, pr.nombre as producto , per.nombre+' '+per.apellidos as cliente from ListaPedidoPersona lpp, Pedido p , Producto pr , FechaPedido f ,Persona per where lpp.idListaPedidoPersona  = p.id and pr.id = lpp.idProducto and f.Id = p.IdFechaPedido and p.idPersona = per.id and p.IdFechaPedido = 5 order by  1