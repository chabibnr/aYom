<?php
/**
 * @author : Chabib Nurozak <chabibnurozak@gmail.com>
 * @website: chabibnr.net
 * @created: 9/28/2017
 * @file   : oauth2.php
 */

return[
    'class' => 'filsh\yii2\oauth2server\Module',
    'tokenParamName' => 'accessToken',
    'tokenAccessLifetime' => 3600 * 24,
    'storageMap' => [
        'user_credentials' => 'app\models\User',
    ],
    'grantTypes' => [
        'user_credentials' => [
            'class' => 'OAuth2\GrantType\UserCredentials',
        ],
        'refresh_token' => [
            'class' => 'OAuth2\GrantType\RefreshToken',
            'always_issue_new_refresh_token' => true
        ]
    ]
];