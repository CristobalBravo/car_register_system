<?php

namespace App\Http\Controllers;

use App\Models\EstadoUsuario;
use Illuminate\Http\Request;
use stdClass;

class EstadoUsuarioController extends Controller
{
    public function listar(){

        $result = new stdClass();
        $estados_usuarios = EstadoUsuario::all();
        $result->code = 200;
        $result->estados_usuarios = $estados_usuarios;
        $result->message = 'Estados de usuario listados con éxito';
        
        return response()->json($result);
    }

}
