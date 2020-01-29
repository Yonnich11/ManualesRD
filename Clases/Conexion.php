<?php

 /**
 * summary
 */
class Conexion
{
	private $host = "localhost";
	private $User = "root"
	private $Clave = "";
	private $db = "db_manualesrd";
	public $conec;
  
    public function __construct()
    {
        $this->conec = new mysqli($this->host, $this->User,$this->Clave,$this->db) or die(mysql_error());
        $this->conec->set_charset("UTF8");
    }
}


?>
