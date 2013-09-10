class DomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^(((\w+\-+)|(\w+\.))*\w{1,63}(\.[a-zA-Z]{2,6} )?)$/i
      record.errors[attribute] << (options[:message] || I18n.t('activerecord.errors.messages.domain'))
    end
  end
end
