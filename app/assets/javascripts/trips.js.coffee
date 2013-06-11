# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# jQuery ->
#   $('#trip_begin_on').datepicker
#     dateFormat: 'yy-mm-dd'
#   $('#trip_end_on').datepicker
#     dateFormat: 'yy-mm-dd'
#   $('form').on 'click', '.remove_fields', (event) ->
#     $(this).prev('input[type=hidden]').val('1')
#     $(this).closest('fieldset').hide()
#     event.preventDefault()
#   $('form').on 'click', '.add_fields', (event) ->
#     time = new Date().getTime()
#     regexp = new RegExp($(this).data('id'), 'g')
#     $(this).before($(this).data('fields').replace(regexp, time))
#     event.preventDefault()

jQuery ($) ->
  $('#trip_begin_on').datepicker
    dateFormat: 'yy-mm-dd'
  $('#trip_end_on').datepicker
    dateFormat: 'yy-mm-dd'

  resourcesOptions = {
    itemSelector: ".resource",
    containerSelector: ".resources-container",
    addSelector: ".resource-add",
    removeSelector: ".resource-remove",
    itemTemplateSelector: ".resource.template",
    new_item_index: "new_resource_index"
  }

  $(".project-form").nestedFields({
    itemSelector: ".task",
    containerSelector: ".tasks-container",
    addSelector: ".task-add",
    removeSelector: ".task-remove",
    itemTemplateSelector: ".task.template",
    new_item_index: "new_task_index",
    afterInsert: (item) ->
      # Applies nestedFields to this task's resources
      item.find(".nested-level-2").nestedFields(resourcesOptions)
      # Inserts a resource item
      item.find(".nested-level-2").nestedFields("insert")
  })

  # Applies nestedFields to all projects on page
  $(".project-form").find(".nested-level-2").nestedFields(resourcesOptions)
