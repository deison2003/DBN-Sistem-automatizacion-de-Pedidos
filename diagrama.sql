CREATE TABLE `clientes` (
  `id_cliente` INT PRIMARY KEY,
  `nombre` VARCHAR(100),
  `correo` VARCHAR(100),
  `categoria_id` INT,
  `fecha_registro` TIMESTAMP
);

CREATE TABLE `categorias_clientes` (
  `id_categoria` INT PRIMARY KEY,
  `nombre` VARCHAR(50),
  `descuento` DECIMAL(4,2)
);

CREATE TABLE `productos` (
  `id_producto` INT PRIMARY KEY,
  `nombre` VARCHAR(100),
  `valor_unitario` DECIMAL(10,2),
  `cantidad_stock` INT,
  `fecha_vencimiento` DATE,
  `estado` VARCHAR(20)
);

CREATE TABLE `pedidos` (
  `id_pedido` INT PRIMARY KEY,
  `id_cliente` INT,
  `fecha` TIMESTAMP,
  `total` DECIMAL(10,2)
);

CREATE TABLE `detalles_pedido` (
  `id_detalle` INT PRIMARY KEY,
  `id_pedido` INT,
  `id_producto` INT,
  `cantidad` INT,
  `precio_unitario` DECIMAL(10,2),
  `subtotal` DECIMAL(10,2)
);

CREATE TABLE `metodos_pago` (
  `id_pago` INT PRIMARY KEY,
  `nombre` VARCHAR(50),
  `descripcion` TEXT
);

CREATE TABLE `pagos` (
  `id_pago` INT PRIMARY KEY,
  `id_pedido` INT,
  `id_metodo` INT,
  `monto` DECIMAL(10,2),
  `fecha_pago` TIMESTAMP
);

CREATE TABLE `auditoria` (
  `id` INT PRIMARY KEY,
  `usuario` VARCHAR(100),
  `tabla_afectada` VARCHAR(100),
  `accion` VARCHAR(50),
  `fecha` TIMESTAMP
);

ALTER TABLE `clientes` ADD FOREIGN KEY (`categoria_id`) REFERENCES `categorias_clientes` (`id_categoria`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

ALTER TABLE `detalles_pedido` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

ALTER TABLE `detalles_pedido` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `pagos` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

ALTER TABLE `pagos` ADD FOREIGN KEY (`id_metodo`) REFERENCES `metodos_pago` (`id_pago`);

ALTER TABLE `auditoria` ADD FOREIGN KEY (`fecha`) REFERENCES `auditoria` (`tabla_afectada`);

ALTER TABLE `auditoria` ADD FOREIGN KEY (`accion`) REFERENCES `auditoria` (`tabla_afectada`);
