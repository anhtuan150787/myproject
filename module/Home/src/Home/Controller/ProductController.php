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
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class ProductController extends AbstractActionController
{
    public function indexAction()
    {
        return $view = new ViewModel();
    }

    public function allAction()
    {
        $view   = new ViewModel();
        $session = new Container('product');
        $data   = $this->params()->fromRoute();

        $model                  = $this->getServiceLocator()->get('FrontProductModel');
        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');
        $colorModel             = $this->getServiceLocator()->get('FrontColorModel');
        $sizeModel              = $this->getServiceLocator()->get('FrontSizeModel');

        if (!isset($_GET['page'])) {
            $session->offsetUnset('search');
        }

        $search = [];
        if ($this->getRequest()->isPost()) {
            $dataSearch = $this->params()->fromPost();
            if ($dataSearch['sort_search']) {
                $search['sort_search'] = $dataSearch['sort_search'];
            }
            if ($dataSearch['color_search']) {
                $search['color_search'] = $dataSearch['color_search'];
            }
            if ($dataSearch['size_search']) {
                $search['size_search'] = $dataSearch['size_search'];
            }

            $session->offsetSet('search', $dataSearch);
        }

        if ($session->offsetExists('search')) {
            $search = $session->offsetGet('search');
            $dataSearch = $search;
        }

        $products = $model->getListProductAll($search);
        $products->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $products->setItemCountPerPage(20);

        $productData = $model->getProductDetailByResultList($products);

        $productCategoryList = $productCategoryModel->getProductCategoryList();

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <span class="page-title">Sản phẩm mới</span>
                        </div>';

        $view->setVariables([
            'products'          => $products,
            'productCategoryList' => $productCategoryList,
            'name'              => $data['name'],
            'id'                => $data['id'],
            'breadcrumbs'       => $breadcrumbs,
            'color'             => $colorModel->getAll(),
            'size'              => $sizeModel->getAll(),
            'search'            => $dataSearch,
            'productData'       => $productData,
        ]);

        return $view;
    }

    public function saleAction()
    {
        $view   = new ViewModel();
        $session = new Container('product');
        $data   = $this->params()->fromRoute();

        $model                  = $this->getServiceLocator()->get('FrontProductModel');
        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');
        $colorModel             = $this->getServiceLocator()->get('FrontColorModel');
        $sizeModel              = $this->getServiceLocator()->get('FrontSizeModel');

        if (!isset($_GET['page'])) {
            $session->offsetUnset('search');
        }

        $search = [];
        if ($this->getRequest()->isPost()) {
            $dataSearch = $this->params()->fromPost();
            if ($dataSearch['sort_search']) {
                $search['sort_search'] = $dataSearch['sort_search'];
            }
            if ($dataSearch['color_search']) {
                $search['color_search'] = $dataSearch['color_search'];
            }
            if ($dataSearch['size_search']) {
                $search['size_search'] = $dataSearch['size_search'];
            }

            $session->offsetSet('search', $dataSearch);
        }

        if ($session->offsetExists('search')) {
            $search = $session->offsetGet('search');
            $dataSearch = $search;
        }

        $products = $model->getListProductSale($search);
        $products->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $products->setItemCountPerPage(20);

        $productData = $model->getProductDetailByResultList($products);

        $productCategoryList = $productCategoryModel->getProductCategoryList();

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <span class="page-title">Sản phẩm Sale</span>
                        </div>';

        $view->setVariables([
            'products'          => $products,
            'productCategoryList' => $productCategoryList,
            'name'              => $data['name'],
            'id'                => $data['id'],
            'breadcrumbs'       => $breadcrumbs,
            'color'             => $colorModel->getAll(),
            'size'              => $sizeModel->getAll(),
            'search'            => $dataSearch,
            'productData'       => $productData,
        ]);

        return $view;
    }

    public function newAction() {
        $view = new ViewModel();
        return $view;
    }

    public function categoryAction()
    {
        $view   = new ViewModel();
        $session = new Container('product');
        $data   = $this->params()->fromRoute();
        $productCategoryId = $data['id'];

        $model                  = $this->getServiceLocator()->get('FrontProductModel');
        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');
        $colorModel             = $this->getServiceLocator()->get('FrontColorModel');
        $sizeModel              = $this->getServiceLocator()->get('FrontSizeModel');

        if (!isset($_GET['page'])) {
            $session->offsetUnset('search');
        }

        $search = [];
        if ($this->getRequest()->isPost()) {
            $dataSearch = $this->params()->fromPost();
            if ($dataSearch['sort_search']) {
                $search['sort_search'] = $dataSearch['sort_search'];
            }
            if ($dataSearch['color_search']) {
                $search['color_search'] = $dataSearch['color_search'];
            }
            if ($dataSearch['size_search']) {
                $search['size_search'] = $dataSearch['size_search'];
            }

            $session->offsetSet('search', $dataSearch);
        }

        if ($session->offsetExists('search')) {
            $search = $session->offsetGet('search');
            $dataSearch = $search;
        }

        $products = $model->getListProductByCategory($productCategoryId, $search);
        $products->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $products->setItemCountPerPage(20);

        $productData = $model->getProductDetailByResultList($products);

        $productCategory = $productCategoryModel->fetchRow($productCategoryId);
        $productCategoryList = $productCategoryModel->getProductCategoryList();

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <span class="page-title">' . $productCategory['product_category_name'] . '</span>
                        </div>';

        $view->setVariables([
            'products'          => $products,
            'productCategory'   => $productCategory,
            'productCategoryList' => $productCategoryList,
            'name'              => $data['name'],
            'id'                => $data['id'],
            'breadcrumbs'       => $breadcrumbs,
            'color'             => $colorModel->getAll(),
            'size'              => $sizeModel->getAll(),
            'search'            => $dataSearch,
            'productData'       => $productData,
        ]);

        return $view;
    }

    public function detailAction()
    {
        $functions  = new Functions();
        $view       = new ViewModel();

        $data       = $this->params()->fromRoute();
        $productId  = $data['id'];

        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');
        $productDetailModel     = $this->getServiceLocator()->get('FrontProductDetailModel');
        $productPictureModel    = $this->getServiceLocator()->get('FrontProductPictureModel');
        $sizeModel              = $this->getServiceLocator()->get('FrontSizeModel');
        $model                  = $this->getServiceLocator()->get('FrontProductModel');

        $product            = $model->fetchRow($productId);
        $productsOther      = $model->getProductOther($product['product_category_id'], $product['product_id']);
        $productCategory    = $productCategoryModel->fetchRow($product['product_category_id']);
        $productDetails     = $productDetailModel->getAllByProduct($productId);
        $size               = $sizeModel->getAll();

        $sizeData = [];
        foreach($size as $v) {
            $sizeData[$v['size_id']] = $v;
        }

        $productPictureData = [];
        $productDetailsData = [];
        $productSizeData    = [];
        $productColorData    = [];
        foreach($productDetails as $v) {
            $productDetailsData[$v['product_detail_id']] = $v;

            $productPicture     = $productPictureModel->getAllByProductDetail($v['product_detail_id']);
            $productPictureData[$v['product_detail_id']] = $productPicture;

            $productSizeArr = explode(',', $v['size_id']);
            foreach($productSizeArr as $vv) {
                if(isset($sizeData[$vv])) {
                    $productSizeData[$v['product_detail_id']][$sizeData[$vv]['size_id']] = $sizeData[$vv];
                }
            }

            $productColorData[$v['product_detail_id']] = $v;
        }

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <a href="' . $this->url()->fromRoute('home-product-category', array('name' => $functions->formatTitle($productCategory['product_category_name']), 'id' => $productCategory['product_category_id'])) . '">' . $productCategory['product_category_name'] . '</a>
                            <span class="separator">»</span>
                            <span class="page-title">' . $product['product_name'] . '</span>
                        </div>';

        $view->setVariables([
            'product'       => $product,
            'productsOther' => $productsOther,
            'breadcrumbs'   => $breadcrumbs,
            'productDetails' => $productDetailsData,
            'productPicture' => $productPictureData,
            'productSize'   => $productSizeData,
            'productColor' => $productColorData,
            'size'          => $size,
        ]);

        return $view;
    }

    public function productAction()
    {
        $view = new ViewModel();

        return $view;
    }


}


