<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $results = Supplier::filterBySearchQuery($request->search_query)->simplePaginate();

        $search_query = $request->search_query;

        $view_data = compact('results', 'search_query');

        return view('pages.supplier.index', $view_data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        return view('pages.supplier.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:suppliers,email',
            'phone' => 'required|regex:/^\(\d{2}\) \d{5}-\d{4}$/',
            'address' => 'required|string|max:255|min:5',
            'company_name' => 'required|string|max:255',
            'document' => 'required|unique:suppliers,document|regex:/^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/',
        ], [
            'name.required' => 'O campo nome é obrigatório.',
            'name.string' => 'O campo nome é inválido',
            'name.max' => 'O campo nome deve ter no máximo 255 caracteres',
            'email.required' => 'O campo email é obrigatório.',
            'email.email' => 'O email fornecido não é válido.',
            'email.unique' => 'Já existe um fornecedor com esse email.',
            'phone.required' => 'O campo telefone é obrigatório.',
            'phone.regex' => 'O campo telefone deve ter o formato (XX) XXXXX-XXXX',
            'address.required' => 'O campo endereço é obrigatório.',
            'address.max' => 'O campo endereço não deve ter no máximo 255 caracteres',
            'address.min' => 'O campo endereço é inválido',
            'company_name.required' => 'O campo razão social é obrigatório.',
            'document.required' => 'O campo CNPJ é obrigatório.',
            'document.unique' => 'Já existe um fornecedor com esse CNPJ.',
            'document.regex' => 'O CNPJ deve ser válido',
        ]);

        Supplier::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'company_name' => $request->company_name,
            'document' => $request->document,
        ]);

        return redirect()->route('supplier.index')->with('success', 'Fornecedor criado com sucesso.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Supplier $supplier): View
    {
        $view_data = compact('supplier');

        return view('pages.supplier.edit', $view_data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Supplier $supplier): RedirectResponse
    {
        $validated_data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => [
                'required',
                'email',
                Rule::unique('suppliers', 'email')->ignore($supplier->id),
            ],
            'phone' => 'required|regex:/^\(\d{2}\) \d{5}-\d{4}$/',
            'address' => 'required|string|max:255|min:5',
            'company_name' => 'required|string|max:255',
            'document' => [
                'required',
                Rule::unique('suppliers', 'document')->ignore($supplier->id),
                'regex:/^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/',
            ],
        ], [
            'name.required' => 'O campo nome é obrigatório.',
            'name.string' => 'O campo nome é inválido',
            'name.max' => 'O campo nome deve ter no máximo 255 caracteres',
            'email.required' => 'O campo email é obrigatório.',
            'email.email' => 'O email fornecido não é válido.',
            'email.unique' => 'Já existe um fornecedor com esse email.',
            'phone.required' => 'O campo telefone é obrigatório.',
            'phone.regex' => 'O campo telefone deve ter o formato (XX) XXXXX-XXXX',
            'address.required' => 'O campo endereço é obrigatório.',
            'address.max' => 'O campo endereço não deve ter no máximo 255 caracteres',
            'address.min' => 'O campo endereço é inválido',
            'company_name.required' => 'O campo razão social é obrigatório.',
            'document.required' => 'O campo CNPJ é obrigatório.',
            'document.unique' => 'Já existe um fornecedor com esse CNPJ.',
            'document.regex' => 'O CNPJ deve ser válido',
        ]);

        $supplier->update($validated_data);

        return redirect()->route('supplier.index')->with('success', 'Fornecedor atualizado com sucesso.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Supplier::whereIn('id', $request->id_list)->delete();

        return redirect('/supplier');
    }

    public function confirmDelete(Request $request): View
    {
        $id_list = $request->id_list;

        $view_data = compact('id_list');

        return view('pages.supplier.delete', $view_data);
    }
}
