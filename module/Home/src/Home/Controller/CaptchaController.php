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
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;

use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;
use Zend\View\Model\JsonModel;

class CaptchaController extends AbstractActionController
{
    public function indexAction() {
        $dirdata = 'public';
        $urlcaptcha = '/captcha';
        $element = new CaptchaImage(  array(
                'font' => $dirdata . '/fonts/arial.ttf',
                'width' => 150,
                'height' => 50,
                'dotNoiseLevel' => 10,
                'lineNoiseLevel' => 3)
        );
        $element->setImgDir($dirdata.'/captcha');
        $element->setImgUrl($urlcaptcha);
        $element->setWordlen(4);
        $element->generate();

        $basePath = $this->getServiceLocator()->get('ViewHelperManager')->get('basePath');

        return new JsonModel([
            'id' => $element->getId(),
            'url' => $basePath($element->getImgUrl() . $element->getId() . $element->getSuffix())
        ]);
    }


}
