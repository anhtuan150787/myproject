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

use Admin\Form\Template;

class TemplateController extends AbstractActionController
{
    use MasterTrait;

    private $module = 'template';

    private $title = 'Giao diện';

    public function indexAction()
    {
        $view = new ViewModel();

        $model = $this->getServiceLocator()->get('TemplateModel');

        $records = $model->fetchAll();
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'module' => $this->module, 'title' => $this->title]);

        return $view;
    }


    public function editAction()
    {
        $view = new ViewModel();
        $form = new Template();
        $form->init();

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('TemplateModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $pictureInfo = $this->params()->fromFiles('template_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }

            $form->setData($postData);

            if ($form->isValid()) {
                $input = array();

                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/templates');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('template_');
                    $uploadService->upload();

                    unlink('public/pictures/templates/' . $record['template_picture']);

                    $input['template_picture'] = $uploadService->getNewFile();
                }

                $input['template_content'] = $this->params()->fromPost('template_content');
                $input['template_url'] = $this->params()->fromPost('template_url');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $data['form'] = $form;

        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));
        $view->setVariables(['form' => $form, 'record' => $record, 'module' => $this->module, 'title' => $this->title]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deletePictureAction()
    {
        $id     = $this->params()->fromPost('id');
        $model  = $this->getServiceLocator()->get('TemplateModel');
        $record = $model->fetchRow($id);

        unlink('public/pictures/templates/' . $record['template_picture']);

        $params                     = array();
        $params['template_picture']     = null;
        $model->save($params, $id);

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
