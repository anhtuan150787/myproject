<?php
namespace Admin\Model;

class Navigation {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getNavigationList($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM navigation WHERE navigation_parent = ' . $parent . ' ORDER BY navigation_position ASC';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $navigation_id = $row['navigation_id'];

            $data[$navigation_id] = (array) $row;
            $data[$navigation_id]['navigation_level'] = $level;

            $sql = 'SELECT * FROM navigation WHERE navigation_parent = ' . $navigation_id . ' ORDER BY navigation_position ASC';

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getNavigationList($navigation_id, $level, $data);
            }
        }
        return $data;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('navigation_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('navigation_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('navigation_id' => $id));

        return $result->current();
    }
}