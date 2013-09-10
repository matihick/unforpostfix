module DomainsHelper
  def normalize_alias_recipients(recipients)
    raw(recipients.each_slice(3).map { |elem| elem.join(', ') }.join('<br>'))
  end
end
