<?php
namespace Admin\Service;

use Zend\Cache\StorageFactory;

class Cache  {

    private $cache;
    private $configs;

    public function __construct() {
        $this->setConfigs();
    }

    public function getCache() {
        $this->cache = StorageFactory::factory($this->configs);
    }

    public function setConfigs($configs = null) {
        if ($configs == null) {
            $config = include 'config/cache.php';
            $cacheType = 'file';
            $this->configs = $config[$cacheType];
        } else {
            $this->configs = $configs;
        }
        return $this;
    }

    public function getConfigs() {
        return $this->configs;
    }

    public function setNameSpace($nameSpace) {
        $this->configs['options']['namespace'] = $nameSpace;

        return $this;
    }

    public function checkItem($key) {
        $this->getCache();

        return $this->cache->hasItem($key);
    }

    public function set($key, $value) {
        $this->getCache();

        if ($this->cache->hasItem($key)) {
            $this->cache->replaceItem($key, $value);
        } else {
            $this->cache->setItem($key, $value);
        }

        return $this;
    }

    public function get($key) {
        $this->getCache();

        if ($this->cache->hasItem($key)) {
            return $this->cache->getItem($key);
        }
        return null;
    }

    public function clear($key) {
        $this->getCache();

        $this->cache->removeItem($key);
    }

    public function clearByNameSpace() {
        $this->getCache();

        $this->cache->clearByNamespace($this->configs['options']['namespace']);
    }
}