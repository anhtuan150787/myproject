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
use Zend\Validator\ValidatorChain;
use Zend\View\Model\ViewModel;

use Admin\Form\Admin;
use Admin\View\Helper\Encrypt;

use Admin\Controller\MasterController;

class AdminController extends MasterController
{
    private $status;

    private $module = 'admin';

    public function __construct()
    {
        $this->status = [
            '1' => 'Kích hoạt',
            '0' => 'Tạm dừng',
        ];
    }

    public function indexAction()
    {
        $view = new ViewModel();

        $model = $this->getServiceLocator()->get('ModelGateway')->getModel('Admin');

        $records = $model->fetchList();
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $encrypt = $this->getServiceLocator()->get('encrypt');
        $view = new ViewModel();
        $form = new Admin();
        $form->init();

        $model = $this->getServiceLocator()->get('ModelGateway')->getModel('Admin');
        $groupModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupAdmin');

        $dbAdapter = $this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $form->setDbAdapter($dbAdapter);

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {

                $input = array();
                $input['admin_name'] = $this->params()->fromPost('admin_name');
                $input['admin_status'] = $this->params()->fromPost('admin_status');
                $input['group_admin_id'] = $this->params()->fromPost('group_admin_id');
                $input['admin_email'] = $this->params()->fromPost('admin_email');
                $input['admin_password'] = $encrypt->HashPass($this->params()->fromPost('admin_password'));
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/admin');
            }
        }

        $form->get('admin_status')->setOptions(array('value_options' => $this->status));

        $optionsGroupAdmin = [];
        foreach ($groupModel->fetchAll() as $k => $v) {
            $optionsGroupAdmin[$v['group_admin_id']] = $v['group_admin_name'];
        }
        $form->get('group_admin_id')->setOptions(array('value_options' => $optionsGroupAdmin));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $encrypt = $this->getServiceLocator()->get('encrypt');
        $view = new ViewModel();
        $form = new Admin();
        $form->init();

        $model = $this->getServiceLocator()->get('ModelGateway')->getModel('Admin');
        $groupModel = $this->getServiceLocator()->get('ModelGateway')->getModel('GroupAdmin');

        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        $dbAdapter = $this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $form->setDbAdapter($dbAdapter);

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());
            $form->setInputFilter($form->getInputFilters());

            $form->getInputFilter()->get('admin_email')->setRequired(false);
            $form->getInputFilter()->get('admin_password')->setRequired(false);

            if ($form->isValid()) {
                $input = array();
                $input['admin_name'] = $this->params()->fromPost('admin_name');
                $input['admin_status'] = $this->params()->fromPost('admin_status');
                $input['group_admin_id'] = $this->params()->fromPost('group_admin_id');
                if ($this->params()->fromPost('admin_password') != '') {
                    $input['admin_password'] = $encrypt->HashPass($this->params()->fromPost('admin_password'));
                }
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));
        $form->get('admin_status')->setOptions(array('value_options' => $this->status));

        $optionsGroupAdmin = [];
        foreach ($groupModel->fetchAll() as $k => $v) {
            $optionsGroupAdmin[$v['group_admin_id']] = $v['group_admin_name'];
        }
        $form->get('group_admin_id')->setOptions(array('value_options' => $optionsGroupAdmin));
        $form->get('admin_email')->setAttributes(array('disabled' => 'disabled'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'id' => $id, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deleteAction()
    {
        if ($this->getRequest()->isPost()) {
            $id = $this->params()->fromPost('check_item');
        } else {
            $id[] = $this->params()->fromQuery('id');
        }

        $model = $this->getServiceLocator()->get('ModelGateway')->getModel('Admin');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }
}
