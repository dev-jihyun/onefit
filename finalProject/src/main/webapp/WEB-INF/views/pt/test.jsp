<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<head>
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 <!--  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"> -->
</head>

<body>
<jsp:include page="../common/ptNav.jsp" />
  <div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <table class="table table-bordered table-hover" id="annotations">
          <thead>
            <tr>
              <th class="text-center col-md-4">
                Name
              </th>
              <th class="text-center col-md-4">
                Value
              </th>
              <th class="text-center col-md-1"></th>
            </tr>
          </thead>
          <tbody>
            <tr id='annotations_template' title='annotation'>
              <td>
                <input type="text" name='annotation_name' placeholder='Keyword (i.e. Disease, Cell, Tissue)' class="form-control" />
              </td>
              <td>
                <input type="text" name='annotation_value' placeholder='Value (i.e. Lung, Carcinoma)' class="form-control" />
              </td>
              <td>
                <button name="annotation_add" class='btn btn-success glyphicon glyphicon-plus row-add'></button>
                <button name="annotation_delete" class='btn btn-danger glyphicon glyphicon-remove row-remove'></button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
  <!-- <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
</body>


<script>

var TableManager = function(tableId, rowTag) {
	  var mgr = {};
	  mgr.tableId = tableId;
	  mgr.rowTag = rowTag;

	  mgr.appendRow = function(obj) {
	    var table = $("#" + mgr.tableId);
	    var newRow = table.find("#" + mgr.tableId + "_template").clone();
	    mgr.wireUpRow(newRow);
	    mgr.setRowData(newRow, obj);
	    table.append(newRow);
	  }

	  mgr.appendEmptyRow = function() {
	    mgr.appendRow({
	      name: null,
	      value: null
	    });
	  }

	  mgr.prependRow = function(obj) {
	    var table = $("#" + mgr.tableId);
	    var newRow = table.find("#" + mgr.tableId + "_template").clone();
	    mgr.wireUpRow(newRow);
	    mgr.setRowData(newRow, obj);
	    table.prepend(newRow);
	  }

	  mgr.wireUpRow = function(row) {
	    row.find('button[name="' + mgr.rowTag + '_add"]').click(function() {
	      mgr.appendEmptyRow();
	    });

	    row.find('button[name="' + mgr.rowTag + '_delete"]').click(function(evt) {
	      var table = $("#" + mgr.tableId);
	      var numTableRows = table.find('tr[title="annotation"]').size();
	      if (numTableRows > 1) {
	        $(evt.target).parents('tr').remove();
	      }
	    });
	  }

	  mgr.getRowData = function(row) {
	    var data = {};
	    var prefix = mgr.rowTag + "_";
	    $(row).find('input,select,textarea').each(function(index, element) {
	      var name = $(element).attr('name');
	      var bareName = name.slice(name.indexOf(prefix) + prefix.length);

	      data[bareName] = $(element).val();
	    });
	    return data;
	  }

	  mgr.setRowData = function(row, obj) {
	    Object.getOwnPropertyNames(obj).forEach(function(name, idx, array) {
	      row.find('input[name="' + mgr.rowTag + '_' + name + '"]').val(obj[name]);
	    });
	  }

	  var table = $("#" + mgr.tableId);
	  mgr.wireUpRow(table.find("#" + mgr.tableId + "_template"));

	  return mgr;
	}

	var AnnotationTableManager = new TableManager('annotations', 'annotation');

	$(document).ready(function() {
	  AnnotationTableManager.prependRow({
	    "name": "Tissue",
	    "value": "Lung"
	  });
	});
	
	</script>
</body>
</html>