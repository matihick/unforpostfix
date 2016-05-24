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


# Sample starting configuration for new domain
# Workgroup.create({
#   name: 'My workspace'
# })

# Domain.create({
#   name: 'somedomain.com',
#   enabled: true,
#   workgroup_id: 1
# })

# User.create({
#   domain_id: 1,
#   name: 'John Snow',
#   email: 'jsnow@somedomain.com',
#   unencrypted_password: 'Snow1234',
#   password_confirmation: 'Snow1234',
#   role_code: 'administrator'
# })
