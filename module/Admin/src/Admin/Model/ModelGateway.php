<?php
namespace Admin\Model;

class ModelGateway {

    private $services;

    public function __construct($services)
    {
        $this->services = $services;
    }

    public function getModel($model) {
        $modelCLass = 'Admin\Model' . '\\' . $model;
        return new $modelCLass($this->services);
    }

}