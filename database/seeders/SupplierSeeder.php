<?php

namespace Database\Seeders;

use Database\Factories\SupplierFactory;
use Illuminate\Database\Seeder;

class SupplierSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        SupplierFactory::new()->count(40)->create();
    }
}
