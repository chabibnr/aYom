<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model app\models\OauthClient */
/* @var $form yii\widgets\ActiveForm */

$model->grant_types = explode(" ", $model->grant_types);
?>

<div class="oauth-client-form panel panel-default">
    <div class="panel-body">
        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'client_id')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'client_secret')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'redirect_uri')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'grant_types')->widget(Select2::className(), [
            'data' => [
                'client_credentials' => 'client_credentials',
                'authorization_code' => 'authorization_code',
                'password' => 'password',
                'implicit' => 'implicit'
            ],
            'options' => [
                'multiple' => true
            ]
        ]);
        //->textInput(['maxlength' => true])  ?>

        <div class="form-group">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>
    </div>
</div>
