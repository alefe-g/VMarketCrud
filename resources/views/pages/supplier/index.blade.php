@extends('_layout.app')

@section('content')
<div class="row">
  <div class="col-12">
    <h2>Fornecedores</h2>

  </div>

  <div class="col-12">
    <div class="d-flex justify-content-end">
      <a href="{{ url('/supplier/create') }}" class="btn btn-primary">
        Criar Novo +
      </a>
    </div>
  </div>

  <div class="col-12">
    <form action="" class="mt-2">
      <div class="row">
        <div class="col-11">
          <label for="search_query" class="form-label">Procure por um nome</label>
          <input type="text" class="form-control" id="search_query" name="search_query"
            value="{{ $search_query ?? '' }}">
        </div>

        <div class="col-1">
          <div class="d-flex flex-column-reverse h-100">
            <button type="submit" class="btn btn-primary">
              Procurar
            </button>
          </div>
        </div>
      </div>
    </form>
  </div>

  <div class="col-12">
    <table class="table mt-4">
      <thead>
        <tr>
          <th>
            <input type="checkbox">
          </th>
          <th>Nome</th>
          <th>Razão Social</th>
          <th>CNPJ</th>
          <th>Ações</th>
        </tr>
      </thead>

      <tbody>
        @if ($results)
      @foreach ($results as $supplier)
      <tr>
      <td>
      <input type="checkbox" data-id="{{ $supplier->id }}">
      </td>

      <td>
      {{ $supplier->name }}
      </td>

      <td>
      {{ $supplier->company_name }}
      </td>

      <td>
      {{ $supplier->document }}
      </td>

      <td>
      <div class="d-flex gap-2">
        <a href="{{ url("/supplier/remove/confirmation?id_list[]={$supplier->id}") }}">Remover</a>
        |
        <a href="{{ url("/supplier/{$supplier->id}/edit") }}">
        Editar
        </a>
      </div>
      </td>
      </tr>
    @endforeach
    @endif
      </tbody>
    </table>
  </div>

  <div class="col-12 mt-2">
    <div class="d-flex flex-row-reverse">
      <button id="delete-selected" class="btn btn-danger" style="display: none">
        Excluir Selecionados
      </button>
    </div>
  </div>

  <div class="mb-5">
    {{ $results->appends(['search_query' => request('search_query')])->links() }}
  </div>
</div>
@endsection

@section('scripts')
<script type="module">
  $(document).ready(function () {
    const deleteButton = $("#delete-selected");
    const tableCheckboxes = $("tbody input[type='checkbox']");
    const selectAllCheckbox = $("thead input[type='checkbox']");
    let selectedIds = [];

    function updateDeleteButton() {
      if (selectedIds.length > 0) {
        deleteButton.show();
      } else {
        deleteButton.hide();
      }
    }

    selectAllCheckbox.on("change", function () {
      const isChecked = $(this).is(":checked");
      tableCheckboxes.prop("checked", isChecked);
      selectedIds = isChecked
        ? tableCheckboxes.map((_, el) => $(el).data("id")).get()
        : [];
      console.log(tableCheckboxes);
      updateDeleteButton();
    });

    tableCheckboxes.on("change", function () {
      const itemId = $(this).data("id");
      if ($(this).is(":checked")) {
        selectedIds.push(itemId);
      } else {
        selectedIds = selectedIds.filter((id) => id !== itemId);
      }
      selectAllCheckbox.prop(
        "checked",
        tableCheckboxes.length === $("tbody input[type='checkbox']:checked").length
      );
      updateDeleteButton();
    });

    deleteButton.on("click", function () {
      if (selectedIds.length > 0) {
        const url = `/supplier/remove/confirmation?${$.param({
          "id_list[]": selectedIds,
        })}`;
        window.location.href = url;
      }
    });
  });
</script>
@endsection