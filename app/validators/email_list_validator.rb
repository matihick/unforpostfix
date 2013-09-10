class EmailListValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.split(',').all? { |v| v.strip =~ /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i }
      record.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.email_list'))
    end
  end
end
