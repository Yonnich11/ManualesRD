<?php

 /**
 * summary
 */
class Conexion
{

	public $conec = null;

    public function __construct()
    {

    }

		public function conectar(){
			$pdo_options[PDO::ATTR_ERRMODE]=PDO::ERRMODE_EXCEPTION;
        $this->conec = new PDO("mysql:host=localhost;dbname=db_manualesrd",'root','',);
      //  $this->conec->set_charset("UTF8");

			return self:: $this->conec;
		}
}


?>
