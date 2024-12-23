<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Product extends Model
{
    protected $fillable = [
        'name',
        'description',
        'price',
        'stock',
    ];

    public function suppliers(): BelongsToMany
    {
        return $this->belongsToMany(Supplier::class);
    }

    public function scopeFilterBySearchQuery($query, string|null $search_query): void
    {
        if ($search_query) {
            $query->where(function ($query) use($search_query): void{
                $query->whereLike('name', "%{$search_query}%");
                $query->orWhereHas(
                    'suppliers',
                    fn($query) => $query->whereLike('suppliers.name', "%{$search_query}%"),
                );
            });
        }
    }
}
