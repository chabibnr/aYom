<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/7/2017
 * Time: 10:42 AM
 */

namespace app\modules\api\controllers;

use app\modules\api\ApiController;

class UserController extends ApiController
{
    public $modelClass = 'app\modules\api\models\User';

    public function actionAbc(){
        return['oke' => true];
    }
}