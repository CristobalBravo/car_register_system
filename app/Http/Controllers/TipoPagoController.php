<?php

namespace App\Http\Controllers;

use App\Models\TipoPago;
use Illuminate\Http\Request;
use stdClass;

class TipoPagoController extends Controller
{
    public function listar(){

        $result = new stdClass();
        $tipo_pago = TipoPago::all();
        $result->code = 200;
        $result->tipo_pago = $tipo_pago;
        $result->message = 'tipos de pago listados con exito';
        
        return response()->json($result);
    }
}
