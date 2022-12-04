# 코드: basic-types/with-scope.exs

content = "Now is the time"

lp  =  with {:ok, file}   = File.open("/etc/passwd"),
 	    content       = IO.read(file, :all),  # 위와 같은 변수명 사용
            :ok           = File.close(file),
            [_, uid, gid] = Regex.run(~r/^_lp:.*?:(\d+):(\d+)/m, content)
       do
            "Group: #{gid}, User: #{uid}"
       end

IO.puts lp             # => Group: 25, User: 26
IO.puts content	       # => Now is the time
