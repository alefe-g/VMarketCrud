<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Supplier extends Model
{
    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'company_name',
        'document',
    ];

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class);
    }

    public function scopeFilterBySearchQuery($query, string|null $search_query): void
    {
        if ($search_query) {
            $query->whereLike('name', "%{$search_query}%");
        }
    }
}
