Capistrano::Configuration.instance(:must_exist).load do
  after "deploy:symlink", "deploy:crontab:update"
  
  namespace :deploy do
    namespace :crontab do
    
      desc "Update the crontab file"
      task :update, :roles => :cron do
        if stage
          run "cd #{release_path} && whenever --set environment=#{stage} --update-crontab #{application}"
        else
          run "cd #{release_path} && whenever --update-crontab #{application}"
        end
      end
    
      desc "Show the current installed crontab"
      task :show, :roles => :cron do
        run "crontab -l"
      end
      
    end
  end
end