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
use Zend\Authentication\AuthenticationService;

use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;
use Zend\View\Model\JsonModel;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel();

        $productModel = $this->getServiceLocator()->get('FrontProductModel');
        $newsModel = $this->getServiceLocator()->get('FrontNewsModel');
        $templateModel = $this->getServiceLocator()->get('FrontTemplateModel');

        //Giao dien
        $template = $templateModel->getAll();
        $templateData = [];
        foreach($template as $v) {
            $templateData[$v['template_id']] = $v;
        }

        //San pham moi - 6 cai
        $homeProductNew = $productModel->getHomeNewFront(6);

        //Blog moi - 3 cai
        $homeBlogNew = $newsModel->getHomeNewFront(3);

        $view->setVariables([
            'homeProductNew' => $homeProductNew,
            'homeBlogNew' => $homeBlogNew,
            'template' => $templateData,
        ]);
        return $view;
    }

    public function emailCustomerAction()
    {
        $session = new Container('email_customer');
        $email = $this->params()->fromPost('email');
        $emailCustomerModel = $this->getServiceLocator()->get('FrontEmailCustomerModel');

        if (!$session->offsetExists('email')) {
            $params = [];
            $params['email_customer_name'] = $email;
            $emailCustomerModel->save($params);

            $session->offsetSet('email', $email);
        }

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
