<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%post_category}}".
 *
 * @property int $post_id
 * @property int $category_id
 *
 * @property BasePost $post
 * @property BaseCategory $category
 */
class BasePostCategory extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%post_category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_id', 'category_id'], 'required'],
            [['post_id', 'category_id'], 'integer'],
            [['post_id', 'category_id'], 'unique', 'targetAttribute' => ['post_id', 'category_id']],
            [['post_id'], 'exist', 'skipOnError' => true, 'targetClass' => BasePost::className(), 'targetAttribute' => ['post_id' => 'id']],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => BaseCategory::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'post_id' => 'Post ID',
            'category_id' => 'Category ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPost()
    {
        return $this->hasOne(BasePost::className(), ['id' => 'post_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(BaseCategory::className(), ['id' => 'category_id']);
    }
}
