<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

use Admin\Model\Master;

class EmailCustomer extends Master {

    public function __construct($services)
    {
        $this->tableName = 'email_customer';
        parent::__construct($services);
    }

    public function fetchAll()
    {
        $select = new Select('email_customer');
        $select->order('email_customer_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getAll()
    {
        $sql = 'SELECT * FROM email_customer ORDER BY email_customer_name ASC';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }
}