INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `rut`, `telefono`, `direccion`) VALUES (NULL, 'Cristobal', 'Bravo', '190714934', '956613666', 'Villa Pre Cordillera Maipu 125');
INSERT INTO `tipo_vehiculo` (`id`, `nombre`) VALUES (NULL, 'Camioneta');
INSERT INTO `estado_vehiculo` (`id`, `nombre`) VALUES (NULL, 'Disponible'), (NULL, 'Vendido'), (NULL, 'No Disponible');
INSERT INTO `estado_usuario` (`id`, `nombre`) VALUES (NULL, 'Disponible'), (NULL, 'No Disponible');
INSERT INTO `marca` (`id`, `nombre`) VALUES (NULL, 'suzuki'), (NULL, 'toyota');
INSERT INTO `rol` (`id`, `nombre`) VALUES (NULL, 'ADMIN'), (NULL, 'USER');
INSERT INTO `tipo_pago` (`id`, `nombre`) VALUES (NULL, 'Efectivo o Transferencia'), (NULL, 'Cheque');