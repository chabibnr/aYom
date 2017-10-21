<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/7/2017
 * Time: 10:40 AM
 */

namespace app\modules\api;

use yii\helpers\ArrayHelper;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;
use filsh\yii2\oauth2server\filters\ErrorToExceptionFilter;
use app\modules\api\filters\auth\CompositeAuth;
use yii\rest\ActiveController;

class ApiController extends ActiveController
{

    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];

    public function publicAccess(){
        return [];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        $auth = [];
        if((is_array($this->publicAccess()) && !in_array($this->action->id, $this->publicAccess())) OR (is_string($this->publicAccess()) && '*' !== $this->publicAccess())){
            $auth = [
                'authenticator' => [
                    'class' => CompositeAuth::className(),
                    'authMethods' => [
                        ['class' => HttpBearerAuth::className()],
                        ['class' => QueryParamAuth::className(), 'tokenParam' => 'accessToken'],
                    ]
                ],
                'exceptionFilter' => [
                    'class' => ErrorToExceptionFilter::className()
                ],
            ];
        }
        return ArrayHelper::merge(parent::behaviors(), $auth );
    }

    public function init()
    {
        parent::init();
        \Yii::$app->user->enableSession = false;
    }

}