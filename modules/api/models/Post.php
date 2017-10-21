<?php
/**
 * Created by PhpStorm.
 * User: Butterfly
 * Date: 10/7/2017
 * Time: 11:47 AM
 */

namespace app\modules\api\models;


use app\models\BasePost;

class Post extends BasePost
{

    public function fields()
    {
        $fields = parent::fields();
        unset($fields['created_by'], $fields['updated_by']);
        return $fields;
    }

    public function extraFields()
    {
        return [
            'author',
            'categories'
        ];
    }

    public function getCategories()
    {
        return parent::getCategories()->select(['id','name','slug']);
    }

    public function getAuthor(){
        return parent::getCreatedBy()->select(['id','display_name']);
    }
}