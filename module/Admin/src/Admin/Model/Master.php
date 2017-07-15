<?php
namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;

class Master {

    protected $tableGateway;
    protected $dbAdapter;
    protected $tableName = '';
    protected $services;

    public function __construct($services)
    {
        $this->services = $services;
        $this->dbAdapter = $this->services->get('Zend/Db/Adapter/Adapter');
        $this->tableGateway = new TableGateway($this->tableName, $this->dbAdapter);
    }

}