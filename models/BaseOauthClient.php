<?php

namespace app\models;

use yii\db\ActiveRecord;

/**
 * This is the model class for table "{{%oauth_clients}}".
 *
 * @property string $client_id
 * @property string $client_secret
 * @property string $redirect_uri
 * @property string $grant_types
 * @property string $scope
 * @property int $user_id
 *
 * @property OauthAccessToken[] $oauthAccessTokens
 * @property OauthAuthorizationCode[] $oauthAuthorizationCodes
 * @property OauthRefreshToken[] $oauthRefreshTokens
 */
class BaseOauthClient extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%oauth_clients}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['client_id', 'redirect_uri', 'grant_types'], 'required'],
            [['user_id'], 'integer'],
            [['client_id', 'client_secret'], 'string', 'max' => 32],
            [['redirect_uri'], 'string', 'max' => 1000],
            [['scope'], 'string', 'max' => 2000],
            [['client_id'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'client_id' => 'Client ID',
            'client_secret' => 'Client Secret',
            'redirect_uri' => 'Redirect Uri',
            'grant_types' => 'Grant Types',
            'scope' => 'Scope',
            'user_id' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOauthAccessTokens()
    {
        return $this->hasMany(OauthAccessToken::className(), ['client_id' => 'client_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOauthAuthorizationCodes()
    {
        return $this->hasMany(OauthAuthorizationCode::className(), ['client_id' => 'client_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOauthRefreshTokens()
    {
        return $this->hasMany(OauthRefreshToken::className(), ['client_id' => 'client_id']);
    }
}
