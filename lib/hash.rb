class Hash
  def get_settings(default, *args)
    return default if args.size == 0 or !has_key? args[0]
    value = values_at(args[0])[0]
    return value if args.size < 2
    return default unless value.is_a? Hash and value.has_key? args[1]
    value.values_at(args[1])[0]
  end
end
