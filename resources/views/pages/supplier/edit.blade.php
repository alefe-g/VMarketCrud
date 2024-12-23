@extends('_layout.app')

@section('content')
<div class="row">
  <div class="col-12">
    <h2>Criar Novo Fornecedor</h2>
  </div>

  <div class="col-12">
    <form class="mt-4" action="{{ route('supplier.update', ['supplier' => $supplier->id]) }}" method="post">
      @csrf
      @method('put')

      <div class="mb-3">
        <label for="name" class="form-label">Nome</label>
        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name"
          value="{{ $supplier?->name ?? old('name') }}" required>
        @error('name')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email"
          value="{{ $supplier?->email ?? old('email') }}" required>
        @error('email')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
      </div>

      <div class="mb-3">
        <label for="phone" class="form-label">Telefone</label>
        <input type="text" class="form-control @error('phone') is-invalid @enderror" id="phone" name="phone"
          value="{{ $supplier?->phone ?? old('phone') }}" required>
        @error('phone')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
      </div>

      <div class="mb-3">
        <label for="address" class="form-label">Endereço</label>
        <input type="text" class="form-control @error('address') is-invalid @enderror" id="address" name="address"
          value="{{ $supplier?->address ?? old('address') }}" required>
        @error('address')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
      </div>

      <div class="mb-3">
        <label for="company_name" class="form-label">Razão Social</label>
        <input type="text" class="form-control @error('company_name') is-invalid @enderror" id="company_name"
          name="company_name" value="{{ $supplier?->company_name ?? old('company_name') }}" required>
        @error('company_name')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
      </div>

      <div class="mb-4">
        <label for="document" class="form-label">CNPJ</label>
        <input type="text" class="form-control @error('document') is-invalid @enderror" id="document" name="document"
          value="{{ $supplier?->document ?? old('document') }}" required>
        @error('document')
      <div class="invalid-feedback">{{ $message }}</div>
    @enderror
      </div>

      <div class="d-flex flex-row-reverse gap-2">
        <button type="submit" class="btn btn-primary">
          Atualizar Fornecedor
        </button>

        <a href="{{ url('/supplier') }}" class="btn btn-danger">
          Cancelar
        </a>
      </div>
    </form>
  </div>
</div>
@endsection

@section('scripts')
<script type="module">
  $(document).ready(function () {
    $('#phone').mask('(00) 00000-0000');

    $('#document').mask('00.000.000/0000-00');
  });
</script>
@endsection