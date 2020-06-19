require 'sys/proctable'

module ApplicationHelper
  def process_info
    process = Sys::ProcTable.ps($$)
    {
      "NOW": Time.now,
      "COMM": process.comm,
      "CWD": Dir.pwd,
      "PID": process.pid,
      "PPID": process.ppid,
    }
  end
end
