<?php

namespace App\Http\Controllers;

use App\Models\TipoVehiculo;
use Illuminate\Http\Request;
use stdClass;

class TipoVehiculoController extends Controller
{
    public function listar(){

        $result = new stdClass();
        $tipo_vehiculo = TipoVehiculo::all();
        $result->code = 200;
        $result->tipo_vehiculo = $tipo_vehiculo;
        $result->message = 'tipos de vehiculos listados con exito';
        
        return response()->json($result);
    }
}
