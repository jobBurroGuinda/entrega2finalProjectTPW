<?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$actividad = (isset($_POST['actividad'])) ? $_POST['actividad'] : '';
$inicio = (isset($_POST['inicio'])) ? $_POST['inicio'] : '';
$final = (isset($_POST['termino'])) ? $_POST['termino'] : '';
$horas = (isset($_POST['horas'])) ? $_POST['horas'] : '';
$archivo = (isset($_POST['archivo'])) ? $_POST['archivo'] : '';
$observaciones = (isset($_POST['comentarios'])) ? $_POST['comentarios'] : '';


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['c_id'])) ? $_POST['c_id'] : '';


switch($opcion){
    case 1:
        $consulta = "INSERT INTO constancia (actividad, fecha_inicio, fecha_fin, horas, archivo, observaciones, valida, observaciones_encargado, creditos, alumno_id, denominacion_id) VALUES ('$actividad', '$inicio', '$final', '$horas', '$archivo', '$observaciones', 1, '$observaciones', '$horas', 1, 1) ";			
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 
        
        $consulta = "SELECT id, actividad, fecha_inicio, fecha_fin, horas, archivo, valida, observaciones FROM constancia ORDER BY user_id DESC LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);       
        break;    
    case 2:        
        $consulta = "UPDATE constancia SET actividad='$actividad', fecha_inicio='$inicio', fecha_fin='$final', horas='$horas', archivo='$archivo', observaciones='$observaciones', observaciones_encargado='$observaciones', creditos='$horas' WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        
        $consulta = "SELECT id, actividad, fecha_inicio, fecha_fin, horas, archivo, valida, observaciones FROM constancia WHERE id='$id' ";       
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 3:        
        $consulta = "DELETE FROM constancia WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;
    case 4:    
        $consulta = "SELECT id, actividad, fecha_inicio, fecha_fin, horas, archivo, valida, observaciones FROM constancia";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 5:
        $consulta = "SELECT modalidad, ejemplos, factor FROM denominacion";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
}

print json_encode($data, JSON_UNESCAPED_UNICODE);//envio el array final el formato json a AJAX
$conexion=null;