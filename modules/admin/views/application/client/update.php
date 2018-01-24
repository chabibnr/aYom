<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\OauthClient */

$this->title = 'Update Oauth Client';
$this->params['breadcrumbs'][] = ['label' => 'Oauth Clients', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->client_id, 'url' => ['view', 'id' => $model->client_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="oauth-client-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
