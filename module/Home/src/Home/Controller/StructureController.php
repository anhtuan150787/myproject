<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Home\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;


class StructureController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontStructureModel');

        $countAll = $model->countAll();
        $view->setVariables([
            'countAll' => $countAll,
        ]);

        return $view;
    }

    public function confirmAction()
    {
        $session = new Container('structure');

        $end = $this->params()->fromQuery('end');
        $start = $this->params()->fromQuery('start');

        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontStructureModel');

        $records = $model->getListLimit($start, $end);
        $data = [];

        foreach($records as $v) {
            $data[$v['structure_id']] = $v;
        }

        $session->offsetSet('data', $data);

        $view->setVariables([
            'records' => $data,
        ]);

        return $view;
    }

    public function processAction() {
        $session = new Container('structure');
        $view = new ViewModel();

        $message = '';

        $data = $session->offsetGet('data');

        if ($_POST) {
            $id = $this->params()->fromPost('id');
            $structure_en = $this->params()->fromPost('structure_en');

            if (strcasecmp($data[$id]['structure_en'], $structure_en) == 0) {
                unset($data[$id]);
                $session->offsetSet('data', $data);
            } else {
                $message = 'Cấu trúc câu chưa đúng';
            }
        }

        $view->setVariables([
            'records' => $data,
            'message' => $message,
        ]);

        return $view;
    }

}
