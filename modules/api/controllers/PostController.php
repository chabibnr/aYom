<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/7/2017
 * Time: 11:46 AM
 */

namespace app\modules\api\controllers;

use app\modules\api\ApiController;

class PostController extends ApiController
{
    public function publicAccess()
    {
        return ['index', 'view'];
    }

    public $modelClass = 'app\modules\api\models\Post';
}