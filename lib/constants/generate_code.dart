String generateCode() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  return List.generate(6, (i) => chars[(chars.length * i) % chars.length]).join();
}
