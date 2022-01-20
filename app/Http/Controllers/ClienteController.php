<?php

namespace App\Http\Controllers;
use App\Models\Cliente;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ClienteController extends Controller
{
    public function listar(){
        $clientes = Cliente::all();
        $data= ['code'=> 200, 'clientes'=> $clientes, 'message' => 'clientes listado con éxito'];
        return response()->json($data);
    }

    public function buscarPorId(Request $request){
        $result = new \stdClass();

        if($request->id == ''){
            $result->code = 400;
            $result->message = 'debes ingresar el id del cliente';
            return response()->json($result);
        }

        try{
            $id = $request->id;
            $cliente = Cliente::findOrFail($id)->first();
            $result->code =200;
            $result->message='Cliente encontrado con exito';
            $result->cliente=$cliente; 
        }catch(ModelNotFoundException $e){
            $result->code =400;
            $result->message='No se encontro el id';
            $result->error = $e;
        }

        return response()->json($result);

    }

    public function crear(Request $request){
        $result = new \stdClass();
        $paramtros = $request->all();
        if(!empty($paramtros)){
            $validate = Validator::make($paramtros,[
                'nombre'=>'required',
                'apellido'=>'required',
                'rut'=>'required'
            ]);
            if($validate->fails()){
                $result->code =400;
                $result->message='No se han enviado los parametros';
                $result->error = $validate->errors();
            }else{
                $cliente = new Cliente();

                $cliente->nombre = $request->nombre;
                $cliente->apellido = $request->apellido;
                $cliente->rut = $request->rut;
                $cliente->telefono = $request->telefono;
                $cliente->direccion = $request->direccion;

                $cliente->save();

                $result->code =200;
                $result->message='Cliente creado con exito';
                $result->cliente=$cliente; 

            }

        }else{
            $result->code =400;
            $result->message='No se han enviado los parametros';
        }

        return response()->json($result);

    }

    public function editar(Request $request){
        $result = new \stdClass();
        $paramtros = $request->all();
        if(!empty($paramtros)){
            $validate = Validator::make($paramtros,[
                'nombre'=>'required',
                'apellido'=>'required',
                'rut'=>'required',
                'id' => 'required'
            ]);
            if($validate->fails()){
                $result->code =400;
                $result->message='No se han enviado los parametros';
                $result->error = $validate->errors();
            }else{

                try{

                    $cliente = Cliente::findOrFail($request->id);

                    $cliente->nombre = $request->nombre;
                    $cliente->apellido = $request->apellido;
                    $cliente->rut = $request->rut;
                    $cliente->telefono = $request->telefono;
                    $cliente->direccion = $request->direccion;

                    $cliente->save();

                    $result->code =200;
                    $result->message='Cliente editado con exito';
                    $result->cliente=$cliente; 

                }catch(ModelNotFoundException $e){
                    $result->code =400;
                    $result->message='No se encontro el id';
                    $result->error = $e;
                }
                
            }

        }else{
            $result->code =400;
            $result->message='No se han enviado los parametros';
        }

        return response()->json($result);

    }
}
