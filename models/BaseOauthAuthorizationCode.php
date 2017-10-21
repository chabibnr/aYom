<?php

namespace app\models;

use yii\db\ActiveRecord;

/**
 * This is the model class for table "{{%oauth_authorization_codes}}".
 *
 * @property string $authorization_code
 * @property string $client_id
 * @property int $user_id
 * @property string $redirect_uri
 * @property string $expires
 * @property string $scope
 *
 * @property OauthClient $client
 */
class BaseOauthAuthorizationCode extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%oauth_authorization_codes}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['authorization_code', 'client_id', 'redirect_uri'], 'required'],
            [['user_id'], 'integer'],
            [['expires'], 'safe'],
            [['authorization_code'], 'string', 'max' => 40],
            [['client_id'], 'string', 'max' => 32],
            [['redirect_uri'], 'string', 'max' => 1000],
            [['scope'], 'string', 'max' => 2000],
            [['authorization_code'], 'unique'],
            [['client_id'], 'exist', 'skipOnError' => true, 'targetClass' => OauthClient::className(), 'targetAttribute' => ['client_id' => 'client_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'authorization_code' => 'Authorization Code',
            'client_id' => 'Client ID',
            'user_id' => 'User ID',
            'redirect_uri' => 'Redirect Uri',
            'expires' => 'Expires',
            'scope' => 'Scope',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(OauthClient::className(), ['client_id' => 'client_id']);
    }
}
