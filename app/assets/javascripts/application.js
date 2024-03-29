// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require bootstrap-datepicker
//= require_tree .


$(function() {

	$('#table_tasks').dataTable({
		"sDom": "<'row-fluid'<'span5'l><'span5'f><'span2 add-task'>r>t<'row-fluid'<'span6'i><'span6'p>>",
		"sPaginationType": "bootstrap",
		"aaSorting": [],
		"aLengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
		"iDisplayLength": 5,
		"aoColumnDefs": [
			{'bSortable': false, 'aTargets': [4, 5] }
		]
	});

	$('.add-task').live().html('<a href="/tasks/new" class="btn btn-primary pull-right">Add Task</a>');

	$('.datepicker').datepicker({format: 'yyyy-M-dd'});

});