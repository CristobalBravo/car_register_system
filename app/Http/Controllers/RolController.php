<?php

namespace App\Http\Controllers;

use App\Models\Rol;
use Illuminate\Http\Request;
use stdClass;

class RolController extends Controller
{
    public function listar(){
        $result = new stdClass();
        $roles = Rol::all();
        $result->code = 200;
        $result->roles = $roles;
        $result->message = 'Roles listados con éxito';
        
        return response()->json($result);
    }
}
