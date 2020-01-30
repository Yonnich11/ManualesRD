<?PHP


class Manuales{

private $manuales_id;
private $Manual_Estado;
private $Manual_Titulo;
private $Manual_Descripcion;
private $Manual_Autor;
private $Manual_Fecha_publicacion;
private $Manual_Numero_Pagina;
private $Manual_ISBN;
private $Manual_Ruta_URL;
private $Registro_Usuario;
private $Registro_Fecha;

public function __construct(){}



public function getManualID(){
  return $this->manuales_id;
}
public function setManualID($ID){
  $this->manuales_id = $ID;
}

public function getTitulo(){
  return $this->Manual_Titulo;
}
public function setTitulo($titulo){
  $this->Manual_Titulo = $titulo;
}

public function getDescripcion(){
  return $this->Manual_Descripcion;
}

public function setDescripcion($Descripcion){
      $this->Manual_Descripcion = $Descripcion;
}
public function getAutor(){
  return $this->Manual_Autor;
}
public function setAutor($autor){
  $this->Manual_Autor =$autor;
}

public function getFecha_publicacion(){
  return $this->Manual_Fecha_publicacion;
}

public function setFecha_publicacion($FechaPublicacion){
      $this->Manual_Fecha_publicacion = $FechaPublicacion;
}

public function getNumeroPagina(){
  return $this->Manual_Numero_Pagina;
}
public function setNumeroPagina($NumeroPage){
  $this->Manual_Numero_Pagina =  $NumeroPage;
}

public function getNumeroIBSN(){
  return $this->Manual_ISBN;
}

public function setNumeroIBSN($NumeroIBSN){
      $this->Manual_ISBN = $NumeroIBSN;
}


public function getRuta(){
  return $this->Manual_Ruta_URL;
}

public function setRuta($Url){
      $this->Manual_Ruta_URL = $Url;
}

public function getUsuario(){
  return $this->Registro_Usuario;
}

public function setUsuario($user){
      $this->Registro_Usuario = $user;
}

public function getFecha(){
  return $this->Registro_Fecha;
}

public function setFecha($fecha){
      $this->Registro_Fecha = $fecha;
}


}

?>
