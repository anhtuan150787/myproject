<?php
namespace Admin\Model;

use Admin\Model\Master;

class NewsCategory extends Master{

    public function __construct($services)
    {
        $this->tableName = 'news_category';
        parent::__construct($services);
    }

    public function getNewsCategoryList($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM news_category WHERE news_category_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $news_category_id = $row['news_category_id'];

            $data[$news_category_id] = (array) $row;
            $data[$news_category_id]['news_category_level'] = $level;

            $sql = 'SELECT * FROM news_category WHERE news_category_parent = ' . $news_category_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getNewsCategoryList($news_category_id, $level, $data);
            }
        }
        return $data;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('news_category_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('news_category_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('news_category_id' => $id));

        return $result->current();
    }
}