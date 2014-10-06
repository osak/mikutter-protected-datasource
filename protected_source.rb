Plugin.create(:protected_source) do |plugin|
  filter_extract_datasources do |ds|
    [{protected: "鍵垢"}.merge(ds)]
  end

  on_appear do |messages|
    Plugin.call :extract_receive_message, :protected, messages.select{|m| m[:user][:protected]}
  end
end
