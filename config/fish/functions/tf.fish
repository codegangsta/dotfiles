function tf --wraps=terraform --description 'alias tf=terraform'
  op run -- terraform $argv; 
end
