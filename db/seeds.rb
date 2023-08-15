User.create!(
  email: "kari@pp.cl",
  password: "admin123",
  password_confirmation: "admin123",
  nombre: "Kari Piccolini",
  role: "g0d"
)

User.create!(
  email: "admin@example.com",
  password: "admin123",
  password_confirmation: "admin123",
  role: :fan
)

# Crea algunos usuarios regulares
5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password123",
    password_confirmation: "password123"
  )
end
