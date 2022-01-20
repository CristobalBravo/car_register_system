<?php

use App\Http\Controllers\ClienteController;
use App\Http\Controllers\EstadoUsuarioController;
use App\Http\Controllers\EstadoVehiculoController;
use App\Http\Controllers\MarcaController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\TipoPagoController;
use App\Http\Controllers\TipoVehiculoController;
use App\Models\EstadoUsuario;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*                          Cliente                                */
Route::get('/cliente/', [ClienteController::class, 'listar']);
Route::post('/cliente/id', [ClienteController::class, 'buscarPorId']);
Route::post('/cliente/editar/', [ClienteController::class, 'editar']);
Route::post('/cliente/crear/', [ClienteController::class, 'crear']);

/*                          Marca                                */
Route::get('/marca/', [MarcaController::class, 'listar']);
Route::post('/marca/editar/', [MarcaController::class, 'editar']);
Route::post('/marca/crear/', [MarcaController::class, 'crear']);

/*                          Estado Vehiculos                      */
Route::get('/estado/vehiculo/', [EstadoVehiculoController::class, 'listar']);

/*                          Tipo Vehiculo                      */
Route::get('/tipo/vehiculo/', [TipoVehiculoController::class, 'listar']);

/*                          Tipo Pago                              */
Route::get('/tipo/pago/', [TipoPagoController::class, 'listar']);

/*                          Rol                            */
Route::get('/rol/', [RolController::class, 'listar']);

/*                          Estados Usuarios                            */
Route::get('/estado/usuario/', [EstadoUsuarioController::class, 'listar']);

