<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

use Admin\Model\Master;

class Website extends Master{

    public function __construct($services)
    {
        $this->tableName = 'website';
        parent::__construct($services);
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('website_id' => $id));
        }
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('website_id' => $id));

        return $result->current();
    }
}