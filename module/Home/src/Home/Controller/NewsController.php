<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Home\Controller;

use Admin\View\Helper\Functions;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;

class NewsController extends AbstractActionController
{
    public function categoryAction()
    {
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontNewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('FrontNewsCategoryModel');
        $data = $this->params()->fromRoute();
        $id = $data['id'];
        $newsCategory = $newsCategoryModel->fetchRow($id);


        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <span class="page-title">' . $newsCategory['news_category_name'] . '</span>
                        </div>';

        $news = $model->getListNewsByCategory($id);
        $news->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $news->setItemCountPerPage(18);

        $view->setVariables([
            'news' => $news,
            'newsCategory' => $newsCategory,
            'name' => $data['name'],
            'id' => $data['id'],
            'breadcrumbs' => $breadcrumbs,
        ]);


        return $view;
    }

    public function detailAction()
    {
        $functions = new Functions();
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontNewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('FrontNewsCategoryModel');
        $data = $this->params()->fromRoute();
        $id = $data['id'];

        $news = $model->fetchRow($id);
        $newsCategory = $newsCategoryModel->fetchRow($news['news_category_id']);
        $newsOther = $model->getNewsOther($news['news_category_id']);

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <a href="' . $this->url()->fromRoute('home-news-category', array('name' => $functions->formatTitle($newsCategory['news_category_name']), 'id' => $newsCategory['news_category_id'])) . '">' . $newsCategory['news_category_name'] . '</a>
                            <span class="separator">»</span>
                            <span class="page-title">' . $news['news_title'] . '</span>
                        </div>';

        $view->setVariables([
            'news' => $news,
            'newsOther' => $newsOther,
            'breadcrumbs' => $breadcrumbs,
        ]);

        return $view;
    }


}
