<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class ProductDetail {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('product_detail');
        $select->order('product_detail_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }


    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('product_detail_id' => $id));

        return $result->current();
    }

    public function getAllByProduct($productId)
    {
        $sql = 'SELECT * FROM product_detail as pd
                LEFT JOIN color as c ON pd.color_id=c.color_id
                WHERE product_id = ' . $productId;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }
}