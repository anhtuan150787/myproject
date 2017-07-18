<?php
namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Admin\Form\Page;
use Admin\Controller\MasterController;

class PostGetController extends MasterController
{
    private $module = 'post-get';

    public function indexAction()
    {
        $view = new ViewModel();

        $postGetConfig = include 'config/post.get.php';

        $view->setVariables(['records' => $postGetConfig, 'module' => $this->module]);
        return $view;
    }

    public function outsiteAction()
    {
        $domain     = $this->params()->fromPost('domain');
        $url        = $this->params()->fromPost('url');
        $category   = $this->params()->fromPost('category');

        $domainArr = explode('.', $domain);

        $data = $this->parse($url);

        foreach($data as $v) {
            $this->saveData($v, $category);
        }

        return $this->response;
    }

    public function parse($url)
    {
        $serverUrl = $this->getServiceLocator()->get('ViewHelperManager')->get('serverUrl')->__invoke();

        include 'public/simple_html_dom/simple_html_dom.php';

        $dataPostGet   = array();

        $html = $this->getContent($url);
        $xml  = new \SimpleXMLElement($html);

        $i = 0;
        foreach($xml->channel->item as $v) {

            $result_curl    = $this->getContent(urldecode($v->link));
            $htmlDom        = str_get_html($result_curl);

            $dataPostGet[$i]['link']        = $v->link;
            $dataPostGet[$i]['title']       = (string) trim(strip_tags($htmlDom->find('div[class=title_news]', 0)->innertext));
            $dataPostGet[$i]['description'] = (string) trim(strip_tags($htmlDom->find('div[class=short_intro txt_666], h3[class=short_intro txt_666]', 0)->innertext));
            $dataPostGet[$i]['body']        = (string) trim($htmlDom->find('div[class=fck_detail width_common block_ads_connect], div[class=block_ads_connect block_content_slide_showdetail]', 0)->innertext);
            $dataPostGet[$i]['picture']     = '';

            if ($dataPostGet[$i]['body'] != '') {
                $htmlBody   = str_get_html($dataPostGet[$i]['body']);
                $avatar     = (string) $htmlBody->find('img', 0)->src;

                $dataPostGet[$i]['picture'] = $this->saveImage($avatar);

                foreach($htmlBody->find('img') as $img) {
                    $fileName       = $this->saveImage($img->src);
                    $img->outertext = '<div style="text-align: center"><img src="/pictures/news/' . $fileName . '" /></div>';
                }
                $dataPostGet[$i]['body'] = $htmlBody->outertext;
            }

            $i++;
        }

        return $dataPostGet;
    }

    public function saveData($data, $category)
    {
        $postModel = $this->getServiceLocator()->get('ModelGateway')->getModel('News');

//        $params = array();
//        $params['title']        = $data['title'];
//        $params['description']  = $data['description'];
//        $params['body']         = $data['body'];
//        $params['link']         = $data['link'];
//        $params['type']         = 'out';
//        $params['picture']      = $data['picture'];
//        $params['category']     = $category;
//        $params['status']       = 1;

        $input = [];
        $input['news_category_id'] = $this->params()->fromPost('news_category_id');
        $input['news_title'] = $data['title'];
        $input['news_quote'] = $data['description'];
        $input['news_content'] = $data['body'];
        $input['news_status'] = 1;
        $input['news_picture'] = $data['picture'];

        if ($input['news_title'] != '' && $input['news_content'] != '') {
            $postModel->save($input);
        }
    }

    public function getContent($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        $result_curl = curl_exec($curl);
        $status_curl = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);

        return $result_curl;
    }

    public function saveImage($avatar)
    {
        if ($avatar != '') {
            $arr_image = explode('/', $avatar);

            $file_extension = strtolower(substr(strrchr(array_pop($arr_image), "."), 1));

            $path = 'public/pictures/news/';
            $file_name = time() . rand() . '.' . $file_extension;

            $curl = curl_init($avatar);
            $fp = fopen($path . $file_name, 'wb');
            curl_setopt($curl, CURLOPT_FILE, $fp);
            curl_setopt($curl, CURLOPT_HEADER, 0);
            curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
            curl_exec($curl);
            $status_curl = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            curl_close($curl);
            fclose($fp);

            if ($status_curl != 200) {
                return $avatar;
            }
            return $file_name;
        }
    }
}