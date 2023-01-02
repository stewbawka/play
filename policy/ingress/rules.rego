package policy.ingress

# Add policy/rules to allow or deny ingress traffic

default allow = false

allow {
  input.attributes.request.http.method == "OPTIONS"
}

allow {
  input.attributes.request.http.method == "GET"
  input.parsed_path == ["jwks"]
}

allow {
  input.attributes.request.http.method == "GET"
  input.parsed_path == ["tokens", "me"]
}


allow {
  input.attributes.request.http.method == "POST"
  input.parsed_path == ["tokens"]
}

allow {
  input.attributes.request.http.method == "GET"
  input.parsed_path = ["users", user_id]
  jwt_payload := input.attributes.request.http.headers["x-jwt"]
  data_json := base64url.decode(jwt_payload)
  data_obj := json.unmarshal(data_json)
  user = json.unmarshal(data_obj.data)
  user.id == to_number(user_id)
}

allow {
  input.attributes.request.http.method == "GET"
  input.parsed_path = ["users", user_id]
  jwt_payload := input.attributes.request.http.headers["x-jwt"]
  data_json := base64url.decode(jwt_payload)
  data_obj := json.unmarshal(data_json)
  user = json.unmarshal(data_obj.data)
  user.id == to_number(user_id)
}

allow {
  input.attributes.request.http.method == "GET"
  input.parsed_path == ["api", "tracks"]
}

