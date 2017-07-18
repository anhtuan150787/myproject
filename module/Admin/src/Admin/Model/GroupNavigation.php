<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

use Admin\Model\Master;

class GroupNavigation extends Master {

    public function __construct($services)
    {
        $this->tableName = 'group_navigation';
        parent::__construct($services);
    }

    public function fetchAll()
    {
        $select = new Select('group_navigation');
        $select->order('group_navigation_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('group_navigation_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('group_navigation_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('group_navigation_id' => $id));

        return $result->current();
    }
}