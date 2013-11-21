/*
 * HTML 5 Sort With Query
 *
 *
 *
 * 
 */

 (function($) {

 	var dragging;
 	var lastElementEntered = null;
 	var placeholder;
 	var dropzone = null;
 	var elId;

 	$.fn.tsort = function(options) {
 		var method = String(options);
 		return this.each(function() {
 			if (/^enable|disable|destroy$/.test(method)) {
				var items = $(this).children($(this).data('items'));
				return;
			}	
			var index, selector, dropzoneSelector , items = $(this).children();
			if(options) {
				if(options.handle) {
					items.find(".handle").mousedown(function(event) {
						$(event.target).parent().attr('draggable','true');
					}).mouseup(function(event) {
						$(event.target).parent().attr('draggable','false');
					});
				}
				else {
					items.children().mousedown(function(event) {
						$(event.target).parent().attr('draggable','true');
					}).mouseup(function(event) {
						$(event.target).parent().attr('draggable','false');
					});
				}
			}
			else {
				items.mousedown(function(event) {
					$(event.target).attr('draggable','true');
				}).mouseup(function(event) {
					$(event.target).attr('draggable','false');
				});
				items.children().mousedown(function(event) {
					$(event.target).parent().attr('draggable','true');
				}).mouseup(function(event) {
					$(event.target).parent().attr('draggable','false');
				});
			}
			items.on('dragstart', function(event) {
				var dt = event.originalEvent.dataTransfer;
				dt.effectAllowed = 'move';
				dt.setData('Text', 'dummy');
				index = (dragging = $(event.target)).index();
				selector = dragging.data('selector');
				dropzoneSelector = dragging.parent().data('dropzone');				    
				var draggingClass = selector + "-dragging";
				dragging.addClass(draggingClass);
				var placeholderClass = selector + "-placeholder";
				placeholder = $('<li'  + ' class="' + placeholderClass + '"></li>');
			}).on('dragend', function(event) {
				event.preventDefault();
				var draggingClass = selector + "-dragging";
				dragging.removeClass(draggingClass);
				if(lastElementEntered!=null && dragging.data('selector') && lastElementEntered.data('selector')==dragging.data('selector')){
					if(lastElementEntered.index()<dragging.index())
						dragging.insertBefore(lastElementEntered);
					else
						dragging.insertAfter(lastElementEntered);
				}
				else if(dropzone!=null && dragging.data('selector')){
					dropzone.append(dragging);
				}				
				lastElementEntered = null;
				$(event.target).attr('draggable','false');
			}).on('dragenter drop', function(event) {
				if (event.type == 'drop') {
					event.stopPropagation();
					return false;
				}				
				event.preventDefault(); 			
				event.originalEvent.dataTransfer.dropEffect = 'move';
				if($(event.target).data('selector') == selector){
					lastElementEntered = $(event.target);
				}
				else {
					if($(event.target).data("dropzone") == dropzoneSelector){
						dropzone = $(event.target);
						lastElementEntered = null;
					}
					var auxSelector = "[data-selector|='" + selector + "']";
					if($(event.target).parents(auxSelector).length>0) {
						lastElementEntered = $(event.target).parents(auxSelector).first();
						if(lastElementEnteredAux.data("selector")==selector){
							dropzone = null;
						}
						else {
							lastElementEntered =  null;
						}						
					}
				}	
			}).not('a[href], img').on('selectstart.h5s', function() {
				this.dragDrop && this.dragDrop();
				return false;
			});
 		});
 	};
 })(jQuery);