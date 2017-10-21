<?php

namespace app\modules\admin;

/**
 * admin module definition class
 */
class Module extends \yii\base\Module
{
    /**
     * @inheritdoc
     */
    public $controllerNamespace = 'app\modules\admin\controllers';

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();

        /*
        $this->modules = [
            'mimin' => [
                'class' => '\hscstudio\mimin\Module',
            ]
        ]; */
        // custom initialization code goes here
    }
}
