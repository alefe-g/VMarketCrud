@extends('_layout.app')

@section('content')
<div class="row mt-2">
  <div class="col-12">
    <h2 class="text-danger text-center w-100">
      Remover produtos
    </h2>
  </div>

  <div class="col-12">
    <p class="text-center w-100">
      Tem certeza que deseja efetuar a operação?
    </p>
  </div>

  <div class="col-12">
    <div class="d-flex justify-content-center w-100 mt-2">
      <form action="{{ url('/product') }}" method="post">
        @csrf
        @method('delete')

        @foreach ($id_list as $id)
          <input type="hidden" name="id_list[]" value="{{ $id }}">
        @endforeach

        <button class="btn btn-danger" type="submit">
          Remover
        </button>
        
        <a href="{{ url('/product') }}" class="btn btn-secondary">Cancelar</a>
      </form>
    </div>
  </div>
</div>
@endsection