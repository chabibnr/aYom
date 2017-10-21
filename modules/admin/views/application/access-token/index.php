<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\OauthAccessTokenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Oauth Access Tokens';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="oauth-access-token-index">

    <?= GridView::widget([
        'panel' => [
            'type' => GridView::TYPE_PRIMARY
        ],
        'toolbar' =>  [
            ['content'=>Html::a('Create Access Token', ['create'], ['class' => 'btn btn-success'])],
            '{export}',
            '{toggleData}'
        ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'access_token',
            'client_id',
            'user_id',
            'expires',
            'scope',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
