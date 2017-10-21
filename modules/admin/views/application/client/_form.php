<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\OauthClient */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="oauth-client-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'client_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_secret')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'redirect_uri')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'grant_types')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'scope')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
