<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\OauthAccessToken */

$this->title = 'Update Oauth Access Token: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => 'Oauth Access Tokens', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->access_token, 'url' => ['view', 'id' => $model->access_token]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="oauth-access-token-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
