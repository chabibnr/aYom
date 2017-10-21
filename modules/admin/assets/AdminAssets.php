<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/2/2017
 * Time: 3:57 PM
 */

namespace app\modules\admin\assets;


use yii\web\AssetBundle;

class AdminAssets extends AssetBundle
{
   // public $basePath = '';
    public $sourcePath = '@app/modules/admin/sources/react/build';
    //public $baseUrl = '';
    public $css = [];
    public $js = [
        'react.js',
        'react-dom.js'
    ];
}