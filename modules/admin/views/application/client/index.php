<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\OauthClientSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Oauth Clients';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="oauth-client-index">
    <?= GridView::widget([
        'panel' => [
            'type' => GridView::TYPE_PRIMARY
        ],
        'toolbar' =>  [
            ['content'=>Html::a('Create Oauth Client', ['create'], ['class' => 'btn btn-success'])],
            '{export}',
            '{toggleData}'
        ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'client_id',
            'client_secret',
            'redirect_uri',
            'grant_types',
            'scope',
            //'user_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
