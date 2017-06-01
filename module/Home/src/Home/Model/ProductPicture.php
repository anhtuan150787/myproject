<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class ProductPicture {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('product_picture');
        $select->order('product_picture_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('product_picture_id' => $id));

        return $result->current();
    }

    public function getAllByProductDetail($productDetailId) {
        $sql = 'SELECT * FROM product_picture
                WHERE product_detail_id = ' . $productDetailId;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }
}