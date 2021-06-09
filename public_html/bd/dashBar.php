<?php
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

    $consulta = "SELECT nombre, (creditos_acumulados/creditos)*100 AS porcentaje, creditos, creditos_acumulados FROM electiva";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
        $data_num = count($data);
        for($i=0 ; $i<$data_num ; $i++){
        	$data[$i]["nombre"] = "<h4 class='display-4' id='titulo'>" . $data[$i]["nombre"] . "</h4>";
        	$data[$i]["porcentaje"] = "<div class='py-4'>" .
        										"<div class='progress'>" .
        										"<div class='progress-bar progress-bar-striped inicio' id='barra' role='progressbar' " .
        										" aria-valuenow='75' aria-valuemin='0' aria-valuemax='100' style='width: " .
        										$data[$i]["porcentaje"] .
        										"%;'></div>" .
        										"</div>" .
        										"</div>".
        										$data[$i]["creditos_acumulados"]." de ".$data[$i]["creditos"].": ".intval($data[$i]["porcentaje"])."%";
        }

print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion=null;