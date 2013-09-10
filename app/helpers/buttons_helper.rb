module ButtonsHelper
  def link_to_cancel(path, args={})
    defaults = { class: 'btn btn-default' }
    args = defaults.merge(args)

    raw(link_to(I18n.t('helpers.submit.cancel'), path, args))
  end

  def link_to_delete(path, args={})
    defaults = { class: 'btn btn-danger', method: 'delete', data: { confirm: I18n.t('confirm.delete') } }
    args = defaults.merge(args)

    raw(link_to(I18n.t('helpers.submit.delete'), path, args))
  end

  def link_to_new(path, args={})
    defaults = { class: 'btn btn-default' }
    args = defaults.merge(args)

    raw(link_to(I18n.t('helpers.submit.new'), path, args))
  end

  def link_to_edit(path, args={})
    defaults = { class: 'btn btn-default' }
    args = defaults.merge(args)

    raw(link_to(I18n.t('helpers.submit.edit'), path, args))
  end
end
