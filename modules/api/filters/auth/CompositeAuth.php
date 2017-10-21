<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/9/2017
 * Time: 1:59 PM
 */

namespace app\modules\api\filters\auth;
use filsh\yii2\oauth2server\Module;

class CompositeAuth extends \yii\filters\auth\CompositeAuth
{
    /**
    * @inheritdoc
    */
    public function beforeAction($action)
    {
        $server = Module::getInstance()->getServer();
        $server->verifyResourceRequest(\OAuth2\Request::createFromGlobals());

        return parent::beforeAction($action);
    }

}