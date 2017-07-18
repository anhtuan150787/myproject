<?php
namespace Admin\Model;

use Admin\Model\Master;

class ProductCategory extends Master {

    public function __construct($services)
    {
        $this->tableName = 'product_category';
        parent::__construct($services);

        $this->cache = $this->services->get('cache');
    }

    public function getProductCategoryList($parent = 0, $level = -1, $data = array())
    {
        if (!$this->cache->setNameSpace('product_category')->checkItem('product_category_model')) {
            $result = $this->getProductCategory($parent, $level, $data);
            $this->cache->setNameSpace('product_category')->set('product_category_model', $result);
            return $result;
        } else {
            return $this->cache->setNameSpace('product_category')->get('product_category_model');
        }
    }

    public function getProductCategory($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM product_category WHERE product_category_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $product_category_id = $row['product_category_id'];

            $data[$product_category_id] = (array) $row;
            $data[$product_category_id]['product_category_level'] = $level;

            $sql = 'SELECT * FROM product_category WHERE product_category_parent = ' . $product_category_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getProductCategory($product_category_id, $level, $data);
            }
        }
        return $data;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('product_category_id' => $id));
        }

        $this->cache->setNameSpace('product_category')->clearByNameSpace();
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('product_category_id' => $id));

        $this->cache->setNameSpace('product_category')->clearByNameSpace();
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('product_category_id' => $id));

        return $result->current();
    }
}