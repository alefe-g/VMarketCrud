@extends('_layout.app')

@section('content')
<div class="row mt-2 pb-5">
  <div class="col-12">
    <h2>Editar Produto</h2>
  </div>

  <div class="col-12">
    <form action="{{ route('product.update', $product->id) }}" class="mt-3" method="post">
      @csrf
      @method('PUT') <!-- Método para update no Laravel -->

      <div class="mb-3">
        <label for="name" class="form-label">Nome</label>
        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name"
          value="{{ old('name', $product->name) }}" required>
        @error('name')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
      </div>

      <div class="mb-3">
        <label for="description" class="form-label">Descrição</label>
        <input type="text" class="form-control @error('description') is-invalid @enderror" id="description"
          name="description" value="{{ old('description', $product->description) }}" required>
        @error('description')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
      </div>

      <div class="mb-3">
        <label for="price" class="form-label">Preço</label>
        <input type="number" class="form-control @error('price') is-invalid @enderror" id="price" name="price"
          value="{{ old('price', $product->price) }}" required>
        @error('price')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
      </div>

      <div class="mb-3">
        <label for="stock" class="form-label">Estoque</label>
        <input type="number" class="form-control @error('stock') is-invalid @enderror" id="stock" name="stock"
          value="{{ old('stock', $product->stock) }}" required>
        @error('stock')
        <div class="invalid-feedback">{{ $message }}</div>
        @enderror
      </div>

      <hr>

      <div>
        <label for="suppliers">Selecione os Fornecedores vinculados</label>
        <div class="row mt-3">
          @foreach ($suppliers as $supplier)
          <div class="col-3">
            <div class="d-flex gap-2">
              <input type="checkbox" value="{{ $supplier->id }}" name="suppliers[]" id="{{ $supplier->company_name }}"
                class="text-wrap" 
                @if(in_array($supplier->id, $product->suppliers->pluck('id')->toArray())) checked @endif>
              <label for="{{ $supplier->company_name }}">{{ $supplier->name }}</label>
            </div>
          </div>
          @endforeach
        </div>
      </div>

      <div class="d-flex flex-row-reverse gap-2 mt-3">
        <button type="submit" class="btn btn-primary">
          Atualizar Produto
        </button>

        <a href="{{ url('/product') }}" class="btn btn-danger">
          Cancelar
        </a>
      </div>
    </form>
  </div>
</div>
@endsection
