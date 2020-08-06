/* 
	Exercicis dins l'apartat 1.1.3 
    ==============================
    
    Alumno: Angel Calzada
*/

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;

-- 3. Lista todas las columnas de la tabla producto.
select * from producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, CONCAT(format(precio, 2), ' €') AS 'Precio (€)', CONCAT('$ ', format(precio*1.17,2)) AS 'Precio ($)' from producto;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre, CONCAT(format(precio, 2), ' €') AS 'euros', CONCAT('$ ', format(precio*1.17,2)) AS 'dólares' from producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select UPPER(nombre), precio from producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select LOWER(nombre), precio from producto;

-- 8.Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, LEFT(nombre, 2) from fabricante;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, precio from producto ORDER BY precio;

-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, format(precio,0) from producto;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
select fabricante.codigo from fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
select DISTINCT fabricante.codigo from fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante ORDER BY nombre;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre from producto ORDER BY nombre, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante LIMIT 2 OFFSET 3;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto ORDER BY precio LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto ORDER BY precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
select nombre from producto WHERE codigo_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto WHERE precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre from producto WHERE precio >= 400;

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
select nombre from producto WHERE NOT precio >= 400;

-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from producto WHERE precio >= 80 AND precio <= 300;

-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select * from producto WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
select * from producto WHERE precio > 200 AND codigo_fabricante = 6;

-- 27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from producto WHERE codigo_fabricante IN (1, 3, 5);

-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio*100 AS 'céntimos' from producto;

-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante WHERE nombre LIKE 'S%';

-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante WHERE nombre LIKE '%e';

-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante WHERE nombre LIKE '%w%';

-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante WHERE LENGTH(nombre) = 4;

-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from producto WHERE nombre LIKE '%Portátil%';

-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio from producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;


/* 
	Exercicis dins l'apartat 1.1.4 --> "Consultas multitabla (Composición interna)"
    ===============================================================================
*/

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select producto.nombre, producto.precio, fabricante.nombre from producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select producto.nombre, producto.precio, fabricante.nombre from producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre;

-- 3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
select producto.nombre, producto.precio, fabricante.nombre from producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro. 
select producto.nombre, producto.precio, fabricante.nombre from producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
select producto.* from producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante Where fabricante.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
select producto.* from producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante Where fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
select producto.* from producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante Where fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select producto.* from producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante Where fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select producto.nombre, producto.precio from producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
select producto.nombre, producto.precio from producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';


-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select producto.nombre, producto.precio, fabricante.nombre from producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

-- 13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select fabricante.nombre, fabricante.codigo from fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
select fabricante.nombre, fabricante.codigo from fabricante where EXISTS (select producto.nombre from producto where producto.codigo_fabricante = fabricante.codigo);


/* 
	Exercicis dins l'apartat 1.1.5 --> "Consultas multitabla (Composición externa)"
    ===============================================================================
*/
-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
select fabricante.nombre, producto.nombre from fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select fabricante.nombre from fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;

-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- No. Por que el campo 'codigo_fabricante' es NOT NULL.

/* 
	Exercicis dins l'apartat 1.1.6 --> "Consultas resumen"
    ===============================================================================
*/

-- 1. Calcula el número total de productos que hay en la tabla productos.
select COUNT(nombre) from producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante.
select COUNT(nombre) from fabricante;

-- 3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
select COUNT(DISTINCT(codigo_fabricante)) from producto;

-- 4. Calcula la media del precio de todos los productos.
select AVG(precio) from producto;

-- 5. Calcula el precio más barato de todos los productos.
select MIN(precio) from producto;

-- 6. Calcula el precio más caro de todos los productos.
select MAX(precio) from producto;

-- 7. Lista el nombre y el precio del producto más barato.
select nombre, precio from producto WHERE precio = (select MIN(precio) from producto);

-- 8. Lista el nombre y el precio del producto más caro.
select nombre, precio from producto WHERE precio = (select MAX(precio) from producto);

-- 9. Calcula la suma de los precios de todos los productos.
select SUM(precio) from producto;

-- 10. Calcula el número de productos que tiene el fabricante Asus.
select COUNT(nombre) from producto Where codigo_fabricante = (select codigo from fabricante where nombre LIKE 'Asus');

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
select AVG(precio) from producto Where codigo_fabricante = (select codigo from fabricante where nombre LIKE 'Asus');

-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
select MIN(precio) from producto Where codigo_fabricante = (select codigo from fabricante where nombre LIKE 'Asus');

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
select MAX(precio) from producto Where codigo_fabricante = (select codigo from fabricante where nombre LIKE 'Asus');

-- 14. Calcula la suma de todos los productos del fabricante Asus.
select SUM(precio) from producto Where codigo_fabricante = (select codigo from fabricante where nombre LIKE 'Asus');

-- 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
select MAX(precio), MIN(precio), AVG(precio), COUNT(nombre) from producto Where codigo_fabricante = (select codigo from fabricante where nombre LIKE 'Crucial');

-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
select fabricante.nombre, COUNT(*) from fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre ORDER BY COUNT(*) DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
select fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio) from producto RIGHT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre;

-- 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
select producto.codigo_fabricante, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio), COUNT(*) from producto  WHERE producto.precio > 200 GROUP BY producto.codigo_fabricante;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
select fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio), COUNT(*) from producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio > 200 GROUP BY fabricante.nombre;

-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
select count(*) from producto where precio >= 180;

-- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
select fabricante.nombre, count(*) from producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 GROUP BY producto.codigo_fabricante;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
select codigo_fabricante, AVG(precio) from producto GROUP BY codigo_fabricante;

-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
select fabricante.nombre, AVG(producto.precio) from fabricante, producto WHERE producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre;

-- 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
select fabricante.nombre, AVG(producto.precio) from producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.nombre HAVING AVG(producto.precio) >= 150;


-- 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
select fabricante.nombre, COUNT(*) from fabricante INNER JOIN producto ON producto.codigo_Fabricante = fabricante.codigo GROUP BY fabricante.codigo HAVING COUNT(*) >= 2;

-- 26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
select fabricante.nombre, COUNT(*) from fabricante INNEr JOIN producto ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 220 GROUP BY fabricante.codigo;

-- 27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
select fabricante.nombre, COUNT(CASE WHEN producto.precio >= 220 THEN 1 END) from fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.nombre;

-- 28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
select fabricante.nombre, codigo_fabricante, SUM(precio) from producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo GROUP BY codigo_fabricante HAVING SUM(precio) > 1000;

-- 29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
select producto.nombre, producto.precio, fabricante.nombre from producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo where producto.precio IN (select MAX(producto.precio) from producto GROUP BY producto.codigo_fabricante);


/* 
	Exercicis dins l'apartat 1.1.7 --> "Subconsultas (En la cláusula WHERE)"
    ===============================================================================
*/

/*
 1.1.7.1 Con operadores básicos de comparación
 ---------------------------------------------
*/

-- 1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
select producto.nombre from producto where producto.codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo');

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
select * from producto where precio = (select MAX(producto.precio) from producto where producto.codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));

-- 3. Lista el nombre del producto más caro del fabricante Lenovo.
select codigo into @codigoLenovo from fabricante where nombre = 'Lenovo';
select MAX(producto.precio) into @maxPrecio from producto where producto.codigo_fabricante = @codigoLenovo;
select nombre from producto where precio = @maxPrecio AND codigo_fabricante = @codigoLenovo;

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
select codigo into @codigoHP from fabricante where nombre = 'Hewlett-Packard';
select MIN(producto.precio) into @minPrecio from producto where producto.codigo_fabricante = @codigoHP;
select nombre from producto where precio = @minPrecio AND codigo_fabricante = @codigoHP;

-- 5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
select * from producto where precio >= (select MAX(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
select * from producto where precio >= (select AVG(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre ='Asus')) AND codigo_fabricante = (select codigo from fabricante where nombre ='Asus');

/*
 1.1.7.2 Subconsultas con ALL y ANY
 ---------------------------------------------
*/

-- 8. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
select * from producto where precio >= ALL(select precio from producto);

-- 9. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
select * from producto where precio <= ALL(select precio from producto);

-- 10. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
select nombre from fabricante where codigo =any(select codigo_fabricante from producto);

-- 11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
select nombre from fabricante where codigo !=all(select codigo_fabricante from producto);

/*
 1.1.7.3 Subconsultas con IN y NOT IN
 ---------------------------------------------
*/

-- 12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante where codigo IN (select codigo_fabricante from producto);

-- 13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
select nombre from fabricante where codigo NOT IN (select codigo_fabricante from producto);


/*
 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
 ---------------------------------------------
*/

-- 14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante where EXISTS (select codigo_fabricante from producto where producto.codigo_fabricante = fabricante.codigo);

-- 15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
select nombre from fabricante where NOT EXISTS (select codigo_fabricante from producto where producto.codigo_fabricante = fabricante.codigo);

/*
 1.1.7.5 Subconsultas correlacionadas
 ---------------------------------------------
*/

-- 16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
select producto.nombre, producto.precio, fabricante.nombre from producto, fabricante where producto.codigo_fabricante = fabricante.codigo AND producto.precio = (select MAX(producto.precio) from producto where producto.codigo_fabricante = fabricante.codigo);


-- 17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
select fabricante.nombre, producto.nombre, producto.precio from producto, fabricante where producto.codigo_fabricante = fabricante.codigo AND producto.precio >= (select AVG(producto.precio) from producto where producto.codigo_fabricante = fabricante.codigo GROUP BY producto.codigo_fabricante);

-- 18. Lista el nombre del producto más caro del fabricante Lenovo.
select producto.nombre from producto where producto.codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo') AND producto.precio = (select MAX(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));


/*
 1.1.8 Subconsultas (En la cláusula HAVING)
 ---------------------------------------------
*/
-- 19. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
select fabricante.nombre from fabricante, producto where fabricante.nombre != 'Lenovo' AND producto.codigo_fabricante = fabricante.codigo GROUP BY producto.codigo_fabricante HAVING count(producto.codigo_fabricante) = (select COUNT(*) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));
