<?php
namespace Admin\Model;

use Admin\Model\Master;

class GroupAcl extends Master{

    private $cache;

    public function __construct($services)
    {
        $this->tableName = 'group_acl';
        parent::__construct($services);

        $this->cache = $this->services->get('cache');
    }

    public function getGroupAcl($group_admin_id, $parent = 0, $level = -1, $data = array())
    {
        if (!$this->cache->setNameSpace('group_acl')->checkItem('group_acl_model_' . $group_admin_id)) {
            $sql = 'SELECT *
                FROM group_acl as gac
                LEFT JOIN acl as ac ON gac.acl_id=ac.acl_id
                WHERE gac.group_admin_id = ' . $group_admin_id . ' AND gac.group_acl_status = 1';
            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            $data = [];
            foreach($result as  $v) {
                $data[$v['group_acl_id']] = (array) $v;
            }

            $this->cache->setNameSpace('group_acl')->set('group_acl_model_' . $group_admin_id, $data);
            return $data;
        } else {
            return $this->cache->setNameSpace('group_acl')->get('group_acl_model_' . $group_admin_id);
        }
    }

    public function saveWhere($data, $where)
    {
        $this->tableGateway->update($data, $where);

        $this->cache->setNameSpace('group_acl')->clearByNameSpace();
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('group_acl_id' => $id));
        }
        $this->cache->setNameSpace('group_acl')->clearByNameSpace();
    }

    public function checkExistAcl($groupAdminId, $acl_id)
    {
        $sql = 'SELECT * FROM group_acl WHERE group_admin_id = ' . $groupAdminId . ' AND acl_id = ' . $acl_id;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result->count();
    }

    public function deleteWhere($where)
    {
        $this->tableGateway->delete($where);

        $this->cache->setNameSpace('group_acl')->clearByNameSpace();
    }
}