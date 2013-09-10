module DomainsHelper
  def normalize_alias_recipients(recipients)
    raw(recipients.each_slice(4).map { |elem| elem.join(', ') }.join('<br>'))
  end
end
