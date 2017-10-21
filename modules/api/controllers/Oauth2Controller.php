<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/11/2017
 * Time: 1:14 PM
 */

namespace app\modules\api\controllers;


use filsh\yii2\oauth2server\controllers\RestController;
use OAuth2\Request;
use Yii;

class Oauth2Controller extends RestController
{
    public function behaviors()
    {
        $module = Yii::$app->getModule('oauth2');
        $module->set('request', Request::createFromGlobals());
        $this->module = $module;
        return parent::behaviors();
    }

}