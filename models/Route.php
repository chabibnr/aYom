<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/5/2017
 * Time: 1:50 PM
 */

namespace app\models;

use yii\db\ActiveQuery;

/**
 * Class Route
 * @package app\models
 * @property Route $childRoute
 */

class Route extends \hscstudio\mimin\models\Route
{

    /**
     * @return static[] | array|\yii\db\ActiveRecord[]
     */
    public static function getAllTypeActiveRoute(){
        return static::find()
            ->with('childRoute')
            ->select('type')->distinct()->where(['status' => 1])->all();
    }

    /**
     * @return ActiveQuery
     */
    public function getChildRoute(){
        return $this->hasMany(static::className(),['type' => 'type'])->where(['status' => 1]);
    }
}