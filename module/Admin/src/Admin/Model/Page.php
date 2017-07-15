<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

use Admin\Model\Master;

class Page extends Master {

    public function __construct($services)
    {
        $this->tableName = 'page';
        parent::__construct($services);
    }

    public function fetchAll()
    {
        $select = new Select('page');
        $select->order('page_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getAll()
    {
        $sql = 'SELECT * FROM page ORDER BY page_id DESC';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('page_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('page_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('page_id' => $id));

        return $result->current();
    }
}