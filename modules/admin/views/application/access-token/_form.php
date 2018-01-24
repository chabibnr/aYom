<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\OauthAccessToken */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="oauth-access-token-form panel panel-default">
    <div class="panel-body">
        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'access_token')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'client_id')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'user_id')->textInput() ?>

        <?= $form->field($model, 'expires')->textInput() ?>

        <?= $form->field($model, 'scope')->textInput(['maxlength' => true]) ?>

        <div class="form-group">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
