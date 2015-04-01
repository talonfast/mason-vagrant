job_type :good_runner, "cd :path && bin/rails runner ':task'"

every 1.minute do
	good_runner 'Update.check_last'
end