<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';

    public $timestamps = false;

    protected $fillable = [
        'name',
        'description',
        'price'
    ];
    
    use HasFactory;
}
