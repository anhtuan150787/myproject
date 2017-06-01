<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Structure {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('structure');
        $select->order('structure_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getAll()
    {
        $sql = 'SELECT * FROM structure ORDER BY structure_id DESC';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function getListLimit($start, $end) {

        $sql = 'SELECT * FROM structure ORDER BY structure_id ASC LIMIT ' . $start . ',' . ($end-$start);
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('structure_id' => $id));

        return $result->current();
    }

    public function countAll()
    {
        $sql = 'SELECT * FROM structure';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $results = $statement->execute();
        $results->count();

        return $results->count();
    }
}