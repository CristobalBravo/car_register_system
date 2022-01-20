<?php

namespace App\Http\Controllers;

use App\Models\EstadoVehiculo;
use Illuminate\Http\Request;
use stdClass;

class EstadoVehiculoController extends Controller
{
    public function listar(){

        $result = new stdClass();
        $estado_vehiculo = EstadoVehiculo::all();
        $result->code = 200;
        $result->estado_vehiculo = $estado_vehiculo;
        $result->message = 'Estados de vehiculos listados con exito';
        
        return response()->json($result);
    }
}
