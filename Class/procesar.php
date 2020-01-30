<?php

require_once("Conexion.php");
// https://www.ecodeup.com/crud-en-php-para-principiantes/

class Procesar{

  public function __construct(){}


public function BuscarManual($Nombre){

  $db = Conexion::Conectar();
  $listaManual =[];
  $query= $db->prepare(" call sp_Manuales_Consulta(?)");
  $query->bindValue('NombreManual',$Nombre);
  $query->execute();
 
  foreach($query->fecth() as $manual){
    $mybook = new Manuales();
    $mybook->setManualID($manual['manuales_id']);
    $mybook->setTitulo($manual['Manual_Titulo']);
    $mybook->setDescripcion($manual['Manual_Descripcion']);
    $mybook->setAutor($manual['Manual_Autor']);
    $mybook->setFecha_publicacion($manual['Manual_Fecha_publicacion']);
    $mybook->setNumeroPagina($manual['Manual_Numero_Pagina']);
    $mybook->setRuta($manual['Manual_Ruta_URL']);
    $listaManual[] = $mybook;
  }
  return $listaManual;


}
  public function InsertarManual($Manuales){

    $db = Conexion::Conectar();
    $insert= $db->prepare(" call sp_Manuales_Insertar(?)");
    $insert->bindValue("Manual_Titulo", $Manuales->getTitulo());
    $insert->bindValue("Manual_Descripcion", $Manuales->getDescripcion());
    $insert->bindValue("Manual_Autor", $Manuales->getAutor());
    $insert->bindValue("Manual_Fecha_publicacion", $Manuales->getFecha_publicacion());
    $insert->bindValue("Manual_Numero_Pagina", $Manuales->getNumeroPagina());
    $insert->bindValue("Manual_ISBN", $Manuales->getNumeroIBSN());
    $insert->bindValue("Manual_Ruta_URL", $Manuales->getRuta());
    $insert->bindValue("Registro_Usuario", $Manuales->getUsuario());
    $insert->execute();

  }


public function ActualizarManual($Manuales){

  $db = Conexion::Conectar();
  $update= $db->prepare(" call sp_Manual_Actualizar(?)");
  $update->bindValue("Manual_Titulo", $Manuales->getTitulo());
  $update->bindValue("Manual_Descripcion", $Manuales->getDescripcion());
  $update->bindValue("Manual_Autor", $Manuales->getAutor());
  $update->bindValue("Manual_Fecha_publicacion", $Manuales->getFecha_publicacion());
  $update->bindValue("Manual_Numero_Pagina", $Manuales->getNumeroPagina());
  $update->bindValue("Manual_ISBN", $Manuales->getNumeroIBSN());
  $update->bindValue("Manual_Ruta_URL", $Manuales->getRuta());
  $update->bindValue("Registro_Usuario", $Manuales->getUsuario());
  $update->execute();

}

public function EliminarManual($Manuales ){

  $db = Conexion::Conectar();
  $update= $db->prepare(" call sp_Manuales_Inactiva(?)");
  $update->bindValue("manual_id", $Manuales->getManualID());

}


}



?>
