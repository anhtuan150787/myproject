<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Admin\Form\Build;

class BuildController extends AbstractActionController
{
    use MasterTrait;

    private $status;
    private $component;
    private $statusColor;

    public function __construct()
    {
        $this->status = [
            '3' => 'Chưa Golive',
            '1' => 'Đã Golive',
            '4' => 'Chưa giao QC',
            '0' => 'Tạm dừng',
        ];

        $this->component = [
            '1' => 'Payoo',
            '2' => 'MMS',
            '3' => 'NewPayoo2',
            '4' => 'BO',
            '5' => 'Paycode',
            '6' => 'PayooCMS (PimCore)',
            '7' => 'PayooV3',
        ];

        $this->statusColor = [
            '3' => '#f0ad4e',
            '1' => '#5cb85c',
            '4' => '#fff',
            '0' => '#666666',
        ];
    }


    public function indexAction()
    {
        $view = new ViewModel();

        $model = $this->getServiceLocator()->get('BuildModel');

        $records = $model->fetchAll();
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'component' => $this->component, 'statusColor' => $this->statusColor]);

        return $view;
    }

    public function addAction()
    {
        $view = new ViewModel();
        $form = new Build();
        $form->init();

        $model = $this->getServiceLocator()->get('BuildModel');

        if ($this->getRequest()->isPost()) {
            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['name']          = $this->params()->fromPost('name');
                $input['component']     = $this->params()->fromPost('component');
                $input['folder']        = $this->params()->fromPost('folder');
                $input['subversion']    = $this->params()->fromPost('subversion');
                $input['note']          = $this->params()->fromPost('note');
                $input['status']        = $this->params()->fromPost('status');
                $input['date_created']  = date('Y-m-d H:i:s');
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/build');
            }
        }

        $form->get('component')->setOptions(array('value_options' => $this->component));
        $form->get('status')->setOptions(array('value_options' => $this->status));

        $data['form'] = $form;

        $view->setVariables(['form' => $form]);
        $view->setTemplate('admin/build/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $view = new ViewModel();
        $form = new Build();
        $form->init();

        $model = $this->getServiceLocator()->get('BuildModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {
            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['name']          = $this->params()->fromPost('name');
                $input['component']     = $this->params()->fromPost('component');
                $input['folder']        = $this->params()->fromPost('folder');
                $input['subversion']    = $this->params()->fromPost('subversion');
                $input['note']          = $this->params()->fromPost('note');
                $input['status']        = $this->params()->fromPost('status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/build');
            }
        }

        $form->bind($record);

        $form->get('component')->setOptions(array('value_options' => $this->component));
        $form->get('status')->setOptions(array('value_options' => $this->status));
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form]);
        $view->setTemplate('admin/build/form.phtml');

        return $view;
    }

    public function deleteAction()
    {
        $id     = $this->params()->fromQuery('id');
        $model  = $this->getServiceLocator()->get('BuildModel');

        $model->delete($id);

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/build');

        return $this->response();
    }
}
