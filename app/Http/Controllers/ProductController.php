<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Supplier;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $results = Product::filterBySearchQuery($request->search_query)->simplePaginate();

        $search_query = $request->search_query;

        $view_data = compact('results', 'search_query');

        return view('pages.product.index', $view_data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $suppliers = Supplier::all();

        $view_data = compact('suppliers');

        return view('pages.product.create', $view_data);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:500',
            'price' => 'required|numeric|min:0.01',
            'stock' => 'required|integer|min:0',
            'suppliers' => 'required|array|min:1',
            'suppliers.*' => 'exists:suppliers,id',
        ], [
            'name.required' => 'O campo Nome é obrigatório.',
            'name.string' => 'O campo Nome deve ser uma string.',
            'name.max' => 'O campo Nome deve ter no máximo 255 caracteres.',
            'description.required' => 'O campo Descrição é obrigatório.',
            'description.string' => 'O campo Descrição deve ser uma string.',
            'description.max' => 'O campo Descrição deve ter no máximo 500 caracteres.',
            'price.required' => 'O campo Preço é obrigatório.',
            'price.numeric' => 'O campo Preço deve ser um número.',
            'price.min' => 'O Preço deve ser maior que zero.',
            'stock.required' => 'O campo Estoque é obrigatório.',
            'stock.integer' => 'O campo Estoque deve ser um número inteiro.',
            'stock.min' => 'O campo Estoque deve ser maior ou igual a zero.',
            'suppliers.required' => 'É necessário selecionar pelo menos um fornecedor.',
            'suppliers.array' => 'O campo Fornecedores deve ser um array.',
            'suppliers.*.exists' => 'O fornecedor selecionado é inválido.',
        ]);

        $product = Product::create([
            'name' => $validated['name'],
            'description' => $validated['description'],
            'price' => $validated['price'],
            'stock' => $validated['stock'],
        ]);

        $product->suppliers()->attach($validated['suppliers']);

        return redirect()->route('product.index')->with('success', 'Produto criado com sucesso!');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        $suppliers = Supplier::all();

        $view_data = compact('product', 'suppliers');

        return view('pages.product.edit', $view_data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:500',
            'price' => 'required|numeric|min:0.01',
            'stock' => 'required|integer|min:0',
            'suppliers' => 'required|array|min:1',
            'suppliers.*' => 'exists:suppliers,id',
        ], [
            'name.required' => 'O campo Nome é obrigatório.',
            'name.string' => 'O campo Nome deve ser uma string.',
            'name.max' => 'O campo Nome deve ter no máximo 255 caracteres.',
            'description.required' => 'O campo Descrição é obrigatório.',
            'description.string' => 'O campo Descrição deve ser uma string.',
            'description.max' => 'O campo Descrição deve ter no máximo 500 caracteres.',
            'price.required' => 'O campo Preço é obrigatório.',
            'price.numeric' => 'O campo Preço deve ser um número.',
            'price.min' => 'O Preço deve ser maior que zero.',
            'stock.required' => 'O campo Estoque é obrigatório.',
            'stock.integer' => 'O campo Estoque deve ser um número inteiro.',
            'stock.min' => 'O campo Estoque deve ser maior ou igual a zero.',
            'suppliers.required' => 'É necessário selecionar pelo menos um fornecedor.',
            'suppliers.array' => 'O campo Fornecedores deve ser um array.',
            'suppliers.*.exists' => 'O fornecedor selecionado é inválido.',
        ]);

        $product->update([
            'name' => $validated['name'],
            'description' => $validated['description'],
            'price' => $validated['price'],
            'stock' => $validated['stock'],
        ]);

        $product->suppliers()->sync($validated['suppliers']);

        return redirect()->route('product.index')->with('success', 'Produto atualizado com sucesso.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Product::whereIn('id', $request->id_list)->delete();

        return redirect('/product');
    }

    public function confirmDelete(Request $request): View
    {
        $id_list = $request->id_list;

        $view_data = compact('id_list');

        return view('pages.product.delete', $view_data);
    }
}
