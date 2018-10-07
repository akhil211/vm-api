require 'jwt'
class Auth
  ALGORITHM = 'HS256'
  def self.issue(data)
    exp = Time.now.to_i + 400 * 3600 #90 hours
    payload = { data: data, exp: exp }
    JWT.encode(
      payload,
      auth_secret,
      ALGORITHM)
  end
  def self.decode(token)
    JWT.decode(token,auth_secret,true, { algorithm: ALGORITHM }).try(:first)
  rescue => e
    false
  end
  def self.auth_secret
    ENV["AUTH_SECRET"]
  end
end
