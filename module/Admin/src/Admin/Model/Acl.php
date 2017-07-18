<?php
namespace Admin\Model;

use Admin\Model\Master;


class Acl extends Master {

    private $cache;

    public function __construct($services)
    {
        $this->tableName = 'acl';
        parent::__construct($services);

        $this->cache = $this->services->get('cache');
    }

    public function getAclList($parent = 0, $level = -1, $data = array())
    {
        if (!$this->cache->setNameSpace('acl')->checkItem('acl_model')) {
            $result = $this->getAcl($parent, $level, $data);
            $this->cache->setNameSpace('acl')->set('acl_model', $result);
            return $result;
        } else {
            return $this->cache->setNameSpace('acl')->get('acl_model');
        }
    }

    public function getAcl($parent = 0, $level = -1, $data = array()) {
        $sql = 'SELECT * FROM acl WHERE acl_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $acl_id = $row['acl_id'];

            $data[$acl_id] = (array) $row;
            $data[$acl_id]['acl_level'] = $level;

            $sql = 'SELECT * FROM acl WHERE acl_parent = ' . $acl_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getAcl($acl_id, $level, $data);
            }
        }
        return $data;
    }

    public function getAclRoot()
    {
        $sql = 'SELECT * FROM acl WHERE acl_parent = 0';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('acl_id' => $id));
        }
        $this->cache->setNameSpace('acl')->clearByNameSpace();
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('acl_id' => $id));
        $this->cache->setNameSpace('acl')->clearByNameSpace();
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('acl_id' => $id));

        return $result->current();
    }
}