<?php

namespace App\Http\Controllers;

use App\Models\Marca;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use stdClass;

class MarcaController extends Controller
{
    public function listar(){

        $result = new stdClass();
        $marcas = Marca::all();
        $result->code = 200;
        $result->marcas = $marcas;
        $result->message = 'marcas listadas con exito';
        
        return response()->json($result);
    }

    
    public function crear(Request $request){
        $result = new \stdClass();
        $paramtros = $request->all();
        if(!empty($paramtros)){
            $validate = Validator::make($paramtros,[
                'nombre'=>'required',
            ]);
            if($validate->fails()){
                $result->code =400;
                $result->message='No se ha enviado el nombre de la marca';
                $result->error = $validate->errors();
            }else{
                $marca = new Marca();

                $marca->nombre = $request->nombre;

                $marca->save();

                $result->code =200;
                $result->message='Marca creada con éxito';
                $result->marca=$marca; 

            }

        }else{
            $result->code =400;
            $result->message='No se han enviado ningun parametro';
        }

        return response()->json($result);

    }

    public function editar(Request $request){
        $result = new \stdClass();
        $paramtros = $request->all();
        if(!empty($paramtros)){
            $validate = Validator::make($paramtros,[
                'nombre'=>'required',
                'id' => 'required'
            ]);
            if($validate->fails()){
                $result->code =400;
                $result->message='No se han enviado los parametros';
                $result->error = $validate->errors();
            }else{

                try{

                    $marca = Marca::findOrFail($request->id);

                    $marca->nombre = $request->nombre;

                    $marca->save();

                    $result->code =200;
                    $result->message='Marca editada con éxito';
                    $result->marca=$marca; 

                }catch(ModelNotFoundException $e){
                    $result->code =400;
                    $result->message='No se encontro el id';
                    $result->error = $e;
                }
                
            }

        }else{
            $result->code =400;
            $result->message='No se han enviado los parámetros';
        }

        return response()->json($result);

    }
}
