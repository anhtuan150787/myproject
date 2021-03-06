<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

use Admin\Model\Master;

class News extends Master{

    public function __construct($services)
    {
        $this->tableName = 'news';
        parent::__construct($services);

        $this->cache = $this->services->get('cache');
    }

    public function fetchAll($search)
    {
        $select = new Select('news');
        $select->join('news_category', 'news.news_category_id=news_category.news_category_id', array('news_category_name'), 'left');

        $where = '';
        $predicate = new  \Zend\Db\Sql\Where();

        $where = $predicate->isNotNull('news_id');

        if (isset($search['name'])) {
            $where->and;
            $select->where($predicate->like('news_title', '%' . $search['name'] . '%'));
        }
        if (isset($search['category'])) {
            $where->and;
            $select->where($predicate->equalTo('news.news_category_id', $search['category']));
        }

        $select->where($where);
        $select->order('news_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function fetchAllWhereCategory($categoryId)
    {
        $sql = 'SELECT * FROM news WHERE news_category_id = ' . $categoryId;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function getAll()
    {
        if (!$this->cache->setNameSpace('news')->checkItem('news_model_getall')) {
            $sql = 'SELECT news_id, news_title FROM news ORDER BY news_id DESC';
            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            $data = [];
            foreach($result as $v) {
                $data[$v['news_id']] = (array) $v;
            }
            $this->cache->setNameSpace('news')->set('news_model_getall', $data);
            return $data;
        } else {
            return $this->cache->setNameSpace('news')->get('news_model_getall');
        }
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('news_id' => $id));
        }
        $this->cache->setNameSpace('news')->clearByNameSpace();
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('news_id' => $id));

        $this->cache->setNameSpace('news')->clearByNameSpace();
    }

    public function deleteWhere($where)
    {
        $this->tableGateway->delete($where);

        $this->cache->setNameSpace('news')->clearByNameSpace();
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('news_id' => $id));

        return $result->current();
    }
}