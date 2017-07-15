<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin;

use Admin\Model\ModelGateway;
use Zend\ModuleManager\Listener\ModuleLoaderListener;
use Zend\Mvc\MvcEvent;
use Zend\Authentication\AuthenticationService;

use Zend\Permissions\Acl\Acl;
use Zend\Permissions\Acl\Role\GenericRole as Role;
use Zend\Permissions\Acl\Resource\GenericResource as Resource;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'ModelGateway' => function($sm) {
                    return new ModelGateway($sm);
                }
            ),
        );
    }

    public function onBootstrap(MvcEvent $e)
    {
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleLoaderListener();
        $moduleRouteListener->attach($eventManager);

        $eventManager->attach('dispatch', function (MvcEvent $e) {
            $viewModel = $e->getApplication()->getMvcEvent()->getViewModel();
            $auth = new AuthenticationService();
            $groupMenuModel = $e->getApplication()->getServiceManager()->get('ModelGateway')->getModel('GroupMenu');
            $serverUrl = $e->getApplication()->getServiceManager()->get('ViewHelperManager')->get('serverUrl')->__invoke();

            $c = $e->getTarget();
            $match = $e->getRouteMatch();
            $controllerArr = explode('\\', $match->getParam('controller'));
            $controller = strtolower($controllerArr[2]);
            $module = strtolower($controllerArr[0]);

            if ($module == strtolower(__NAMESPACE__)) {
                if ($auth->hasIdentity()) {
                    $user = $auth->getIdentity();

                    /*
                     * Menu
                     */
                    $menu = $groupMenuModel->getGroupMenu($user->group_admin_id);

                    /*
                     * Get module title
                     */
                    $moduleTitle = $this->getModuleTitle($menu, $module, $controller);
                    $moduleCurrentTitle = $moduleTitle['currentTitle'];
                    $moduleCurrentUrl = $moduleTitle['currentUrl'];

                    /*
                     * Breadcrumb
                     */
                    $breadcrumbsHtml = $this->getBreadCrumb($serverUrl, $module, $menu, $controller, $moduleCurrentTitle);

                    $viewModel->menu = $menu;
                    $viewModel->user = $user;
                    $viewModel->moduleCurrentTitle = $moduleCurrentTitle;
                    $viewModel->breadcrumbsHtml = $breadcrumbsHtml;
                }

                $viewModel->controller_name = $controller;
            }
        }

        );
    }

    public function getModuleTitle($menu, $module, $controller) {
        foreach ($menu as $v) {
            if (str_replace('-', '', $v['menu_url']) == $module . '/' . $controller) {
                $moduleCurrentTitle = $v['menu_name'];
                $moduleCurrentUrl = $v['menu_url'];

                return ['currentTitle' => $moduleCurrentTitle, 'currentUrl' => $moduleCurrentUrl];
            }
        }
        return;
    }

    public function getBreadCrumb($serverUrl, $module, $menu, $controller, $moduleCurrentTitle)
    {

        $breadcrumbsHtml = '<div class="breadcrumbs"><ul>';
        $breadcrumbsHtml .= '<li><a href="' . $serverUrl . '/' . $module . '">' . ucfirst($module) . '</a></li>';

        foreach ($menu as $v) {
            if ($v['menu_parent'] == 0) {
                foreach ($menu as $vv) {

                    if ($vv['menu_parent'] == $v['menu_id']) {

                        if (str_replace('-', '', $vv['menu_url']) == $module . '/' . $controller) {
                            $breadcrumbModuleParentName = $v['menu_name'];

                            $breadcrumbModuleLevel2Name = $moduleCurrentTitle;
                            $breadcrumbModuleLevel2Url = $vv['menu_url'];

                            break;

                        } else {

                            foreach ($menu as $vvv) {
                                if ($vvv['menu_parent'] == $vv['menu_id']) {

                                    if (str_replace('-', '', $vvv['menu_url']) == $module . '/' . $controller) {
                                        $breadcrumbModuleParentName = $v['menu_name'];

                                        $breadcrumbModuleLevel2Name = $vv['menu_name'];
                                        $breadcrumbModuleLevel2Url = $vv['menu_url'];

                                        $breadcrumbModuleLevel3Name = $vvv['menu_name'];
                                        $breadcrumbModuleLevel3Url = $vvv['menu_url'];

                                        break;
                                    }
                                }
                            }
                        }
                    }

                }
            }
        }

        if ($breadcrumbModuleParentName != '') {
            $breadcrumbsHtml .= '<li><i class="icon-angle-right"></i><a href="#">' . $breadcrumbModuleParentName . '</a></li>';
        }
        if ($breadcrumbModuleLevel2Name != '') {
            $breadcrumbsHtml .= '<li><i class="icon-angle-right"></i><a href="' . $serverUrl . '/' . $breadcrumbModuleLevel2Url . '">' . $breadcrumbModuleLevel2Name . '</a></li>';
        }
        if ($breadcrumbModuleLevel3Name != '') {
            $breadcrumbsHtml .= '<li><i class="icon-angle-right"></i><a href="' . $serverUrl . '/' . $breadcrumbModuleLevel3Url . '">' . $breadcrumbModuleLevel3Name . '</a></li>';
        }
        $breadcrumbsHtml .= '</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div></div>';

        return $breadcrumbsHtml;
    }
}
