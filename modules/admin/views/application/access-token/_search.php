<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\OauthAccessTokenSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="oauth-access-token-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'access_token') ?>

    <?= $form->field($model, 'client_id') ?>

    <?= $form->field($model, 'user_id') ?>

    <?= $form->field($model, 'expires') ?>

    <?= $form->field($model, 'scope') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
