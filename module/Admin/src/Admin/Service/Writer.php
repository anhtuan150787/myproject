<?php
namespace Admin\Service;

use Zend\Log\Logger;
use Zend\Log\Writer\Stream;
use Zend\Log\Formatter\Simple;

class Writer
{
    private $logger;

    public function write($msg, $type = 'INFO')
    {
        $writerConfig = include 'config/writer.php';

        $formatter  = new Simple($writerConfig['format']);

        $writer     = new Stream($writerConfig['path'] . '/' . $writerConfig['file_name'] . '.txt');
        $writer->setFormatter($formatter);

        $this->logger = new Logger();
        $this->logger->addWriter($writer);

        switch($type) {
            case 'INFO':
                $this->info($msg);
                break;

            case 'ERR':
                $this->err($msg);
                break;

            default:
                break;
        }
    }

    public function info($msg)
    {
        $this->logger->info($msg);
    }

    public function err($msg)
    {
        $this->logger->err($msg);
    }
}