<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\OauthAccessToken */

$this->title = 'Create Oauth Access Token';
$this->params['breadcrumbs'][] = ['label' => 'Oauth Access Tokens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="oauth-access-token-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
