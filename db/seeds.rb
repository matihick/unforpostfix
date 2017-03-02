[
  { code: :workshop_manager, name: 'Supervisor de grupo' },
  { code: :administrator, name: 'Administrador' },
  { code: :limited, name: 'Acceso limitado' }
].each do |role_attrs|
  role = Role.find_by(code: role_attrs[:code])

  if role.nil?
    role = Role.create(role_attrs)
  else
    role.update_attributes({
      name: role_attrs[:name]
    })
  end
end
