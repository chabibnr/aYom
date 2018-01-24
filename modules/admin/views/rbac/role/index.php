<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\modules\administrator\models\AuthItemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Roles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="auth-item-index">
	<?php
    echo GridView::widget([
        'panel' => [
            'type' => GridView::TYPE_PRIMARY
        ],
        'toolbar' => [
            ['content' => Html::a('Create Role', ['create'], ['class' => 'btn btn-success'])],
            '{export}',
            '{toggleData}'
        ],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            'description:ntext',
            /*
            'type',
            'description:ntext',
            'rule_name',
            'data:ntext',
            // 'created_at',
            // 'updated_at',
            */
            [
                'options' => [
                    'width' => '80px',
                ],
                'class' => 'yii\grid\ActionColumn'
            ],
        ],
    ]);?>

</div>
